//Pocket pouches, specialized storage expansions
/obj/item/storage/pouch
	name = "basic pouch"
	desc = "A small pouch for storing items."
	icon = 'icons/obj/storage.dmi'
	icon_state = "pouch"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL
	var/empty = FALSE

/obj/item/storage/pouch/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 2
	STR.max_combined_w_class = 24

/obj/item/storage/pouch/medical
	name = "IFAK pouch"
	desc = "An individual first aid kit, for use preventing and treating battlefield injuries."
	icon = 'icons/obj/storage.dmi'
	icon_state = "pouch_medical"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/pouch/medical/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL //holds the same equipment as a medibelt
	STR.max_items = 4
	STR.max_combined_w_class = 24
	STR.set_holdable(list(
		/obj/item/stack/medical/gauze,
		/obj/item/stack/medical/suture,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/mesh,
		/obj/item/stack/medical/ointment,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/structure,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/hypospray/medipen,
		/obj/item/reagent_containers/glass/bottle/vial
		))

/obj/item/storage/pouch/medical/examine_more(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>You examine [src] closer. It can hold: \
		- Medical Gauze, Sutures, Bruise Packs, Meshes, and Ointments \
		- Splints, Structural Reinforcements, Pill Bottles and Pills \
		- Syringes, Medical Pens and Hypovials"
	else
		. += "<span class='warning'>You try to examine [src] closer, but you're too far away.</span>"

/obj/item/storage/pouch/medical/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze/five = 1,
		/obj/item/stack/medical/suture/five = 1,
		/obj/item/stack/medical/mesh/five = 1,
		/obj/item/reagent_containers/hypospray/medipen = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/pouch/ammo
	name = "ammunition pouch"
	desc = "An ammunition pouch, commonly used by soldiers to hold additional ammo in an accessible location."
	icon = 'icons/obj/storage.dmi'
	icon_state = "pouch_ammo"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/pouch/ammo/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 3
	STR.max_combined_w_class = 24
	STR.set_holdable(list(
		/obj/item/ammo_box/magazine/ammo_stack,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box/magazine,
		/obj/item/ammo_box/c38,
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/a858,
		/obj/item/ammo_box/vickland_a308,
		/obj/item/ammo_box/a300,
		/obj/item/ammo_box/a762_stripper,
		/obj/item/ammo_box/amagpellet_claris,
		/obj/item/stock_parts/cell/gun
		))

/obj/item/storage/pouch/medical/examine_more(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>You examine [src] closer. It can hold: \
		- Magazines, Loose Ammo, and Speedloaders"
	else
		. += "<span class='warning'>You try to examine [src] closer, but you're too far away.</span>"

/obj/item/storage/pouch/engi
	name = "engineering pouch"
	desc = "An orange pouch used to hold a small amount of tools or supplies, often used for emergency repair kits."
	icon = 'icons/obj/storage.dmi'
	icon_state = "pouch_engi"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/pouch/engi/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 4
	STR.max_combined_w_class = 24
	STR.set_holdable(list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/t_scanner,
		/obj/item/analyzer,
		/obj/item/geiger_counter,
		/obj/item/stack/medical/structure,
		/obj/item/extinguisher/mini,
		/obj/item/toy/crayon/spraycan,
		/obj/item/clothing/gloves
		))

/obj/item/storage/pouch/engi/examine_more(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>You examine [src] closer. It can hold: \
		- Tools, Flashlights, Structural Supports, Spraycans and Gloves"
	else
		. += "<span class='warning'>You try to examine [src] closer, but you're too far away.</span>"

/obj/item/storage/pouch/engi/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/crowbar = 1,
		/obj/item/screwdriver = 1,
		/obj/item/wrench,
		/obj/item/weldingtool/mini = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/pouch/grenade
	name = "grenade pouch"
	desc = "A row of small pouches intended for holding explosives safely, primarily grenades."
	icon = 'icons/obj/storage.dmi'
	icon_state = "pouch_grenade"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/pouch/grenade/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 3
	STR.max_combined_w_class = 24
	STR.set_holdable(list(
		/obj/item/grenade
		))

/obj/item/storage/pouch/grenade/examine_more(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>You examine [src] closer. It can hold: \
		- Handheld Grenades and C4"
	else
		. += "<span class='warning'>You try to examine [src] closer, but you're too far away.</span>"

/obj/item/storage/pouch/squad
	name = "squad leader's pouch"
	desc = "A light blue pouch used by squad leaders everywhere to hold command equipment."
	icon = 'icons/obj/storage.dmi'
	icon_state = "pouch_squad"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	throw_speed = 3
	throw_range = 7
	slot_flags = ITEM_SLOT_POCKETS
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/pouch/squad/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 5
	STR.max_combined_w_class = 24
	STR.set_holdable(list(
		/obj/item/modular_computer/tablet,
		/obj/item/radio,
		/obj/item/megaphone,
		/obj/item/assembly/signaler,
		/obj/item/binoculars,
		/obj/item/folder,
		/obj/item/clipboard,
		/obj/item/flashlight,
		/obj/item/paper_bin,
		/obj/item/paper,
		/obj/item/pen,
		/obj/item/geiger_counter,
		/obj/item/toy/crayon/spraycan,
		/obj/item/stack/marker_beacon,
		/obj/item/reagent_containers/glass/rag
		))

/obj/item/storage/pouch/squad/examine_more(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>You examine [src] closer. It can hold: \
		- Tablets, Radios, Megaphones, Signalers, Flashlights and Binoculars \
		- Geiger Counters, Marker Beacons, and Spraycans \
		- Paperwork Supplies"
	else
		. += "<span class='warning'>You try to examine [src] closer, but you're too far away.</span>"
