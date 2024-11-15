/obj/item/sensor_device
	name = "handheld crew monitor" //Thanks to Gun Hog for the name!
	desc = "A miniature machine that tracks suit sensors across the station."
	icon = 'icons/obj/device.dmi'
	pickup_sound =  'sound/items/handling/device_pickup.ogg'
	drop_sound = 'sound/items/handling/device_drop.ogg'
	icon_state = "scanner"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	custom_price = 1750
	custom_premium_price = 25

/obj/item/sensor_device/attack_self(mob/user)
	GLOB.crewmonitor.show(user,src) //Proc already exists, just had to call it
