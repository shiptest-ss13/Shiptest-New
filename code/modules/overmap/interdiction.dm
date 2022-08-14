#define SPEED_THROW_STRENGTH_MULT 0.5

/obj/machinery/computer/interdiction
	name = "interdiction control"
	desc = "Used to attempt interdiction on a nearby ship."
	icon_screen = "navigation"
	icon_keyboard = "tech_key"
	circuit = /obj/item/circuitboard/computer/interdiction
	light_color = LIGHT_COLOR_FLARE
	clicksound = null

	COOLDOWN_DECLARE(scan_cooldown)
	var/datum/overmap/ship/controlled/current_ship
	var/datum/overmap/ship/controlled/interdicting
	var/end_timer
	var/datum/beam/tether
	var/range = 2

/obj/machinery/computer/interdiction/Destroy()
	end_interdiction()
	current_ship = null
	return ..()

/obj/machinery/computer/interdiction/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	current_ship = port.current_ship

/obj/machinery/computer/interdiction/proc/scan_for_targets()
	if(!current_ship)
		return FALSE

	if(current_ship.docked_to)
		say("Cannot perform interdiction while docked.")
		return FALSE

	if(!COOLDOWN_FINISHED(src, scan_cooldown))
		say("Sensors recharging.")
		return FALSE
	COOLDOWN_START(src, scan_cooldown, 5 SECONDS)

	. = list()
	for(var/obj/overmap/token in orange(range, current_ship.token))
		if(istype(token.parent, /datum/overmap/ship/controlled))
			. += token.parent

/obj/machinery/computer/interdiction/attack_hand(mob/living/user)
	if(!Adjacent(user))
		return
	if(!istype(user))
		return

	if(interdicting)
		if(tgui_alert(user, "Cancel Interdiction", "Interdiction", list("Yes", "No")) != "Yes")
			return
		interdicting.interdictor = null
		interdicting = null
		say("Released Interdiction.")
		return

	var/list/targets = scan_for_targets()
	if(targets == FALSE)
		return
	if(!length(targets))
		say("No valid targets in sensor range.")
		return

	var/list/sorted_targets = sortList(targets, .proc/cmp_ship_dist)
	var/list/options = list()
	for(var/datum/overmap/ship/controlled/target as anything in sorted_targets)
		options["[get_dist(current_ship.token, target.token)] - [target.name]"] = target

	var/target = tgui_input_list(user, "Select Ship", "Interdiction", options)
	if(!target || !(target in options))
		return

	do_interdiction(user, options[target])

/obj/machinery/computer/interdiction/proc/cmp_ship_dist(datum/overmap/t1, datum/overmap/t2)
	return cmp_numeric_asc(get_dist(current_ship.token, t1.token), get_dist(current_ship.token, t2.token))

/obj/machinery/computer/interdiction/proc/throw_ship_contents(datum/overmap/ship/controlled/target, dir, strength)
	for(var/area/area as anything in target.shuttle_port.shuttle_areas)
		for(var/atom/movable/movable in area)
			var/turf/target_turf = get_edge_target_turf(movable, dir)
			movable.throw_at(target_turf, 2 * strength, strength)

/obj/machinery/computer/interdiction/proc/do_interdiction(mob/user, datum/overmap/ship/controlled/target)
	message_admins("[user] is attempting to perform an interdiction to [target] from [current_ship]")

	var/target_x
	var/target_y
	if(length(target.get_nearby_overmap_objects()))
		var/target_found = FALSE
		for(var/dir in GLOB.cardinals|GLOB.diagonals)
			if(target_found)
				break
			var/c_x = target.x
			var/c_y = target.y
			switch(dir)
				if(NORTH)
					c_y++
				if(SOUTH)
					c_y--
				if(EAST)
					c_x++
				if(WEST)
					c_x--
				if(NORTHWEST)
					c_y++
					c_x--
				if(NORTHEAST)
					c_y++
					c_x++
				if(SOUTHWEST)
					c_y--
					c_x--
				if(SOUTHEAST)
					c_y--
					c_x++
			var/list/overmap_square = SSovermap.overmap_container[c_x][c_y]
			if(length(overmap_square))
				continue
			target_x = c_x
			target_y = c_y
			target_found = TRUE

		if(!target_found)
			say("Failed to find valid Interdiction point!")
			return
	else
		target_x = target.x
		target_y = target.y

	interdicting = target
	target.interdictor = src

	var/their_speed = target.get_speed()
	if(their_speed >= 20) // this is gonna hurt, you and me
		if(tgui_alert(user, "Radars indicitate they are going very quickly. Are you sure you want to do this?", "Interdiction", list("Yes", "No"), 10 SECONDS) != "Yes")
			interdicting = null
			target.interdictor = null
			return

		var/heading = target.get_heading()
		throw_ship_contents(target, heading, their_speed * SPEED_THROW_STRENGTH_MULT)
		throw_ship_contents(current_ship, turn(heading, 180), their_speed * SPEED_THROW_STRENGTH_MULT)

	var/datum/overmap/dynamic/empty/point = new(list("x" = target_x, "y" = target_y))
	if(!point)
		message_admins("failed to create interdiction event for [src]")
		return

	point.name = "Interdiction Point"
	point.token.icon_state = "interdiction"
	target.Dock(point, force=TRUE)
	tether = point.token.Beam(current_ship.token, time=INFINITY, maxdistance=50)
	end_timer = addtimer(CALLBACK(src, .proc/end_interdiction), 20 SECONDS, TIMER_STOPPABLE|TIMER_OVERRIDE|TIMER_UNIQUE)
	say("Interdiction now in effect for 20 seconds. Dismantle or de-powerment of this console will cause an early release.")

	for(var/obj/announce_target as anything in list(target.helms[1], current_ship.helms[1]))
		priority_announce("Interdiction is now in effect on target \"[target]\"", "Interdiction Tether Launched", 'sound/misc/announce.ogg', "interdiction", "Interdiction ([current_ship])", zlevel=announce_target.virtual_z())

/obj/machinery/computer/interdiction/power_change()
	if(!is_operational())
		end_interdiction()
	return ..()

/obj/machinery/computer/interdiction/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(panel_open)
		end_interdiction()

/obj/machinery/computer/interdiction/proc/end_interdiction()
	deltimer(end_timer)
	if(!interdicting)
		return
	QDEL_NULL(tether)
	for(var/obj/announce_target as anything in list(interdicting.helms[1], current_ship.helms[1]))
		priority_announce("Interdiction is no longer in effect on target \"[interdicting]\"", "Interdiction Tether Dissipated", 'sound/misc/announce.ogg', "interdiction", "Interdiction ([current_ship])", zlevel=announce_target.virtual_z())
	interdicting.interdictor = null
	interdicting = null
