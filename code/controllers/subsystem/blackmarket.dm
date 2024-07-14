SUBSYSTEM_DEF(blackmarket)
	name		 = "Blackmarket"
	flags		 = SS_BACKGROUND
	init_order	 = INIT_ORDER_DEFAULT

	/// Descriptions for each shipping methods.
	var/shipping_method_descriptions = list(
		SHIPPING_METHOD_LAUNCH="Launches the item at your coordinates from across deep space. Cheap, but you might not recieve your item at all. We recommend being stationary in space, away from any large structures, for best results.",
		SHIPPING_METHOD_DEAD_DROP="Our couriers will fire your item via orbital drop pod at the nearest safe planetary structure for discreet pick up. Reliable, but you'll have to find your package yourself. We accept no responsibility for lost packages if you try to do this in space or the outpost.",
		SHIPPING_METHOD_LTSRBT="Long-To-Short-Range-Bluespace-Transceiver, a machine that prepares items at a remote storage location and then teleports them to the location of the LTRSBT."
	)

	/// List of all existing markets.
	var/list/datum/blackmarket_market/markets		= list()
	/// List of existing ltsrbts.
	var/list/obj/machinery/ltsrbt/telepads			= list()
	/// Currently queued purchases.
	var/list/queued_purchases 						= list()

/datum/controller/subsystem/blackmarket/Initialize(timeofday)
	for(var/market in subtypesof(/datum/blackmarket_market))
		markets[market] += new market

	for(var/item in subtypesof(/datum/blackmarket_item))
		var/datum/blackmarket_item/I = new item()
		if(!I.item)
			continue

		for(var/M in I.markets)
			if(!markets[M])
				stack_trace("SSblackmarket: Item [I] available in market that does not exist.")
				continue
			markets[M].add_item(item, FALSE)

		qdel(I)
	. = ..()

/datum/controller/subsystem/blackmarket/fire(resumed)
	while(length(queued_purchases))
		var/datum/blackmarket_purchase/purchase = queued_purchases[1]
		queued_purchases.Cut(1,2)

		// Uh oh, uplink is gone. We will just keep the money and you will not get your order.
		if(!purchase.uplink || QDELETED(purchase.uplink))
			queued_purchases -= purchase
			qdel(purchase)
			continue

		switch(purchase.method)
			// Find a ltsrbt pad and make it handle the shipping.
			if(SHIPPING_METHOD_LTSRBT)
				if(!purchase.uplink.target)
					continue

				var/obj/machinery/ltsrbt/pad = purchase.uplink.target

				to_chat(recursive_loc_check(purchase.uplink.loc, /mob), "<span class='notice'>[purchase.uplink] flashes a message noting that the order is being processed by [pad].</span>")

				queued_purchases -= purchase
				pad.add_to_queue(purchase)
			// Get the current location of the uplink if it exists, then throws the item from space at the station from a random direction.
			if(SHIPPING_METHOD_LAUNCH)
				var/startSide = pick(GLOB.cardinals)
				var/turf/T = get_turf(purchase.uplink)
				var/datum/virtual_level/vlevel = T.get_virtual_level()
				var/pickedloc = vlevel.get_side_turf(startSide)

				var/atom/movable/item = purchase.entry.spawn_item(pickedloc)
				item.inertia_moving = TRUE
				item.safe_throw_at(purchase.uplink, 3, 3, spin = FALSE)

				to_chat(recursive_loc_check(purchase.uplink.loc, /mob), "<span class='notice'>[purchase.uplink] flashes a message noting the order is being launched at your coordinates from [dir2text(startSide)].</span>")

				queued_purchases -= purchase
				qdel(purchase)
			// Drop the order somewhere on the planet's ruin the uplink is on
			if(SHIPPING_METHOD_DEAD_DROP)
				var/datum/overmap/dynamic/overmap_loc = SSovermap.get_overmap_object_by_location(purchase.uplink)
				if(overmap_loc.ruin_turfs)
					for(var/turf/potential_turf in pick(overmap_loc.ruin_turfs))
						if(!isfloorturf(potential_turf))
							continue
						var/turf/open/floor/potential_floor = potential_turf
						if(islava(potential_floor)) //chasms aren't /floor, and so are pre-filtered
							var/turf/open/lava/potential_lava_floor = potential_floor
							if(!potential_lava_floor.is_safe())
								continue
						//yippee, there's a viable turf for the package to land on
						var/obj/structure/closet/supplypod/pod = new()
						pod.setStyle(STYLE_BOX)
						var/atom/movable/item = purchase.entry.spawn_item(pod)
						pod.explosionSize = list(0,0,0,0)
						item.forceMove(pod)
						new /obj/effect/pod_landingzone(get_turf(potential_floor), pod)

						to_chat(recursive_loc_check(purchase.uplink.loc, /mob), "<span class='notice'>[purchase.uplink] flashes a message noting the order is being delivered.</span>")

						queued_purchases -= purchase
						qdel(purchase)
					to_chat(recursive_loc_check(purchase.uplink.loc, /mob), "<span class='notice'>Welp something got fucked.</span>")
		if(MC_TICK_CHECK)
			break

/// Used to make a teleportation effect as do_teleport does not like moving items from nullspace.
/datum/controller/subsystem/blackmarket/proc/fake_teleport(atom/movable/item, turf/target)
	item.forceMove(target)
	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(5, 1, target)
	sparks.attach(item)
	sparks.start()

/// Used to add /datum/blackmarket_purchase to queued_purchases var. Returns TRUE when queued.
/datum/controller/subsystem/blackmarket/proc/queue_item(datum/blackmarket_purchase/P)
	if(P.method == SHIPPING_METHOD_LTSRBT && !P.uplink.target)
		return FALSE
	queued_purchases += P
	return TRUE
