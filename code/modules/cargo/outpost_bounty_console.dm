
GLOBAL_LIST_INIT(outpost_exports, gen_outpost_exports())

#warn remove, use /datum/export code
/proc/gen_outpost_exports()
	var/ret_list = list()

	for(var/datum/export/o_b as anything in subtypesof(/datum/export))
		if(!(o_b::unit_name)) //If it has no name lets assume its bad or a parent type
			continue
		ret_list += new o_b()
	return ret_list

#warn remove /obj/machinery/computer/bounty, /obj/machinery/mission_board, /datum/bounty, /datum/computer_file/program/mission_board, associated circuits,

/obj/machinery/outpost_selling_pad
	name = "bounty redemption pad"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "lpad-idle-o"

/obj/machinery/outpost_selling_pad/proc/get_other_atoms()
	. = list()
	for(var/atom/movable/AM in get_turf(src))
		if(AM == src)
			continue
		if(AM.anchored)
			continue
		. += AM

/obj/machinery/computer/outpost_export_console
	name = "outpost bounty console"
	desc = "A console used to interact with the exports and bounty database."

	var/obj/machinery/outpost_selling_pad/linked_pad
	var/list/cached_valid_exports = list()

/obj/machinery/computer/outpost_export_console/LateInitialize()
	. = ..()
	if(istype(get_area(src.loc), /area/outpost))
		var/obj/machinery/outpost_selling_pad/pad = locate() in range(2,src)
		linked_pad = pad
	desc += "This one is not linked to any outpost."

/obj/machinery/computer/outpost_export_console/proc/cache_valid_exports()
	cached_valid_exports = list()
	if(linked_pad)
		var/items_on_pad = linked_pad.get_other_atoms()
		for(var/datum/export/exp in GLOB.outpost_exports)
			for(var/atom/exp_atom in items_on_pad)
				if(exp.applies_to(exp_atom))
					if(!cached_valid_exports[exp])
						cached_valid_exports[exp] = list()
					cached_valid_exports[exp] += list(exp_atom)


#warn probably most similar to the traitor uplink, except there are no "buy" buttons
/obj/machinery/computer/outpost_export_console/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "OutpostExport", name)
		ui.open()

/obj/machinery/computer/outpost_export_console/ui_data(mob/user)
	var/list/data = list()

	#warn temp. we should run this on like, atom entered or other signals instead
	cache_valid_exports()

	data["redeemExports"] = list()

	for(var/datum/export/cached_exp as anything in cached_valid_exports)
		var/list/atom/atoms_list = cached_valid_exports[cached_exp]

		var/list/cached_exp_data = list()
		cached_exp_data["type"] = cached_exp.type
		cached_exp_data["name"] = cached_exp.unit_name
		cached_exp_data["desc"] = cached_exp.desc
		cached_exp_data["value"] = cached_exp.calc_total_payout(atoms_list)

		cached_exp_data["exportAtoms"] = list()
		for(var/atom/exp_atom as anything in atoms_list)
			cached_exp_data["exportAtoms"] += exp_atom.name

		data["redeemExports"] += list(cached_exp_data) // gotta wrap it in a list because byond sucks

	return data

/obj/machinery/computer/outpost_export_console/ui_static_data(mob/user)
	var/list/data = list()

	data["allExports"] = list()
	for(var/datum/export/exp as anything in GLOB.outpost_exports)
		var/list/exp_data = list()

		exp_data["type"] = exp.type
		exp_data["name"] = exp.unit_name
		exp_data["value"] = exp.get_payout_text()
		exp_data["desc"] = exp.desc
		exp_data["exportAtoms"] = list()

		data["allExports"] += list(exp_data) // need to wrap with an extra list because byond sucks

	return data

/obj/machinery/computer/outpost_export_console/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	#warn we need a redeem button per-export and an "eject" button (for all export items, maybe, but easier if it's just one)
	#warn all other behavior should be handled locally by the tgui instance
	switch(action)
		if("redeem")
			var/datum/export/redeemed_exp = locate(text2path(params["redeem_type"])) in cached_valid_exports
			if(redeemed_exp == null || length(cached_valid_exports[redeemed_exp]) == 0)
				#warn there was an error
			else
				redeem_export(redeemed_exp)
			update_static_data(usr, ui)
			return TRUE

/obj/machinery/computer/outpost_export_console/proc/redeem_export(datum/export/exp)
	if(!(exp in cached_valid_exports))
		#warn fuck
		return FALSE
	var/total_payout = 0
	for(var/atom/exp_atom as anything in cached_valid_exports[exp])
		if(!exp.applies_to(exp_atom))
			#warn fuck
			return FALSE
		total_payout += exp.sell_object(exp_atom, dry_run = FALSE, apply_elastic = TRUE)

		cached_valid_exports[exp] -= exp_atom
		qdel(exp_atom)

	cached_valid_exports -= exp

	do_sparks(5, 0, linked_pad.loc)
	new /obj/item/spacecash/bundle(linked_pad.loc, total_payout)
	playsound(linked_pad.loc, pick(list('sound/machines/coindrop.ogg', 'sound/machines/coindrop2.ogg')), 40, TRUE)
	return TRUE
