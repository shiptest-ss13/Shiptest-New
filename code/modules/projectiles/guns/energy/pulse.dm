/obj/item/gun/energy/pulse
	name = "pulse rifle"
	desc = "A top-of-the-line, heavy-duty, multifaceted energy rifle with three firing modes. The gold standard for Nanotrasen's heavier security specialists."
	icon = 'icons/obj/guns/48x32guns.dmi'
	icon_state = "pulse"
	item_state = null
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	modifystate = TRUE
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse, /obj/item/ammo_casing/energy/laser)
	internal_cell = TRUE //prevents you from giving it an OP cell - WS Edit
	cell_type = /obj/item/stock_parts/cell/pulse //somone make this backpack mounted, or connected to the deathsquad suit at some point
	manufacturer = MANUFACTURER_SHARPLITE_NEW
	ammo_x_offset = 2
	charge_sections = 6

	spread_unwielded = 25

	muzzleflash_iconstate = "muzzle_flash_pulse"
	muzzle_flash_color = COLOR_BRIGHT_BLUE

/obj/item/gun/energy/pulse/emp_act(severity)
	return

/obj/item/gun/energy/pulse/carbine
	name = "pulse carbine"
	desc = "A next-generation pulse weapon for Nanotrasen's security forces. High production costs and logistical issues have limited its deployment to specialist Loss Prevention and Emergency Response units."
	icon = 'icons/obj/guns/energy.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	icon_state = "pulse_carbine"
	item_state = null
	internal_cell = FALSE
	mag_size = MAG_SIZE_LARGE //haha gun go brr
	cell_type = /obj/item/stock_parts/cell/gun/large
	ammo_x_offset = 2
	charge_sections = 4

/obj/item/gun/energy/pulse/pistol
	name = "pulse pistol"
	desc = "A pulse rifle in an easily concealed handgun package with low capacity."
	icon = 'icons/obj/guns/energy.dmi'
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	icon_state = "pulse_pistol"
	item_state = "gun"
	cell_type = /obj/item/stock_parts/cell/pulse/pistol
	ammo_x_offset = 2
	charge_sections = 4

/obj/item/gun/energy/pulse/destroyer
	name = "pulse destroyer"
	desc = "A heavy-duty energy rifle built for pure destruction."
	cell_type = /obj/item/stock_parts/cell/infinite
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pulse)

/obj/item/gun/energy/pulse/destroyer/attack_self(mob/living/user)
	to_chat(user, "<span class='danger'>[src.name] has three settings, and they are all DESTROY.</span>")

/obj/item/gun/energy/pulse/pistol/m1911
	name = "\improper Candor-P"
	desc = "A compact pulse core in a classic handgun frame for Nanotrasen officers. It's not the size of the gun, it's the size of the hole it puts through people."
	icon_state = "m1911"
	item_state = "gun"
	cell_type = /obj/item/stock_parts/cell/infinite
