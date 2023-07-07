//Disks for transporting design datums to be used in autolathes.

/*Available illustrations - use with illustration var on disks.
	nt_old				Nanotrasen logo, single N
	nt					Nanotrasen logo, NT
	nt_n				Nanotrasen logo, modern N
	dna_words			text, DNA
	nuke_useless		some squiggles
	nuke_useless_alt	triangle thing?
	syndicate			Syndicate S
	generic				3 horizontal lines
	solgov				small solgov circle logo
	solgov_old			terragov, TG
	rd_major			2px dithered line
	beaker				Chemistry beaker
	sci					text, SCI
	med					text, MED
	sec					text, SEC
	cargo				text, CAR
	engineering			text, ENG
	service				text, SER
	civilian			text, CIV
	liberator			text, LIB
	bepis				text, BEP
	sword				Small sword graphic
	sword_thin			Thin small sword graphic
	sus					amogus
	moth				little moth face
	shiptest			text, ST
	poyo				little face
	accel				PKA small icon
	target				box with a smaller box inside
	ammo				small bullet icon
	cybersun			Cybersun logo
	gun					small gun icon
	holo				Holopad design, animated
	dna					DNA disk design, animated
	o2					text, o2
	hammer				its a hammer
	depleted			This is used for limited disks with no charges left
	nuke_retro			old nukedisk, alternating lines like a sine wave
	nuke_new			sine wave, more detailed
	nanite				black and green lines, animated
	design				default, animated scrolling design
*/
/obj/item/disk/design_disk
	name = "Component Design Disk"
	desc = "A disk for storing device design data for construction in lathes."
	random_color = FALSE
	color = "#8b70ff"
	illustration = "design"
	var/list/blueprints = list()	//List of blueprints downloaded to the disk
	var/max_blueprints = 1			//Max amount of blueprints a disk can have
	var/max_charges = 0				//Max amount of prints a disk is allowed
	var/used_charges = 0			//Number of prints the disk has made
	var/modifiable = FALSE			//If the disk can have designs added/removed
	custom_materials = list(
							/datum/material/iron = 300,
							/datum/material/glass = 100,
							)

/obj/item/disk/design_disk/Initialize()
	. = ..()
	pixel_x = base_pixel_x + rand(-5, 5)
	pixel_y = base_pixel_y + rand(-5, 5)
	blueprints = new(max_blueprints)

/obj/item/disk/design_disk/examine(user)
	. = ..()
	var/readout = list("")
	if(!max_charges)
		readout += "[span_notice("It has [span_warning("infinite")] charges.")]"
	else
		readout += "[span_notice("It has [span_warning("[max_charges - used_charges]")] charges out of [span_warning("[max_charges]")] remaining.")]"
	if(modifiable)
		readout += "[span_notice("It's modifiable with a research console.")]"
	else
		readout += "[span_notice("It's [span_warning("not")] modifiable with a research console.")]"
	. += readout

/obj/item/disk/design_disk/proc/check_charges()
	if(!max_charges)
		return
	if(max_charges == used_charges) // Check if it's been used as many time as maximum
		for(var/i in 1 to max_blueprints)
			blueprints[i] = null // Remove all of the designs, and change the icon
			illustration = "depleted"
	update_icon()

/obj/item/disk/design_disk/adv
	name = "Advanced Component Design Disk"
	desc = "A disk for storing device design data for construction in lathes. This one has a little bit of extra storage space."
	color = "#bed876"
	max_blueprints = 3
	modifiable = TRUE
	custom_materials = list(
							/datum/material/iron = 300,
							/datum/material/glass = 100,
							/datum/material/silver = 50,
							)

/obj/item/disk/design_disk/super
	name = "Super Component Design Disk"
	desc = "A disk for storing device design data for construction in lathes. This one has more extra storage space."
	color = "#c25454"
	max_blueprints = 5
	modifiable = TRUE
	custom_materials = list(
							/datum/material/iron = 300,
							/datum/material/glass = 100,
							/datum/material/silver = 50,
							/datum/material/gold = 50,
							)

/obj/item/disk/design_disk/elite
	name = "Elite Component Design Disk"
	color = "#333333"
	desc = "A disk for storing device design data for construction in lathes. This one has absurd amounts of extra storage space."
	max_blueprints = 10
	modifiable = TRUE
	custom_materials = list(
							/datum/material/iron = 300,
							/datum/material/glass = 100,
							/datum/material/silver = 100,
							/datum/material/gold = 100,
							/datum/material/bluespace = 50,
							)

///Disks with custom blueprints///

///Limited use design disks

//Firearms
/obj/item/disk/design_disk/limited	//basetype, don't use this
	name = "Limited Design Disk"
	color = "#333333"
	desc = "A disk with limited charges"
	max_charges = 10 //Default for limited disks is 10 charges.

/obj/item/disk/design_disk/limited/firearm/ //parent - do not use
	name = "Limited Firearm Design Disk"
	desc = "A firearm disk with limited charges"
	max_blueprints = 1 //Default for firearms disks is 1.
	max_charges = 5 //Default for limited firearms disk is 5.

/obj/item/disk/design_disk/limited/firearm/disposable_gun
	name = "design disk - disposable guns"
	desc = "A design disk containing designs for a cheap and disposable gun."
	illustration = "gun"
	max_blueprints = 1
	max_charges = 20

/obj/item/disk/design_disk/limited/firearm/disposable_gun/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/disposable_gun/

//Ammunition

/obj/item/disk/design_disk/limited/ammunition //parent - do not use
	name = "Limited Ammunition Design Disk"
	desc = "A firearm disk with limited charges"
	illustration = "target"
	max_blueprints = 1 //Default for firearms disks is 1.
	max_charges = 5 //Default for limited firearms disk is 5.

//Limited Engineering

/obj/item/disk/design_disk/limited/advtools
	name = "design disk - Advanced Tools"
	desc = "A design disk containing Advanced Tools designs with limited prints."
	color = "#eece17"
	illustration = "hammer"
	max_blueprints = 3
	max_charges = 1 //Essentially to be used as loot - choose a tool.

/obj/item/disk/design_disk/engineering/t4parts/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/jawsoflife
	blueprints[2] = new /datum/design/exwelder
	blueprints[3] = new /datum/design/handdrill

///MEDICAL DESIGN DISKS

/obj/item/disk/design_disk/medical/ //Medical parent type
	name = "design disk - Medical"
	desc = "A design disk containing medical equipment."
	color = "#57b8f0"
	illustration = "med"
	max_blueprints = 5

/obj/item/disk/design_disk/medical/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/defibrillator
	blueprints[2] = new /datum/design/defibrillator_mount
	blueprints[3] = new /datum/design/healthanalyzer
	blueprints[4] = new /datum/design/crewpinpointer
	blueprints[5] = new /datum/design/health_hud

/obj/item/disk/design_disk/medical/surgery
	name = "design disk - surgical tools"
	desc = "A design disk containing designs for surgical tools."

/obj/item/disk/design_disk/medical/surgery/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/scalpel
	blueprints[2] = new /datum/design/retractor
	blueprints[3] = new /datum/design/hemostat
	blueprints[4] = new /datum/design/circular_saw
	blueprints[5] = new /datum/design/cautery

/obj/item/disk/design_disk/medical/surgery/basic
	name = "design disk - basic surgical tools"
	desc = "A design disk containing designs for basic sets of surgical tools."
	max_blueprints = 3

/obj/item/disk/design_disk/medical/surgery/basic/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/scalpel
	blueprints[2] = new /datum/design/hemostat
	blueprints[3] = new /datum/design/cautery

/obj/item/disk/design_disk/medical/cyber_organ
	name = "design disk - basic cybernetic organs"
	desc = "A design disk containing basic cybernetic organs. Produced and distributed by Cybersun Industries."
	illustration = "cybersun"

/obj/item/disk/design_disk/medical/cyber_organ/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/cybernetic_liver
	blueprints[2] = new /datum/design/cybernetic_heart
	blueprints[3] = new /datum/design/cybernetic_lungs
	blueprints[4] = new /datum/design/cybernetic_stomach
	blueprints[5] = new /datum/design/cybernetic_ears

/obj/item/disk/design_disk/medical/cyber_organ/tier2
	name = "design disk - upgraded cybernetic organs"
	desc = "A design disk containing designs forupgraded cybernetic organs. Produced and distributed by Cybersun Industries."

/obj/item/disk/design_disk/medical/cyber_organ/tier2/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/cybernetic_liver/tier2
	blueprints[2] = new /datum/design/cybernetic_heart/tier2
	blueprints[3] = new /datum/design/cybernetic_lungs/tier2
	blueprints[4] = new /datum/design/cybernetic_stomach/tier2
	blueprints[5] = new /datum/design/cybernetic_ears_u

/obj/item/disk/design_disk/medical/cyber_organ/tier3
	name = "design disk - advanced cybernetic organs"
	desc = "A design disk containing designs for advanced cybernetic organs. Produced and distributed by Cybersun Industries."

/obj/item/disk/design_disk/medical/cyber_organ/tier3/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/cybernetic_liver/tier3
	blueprints[2] = new /datum/design/cybernetic_heart/tier3
	blueprints[3] = new /datum/design/cybernetic_lungs/tier3
	blueprints[4] = new /datum/design/cybernetic_stomach/tier3
	blueprints[5] = new /datum/design/cybernetic_ears_u

/obj/item/disk/design_disk/medical/chemistry
	name = "design disk - chemistry equipment"
	desc = "A design disk containing designs for chemistry equipment. Stock parts not included."
	color = "#db8a2d"
	illustration = "beaker"
	max_blueprints = 7

/obj/item/disk/design_disk/medical/chemistry/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/medigel
	blueprints[2] = new /datum/design/reagentanalyzer
	blueprints[3] = new /datum/design/pillbottle
	blueprints[4] = new /datum/design/xlarge_beaker
	blueprints[5] = new /datum/design/seperatory_funnel
	blueprints[6] = new /datum/design/medical_spray_bottle
	blueprints[7] = new /datum/design/chem_pack

///SCIENCE DESIGN DISKS

/obj/item/disk/design_disk/science/ //Science parent type
	name = "design disk - Science"
	desc = "A design disk containing basic science equipment."
	color = "#bf4de2"
	illustration = "sci"
	max_blueprints = 5

/obj/item/disk/design_disk/science/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/diagnostic_hud
	blueprints[2] = new /datum/design/welding_mask
	blueprints[3] = new /datum/design/sci_goggles
	blueprints[4] = new /datum/design/anomaly_neutralizer
	blueprints[5] = new /datum/design/telesci_gps

/obj/item/disk/design_disk/science/ipc_parts
	name = "design disk - IPC components"
	desc = "A design disk containing designs for IPC components."
	illustration = "cybersun"
	max_blueprints = 7

/obj/item/disk/design_disk/science/ipc_parts/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/robotic_liver
	blueprints[2] = new /datum/design/robotic_eyes
	blueprints[3] = new /datum/design/robotic_tongue
	blueprints[4] = new /datum/design/robotic_heart
	blueprints[5] = new /datum/design/robotic_stomach
	blueprints[6] = new /datum/design/robotic_ears
	blueprints[7] = new /datum/design/power_cord

/obj/item/disk/design_disk/cmm_mechs
	name = "design disk - CMM mecha modifications"
	desc = "A design disk containing specifications for CMM-custom mecha conversions."
	color = "#57b8f0"
	illustration = "sword"
	max_blueprints = 2

/obj/item/disk/design_disk/cmm_mechs/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/cmm_ripley_upgrade
	blueprints[2] = new /datum/design/cmm_durand_upgrade

/// ENGINEERING DESIGN DISKS

/obj/item/disk/design_disk/engineering/ //Engineering parent type
	name = "design disk - Engineering"
	desc = "A design disk containing engineering equipment."
	color = "#eece17"
	illustration = "hammer"
	max_blueprints = 1

/obj/item/disk/design_disk/engineering/Initialize() //wip- not sure what else to put here
	. = ..()
	blueprints[1] = new /datum/design/inducer

/obj/item/disk/design_disk/engineering/t1parts //these might not be in autolathes in the future by default. watch out!
	name = "design disk - Stock Parts"
	desc = "A design disk containing designs for basic stock parts."
	max_blueprints = 7

/obj/item/disk/design_disk/engineering/t1parts/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/RPED
	blueprints[2] = new /datum/design/high_cell
	blueprints[3] = new /datum/design/basic_capacitor
	blueprints[4] = new /datum/design/basic_scanning
	blueprints[5] = new /datum/design/micro_mani
	blueprints[6] = new /datum/design/basic_micro_laser
	blueprints[7] = new /datum/design/basic_matter_bin

/obj/item/disk/design_disk/engineering/t2parts
	name = "design disk - Upgraded Stock Parts"
	desc = "A design disk containing designs for upgraded stock parts."
	max_blueprints = 7

/obj/item/disk/design_disk/engineering/t2parts/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/RPED
	blueprints[2] = new /datum/design/super_cell
	blueprints[3] = new /datum/design/adv_capacitor
	blueprints[4] = new /datum/design/adv_scanning
	blueprints[5] = new /datum/design/nano_mani
	blueprints[6] = new /datum/design/high_micro_laser
	blueprints[7] = new /datum/design/adv_matter_bin

/obj/item/disk/design_disk/engineering/t3parts
	name = "design disk - Advanced Stock Parts"
	desc = "A design disk containing designs for advanced stock parts."
	max_blueprints = 7

/obj/item/disk/design_disk/engineering/t3parts/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/RPED
	blueprints[2] = new /datum/design/hyper_cell
	blueprints[3] = new /datum/design/super_capacitor
	blueprints[4] = new /datum/design/phasic_scanning
	blueprints[5] = new /datum/design/pico_mani
	blueprints[6] = new /datum/design/ultra_micro_laser
	blueprints[7] = new /datum/design/super_matter_bin

/obj/item/disk/design_disk/engineering/t4parts
	name = "design disk - Bluespace Stock Parts"
	desc = "A design disk containing designs for bluespace stock parts."
	max_blueprints = 7

/obj/item/disk/design_disk/engineering/t4parts/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/RPED
	blueprints[2] = new /datum/design/bluespace_cell
	blueprints[3] = new /datum/design/quadratic_capacitor
	blueprints[4] = new /datum/design/triphasic_scanning
	blueprints[5] = new /datum/design/femto_mani
	blueprints[6] = new /datum/design/quadultra_micro_laser
	blueprints[7] = new /datum/design/bluespace_matter_bin

/// TELECOMMS

/obj/item/disk/design_disk/engineering/telecomms
	name = "design disk - Telecommunications Parts"
	desc = "A design disk containing designs for telecommunications parts."
	max_blueprints = 7

/obj/item/disk/design_disk/engineering/telecomms/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/hyperwave_filter
	blueprints[2] = new /datum/design/subspace_amplifier
	blueprints[3] = new /datum/design/subspace_treatment
	blueprints[4] = new /datum/design/subspace_analyzer
	blueprints[5] = new /datum/design/subspace_crystal
	blueprints[6] = new /datum/design/subspace_transmitter

/obj/item/disk/design_disk/engineering/telecommsboards
	name = "design disk - Telecommunications Circuits"
	desc = "A design disk containing designs for telecommunications circuit boards."
	max_blueprints = 7

/obj/item/disk/design_disk/engineering/telecomms/Initialize()
	. = ..()
	blueprints[1] = new /datum/design/board/subspace_receiver
	blueprints[2] = new /datum/design/board/subspace_broadcaster
	blueprints[3] = new /datum/design/board/telecomms_bus
	blueprints[4] = new /datum/design/board/telecomms_relay
	blueprints[5] = new /datum/design/board/telecomms_processor
	blueprints[6] = new /datum/design/board/telecomms_server
	blueprints[7] = new /datum/design/board/telecomms_hub
	blueprints[8] = new /datum/design/board/subspace_broadcaster


