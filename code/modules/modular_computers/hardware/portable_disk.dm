/obj/item/computer_hardware/hard_drive/portable
	name = "data disk"
	desc = "Removable disk used to store data."
	power_usage = 10
	icon_state = "datadisk6"
	w_class = WEIGHT_CLASS_TINY
	critical = 0
	max_capacity = 16
	device_type = MC_SDD

/obj/item/computer_hardware/hard_drive/portable/on_remove(obj/item/modular_computer/MC, mob/user)
	return //this is a floppy disk, let's not shut the computer down when it gets pulled out.

/obj/item/computer_hardware/hard_drive/portable/install_default_programs()
	return // Empty by default

/obj/item/computer_hardware/hard_drive/portable/advanced
	name = "advanced data disk"
	power_usage = 20
	icon_state = "datadisk5"
	max_capacity = 64

/obj/item/computer_hardware/hard_drive/portable/super
	name = "super data disk"
	desc = "Removable disk used to store large amounts of data."
	power_usage = 40
	icon_state = "datadisk3"
	max_capacity = 256

/obj/item/computer_hardware/hard_drive/portable/lifeline_install

/obj/item/computer_hardware/hard_drive/portable/lifeline_install/install_default_programs()
	store_file(new/datum/computer_file/program/radar/lifeline(src))

/obj/item/computer_hardware/hard_drive/portable/secureye_install

/obj/item/computer_hardware/hard_drive/portable/secureye_install/install_default_programs()
	store_file(new/datum/computer_file/program/secureye(src))

/obj/item/computer_hardware/hard_drive/portable/ntnetmonitor_install

/obj/item/computer_hardware/hard_drive/portable/ntnetmonitor_install/install_default_programs()
	store_file(new/datum/computer_file/program/ntnetmonitor(src))
