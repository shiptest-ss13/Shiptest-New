/obj/item/attachment/laser_sight
	name = "Laser Sight"
	desc = "This laser sight is designed to be rail-mounted on a compatible firearm to provide increased accuracy."
	icon_state = "laser_sight"

/obj/item/attachment/laser_sight/Toggle(datum/component/attachment_holder/holder, obj/item/gun/gun, mob/user)
	. = ..()

	playsound(user, toggled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)

	if(toggled)
		gun.spread *= 0.6
		return

	gun.spread = initial(gun.spread)
