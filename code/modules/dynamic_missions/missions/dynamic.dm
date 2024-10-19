/datum/mission/dynamic
	value = 2000
	var/setpiece_poi = /obj/effect/landmark/mission_poi/main
	var/setpiece_item
	///Specific item uses an exact item, if false it will allow type or any subtype
	var/specific_item = TRUE
	var/atom/movable/required_item

/datum/mission/dynamic/generate_mission_details()
	. = ..()
	setpiece_item = pick(setpiece_item)

/datum/mission/dynamic/spawn_mission_setpiece(datum/overmap/dynamic/planet)
	if(isnull(mission_index))
		stack_trace("[src] does not have a mission index")
	for(var/obj/effect/landmark/mission_poi/mission_poi in planet.spawned_mission_pois)
		if(!isnull(mission_poi.mission_index) && (mission_index != mission_poi.mission_index))
			continue
		if(!istype(mission_poi, /obj/effect/landmark/mission_poi/main))
			continue

		if(istype(mission_poi, setpiece_poi))
			//Spawns the item or gets it via use_poi then sets it as bound so the mission fails if its deleted
			spawn_main_piece(mission_poi, planet)
			break

	spawn_custom_pois(planet)

	// Reiterate through the loop and attemp to spawn any mission that matches our index but dont pass any type so it will need its own
	for(var/obj/effect/landmark/mission_poi/mission_poi in planet.spawned_mission_pois)
		if(isnull(mission_poi.mission_index) || (mission_index != mission_poi.mission_index))
			continue
		if(istype(mission_poi, /obj/effect/landmark/mission_poi/main) || !ispath(mission_poi.type_to_spawn))
			continue

		mission_poi.use_poi()

/datum/mission/dynamic/proc/spawn_main_piece(obj/effect/landmark/mission_poi/mission_poi, datum/overmap/dynamic/planet)
	required_item =	mission_poi.use_poi(setpiece_item)
	set_bound(required_item, mission_poi.loc, null, TRUE, TRUE)
	if(!isatom(required_item))
		stack_trace("[src] did not generate a required item.")
		qdel(src)

/// For handling logic outside of main piece thats too complex for the basic reiteration or you want to not require indexs to match.
/datum/mission/dynamic/proc/spawn_custom_pois(datum/overmap/dynamic/planet)
	return

/datum/mission/dynamic/can_turn_in(atom/movable/item_to_check)
	if(istype(required_item))
		if(specific_item)
			if(item_to_check == required_item)
				return TRUE
		else
			if(istype(item_to_check, required_item.type))
				return TRUE

/datum/mission/dynamic/data_reterival
	name = "data recovery"
	setpiece_item = list(
		/obj/item/research_notes/loot,
		/obj/item/documents
	)

/datum/mission/dynamic/data_reterival/generate_mission_details()
	. = ..()
	if(ispath(setpiece_item, /obj/item))
		var/obj/item/mission_item = setpiece_item
		desc = "We are looking for a [mission_item::name]"

/obj/effect/landmark/mission_poi/main/blackbox
	icon_state = "main_blackbox"
	already_spawned = TRUE

/obj/effect/landmark/mission_poi/main/blackbox/use_poi(_type_to_spawn)
	var/obj/machinery/blackbox_recorder/recorder = ..()
	if(istype(recorder, /obj/machinery/blackbox_recorder))
		if(istype(recorder.stored, /obj/item/blackbox))
			return recorder.stored

/datum/mission/dynamic/blackbox
	name = "blackbox recovery"
	desc = "Recover some lost logs from this ruin's blackbox recorder."
	setpiece_item = /obj/machinery/blackbox_recorder

/datum/mission/dynamic/nt_files
	name = "NT asset recovery"
	value = 1250
	mission_reward = list(
		/obj/item/gun/energy/e_gun/old,
		/obj/item/gun/energy/laser/retro,
		/obj/item/gun/energy/laser/captain
	)
	faction = /datum/faction/nt
	setpiece_item = /obj/item/documents/nanotrasen

/datum/mission/dynamic/nt_files/generate_mission_details()
	. = ..()
	name = pick("NT asset recovery", "asset recovery requested ASAP")
	author = "Captain [random_species_name()]"
	desc = pick("Look- long story short, I need this folder retrieved. You don't ask why, I make sure you get paid.")
