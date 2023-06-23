/datum/autowiki/ship
	page = "Template:Autowiki/Content/Ships"

/datum/autowiki/ship/generate()
	var/output = ""

	for(var/shipname in SSmapping.shuttle_templates)
		var/datum/map_template/shuttle/shiptest/ship = SSmapping.shuttle_templates[shipname]

		if(!istype(ship))
			continue

		var/size = "Unknown"
		var/longest_dimension = max(ship.width, ship.height)
		switch(longest_dimension)
			if(0 to 19)
				size = "Small"
			if(20 to 39)
				size = "Medium"
			if(40 to 56)
				size = "Large"
			if(57 to INFINITY)
				size = "Undockable" //let's hope this is never the case

		output += "\n\n" + include_template("Autowiki/Ship", list(
			"name" = escape_value(ship.name),
			"shortname" = escape_value(ship.short_name) || escape_value(ship.name),
			"description" = escape_value(ship.description),
			"prefix" = escape_value(ship.prefix),
			"limit" = ship.limit,
			"crewCount" = count_crew(ship.job_slots),
			"crew" = format_crew_list(ship.job_slots),
			"enabled" = ship.enabled ? "Yes" : "No",
			"size" = size
		))

	return output

/datum/autowiki/ship/proc/count_crew(list/crew)
	var/output = 0

	for(var/job in crew)
		output += crew[job]

	return output

/datum/autowiki/ship/proc/format_crew_list(list/crew)
	var/output = ""

	var/static/list/job_icon_list = list()
	var/mob/living/carbon/human/dummy/wiki_dummy = new(locate(1,1,1))
	wiki_dummy.setDir(SOUTH)
	for(var/datum/job/job as anything in crew)

		var/filename = SANITIZE_FILENAME(escape_value(format_text(initial(job.outfit.name))))

		//Only generate each unique outfit once
		if(!(filename in job_icon_list))
			//Limited to just the humanoid-compliant roundstart species, but at least it's not just human.
			wiki_dummy.set_species(pick(list(/datum/species/ethereal, /datum/species/human, /datum/species/ipc, /datum/species/lizard, /datum/species/moth, /datum/species/spider)))
			job.equip(wiki_dummy, TRUE, FALSE)
			COMPILE_OVERLAYS(wiki_dummy)
			var/icon/wiki_icon = icon(getFlatIcon(wiki_dummy), frame = 1)

			//Make all icons 32x32 for wiki sizing consistency
			if(wiki_icon.Height() != 32 || wiki_icon.Width() != 32)
				wiki_icon.Crop(1, 1, 32, 32)

			upload_icon(wiki_icon, filename)

		output += include_template("Autowiki/ShipCrewMember", list(
			"name" = escape_value(job.name),
			"officer" = job.officer ? "Yes" : "No",
			"slots" = crew[job],
			"icon" = filename
		))

	return output
