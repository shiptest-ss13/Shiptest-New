/datum/export/landmine
	cost = 750
	elasticity_coeff = 0.1
	unit_name = "defused landmines"
	export_types = list(/obj/item/mine/pressure/explosive)

/datum/export/anomaly
	unit_name = "stabilized anomaly core"
	cost = 3000
	elasticity_coeff = 0.1
	export_types = list(/obj/item/assembly/signaler/anomaly)

// Circuit boards, spare parts, etc.

/datum/export/solar/assembly
	cost = 50
	unit_name = "solar panel assembly"
	export_types = list(/obj/item/solar_assembly)

/datum/export/solar/tracker_board
	cost = 150
	unit_name = "solar tracker board"
	export_types = list(/obj/item/electronics/tracker)

/datum/export/solar/control_board
	cost = 150
	unit_name = "solar panel control board"
	export_types = list(/obj/item/circuitboard/computer/solar_control)

/datum/export/thruster_ion
	cost = 500
	unit_name = "ion thruster"
	export_types = list(/obj/machinery/power/shuttle/engine/electric)

//Computer Tablets and Parts
/datum/export/modular_part
	cost = 15
	unit_name = "miscellaneous computer part"
	export_types = list(/obj/item/computer_hardware)
	include_subtypes = TRUE

/* if only
/datum/export/stack/cable
	cost = 0.1
	unit_name = "copper wire"
	export_types = list(/obj/item/garnish/wire)
*/
