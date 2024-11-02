// 8x50mmR (Illestren Hunting Rifle)

/obj/item/ammo_casing/a8_50r
	name = "8x50mmR bullet casing"
	desc = "A 8x50mmR bullet casing."
	icon_state = "rifle-brass"
	caliber = "8x50mmR"
	projectile_type = /obj/projectile/bullet/a8_50r
	stack_size = 10

/obj/item/ammo_casing/a8_50r/hp
	name = "8x50mmR hollow point bullet casing"
	desc = "A 8x50mmR hollow point bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a8_50r/hp

/obj/item/ammo_casing/a8_50r/match
	name = "8x50mmR match bullet casing"
	desc = "A 8x50mmR hollow point bullet casing."
	bullet_skin = "ap"
	projectile_type = /obj/projectile/bullet/a8_50r/match

/obj/item/ammo_casing/a8_50r/trac
	name = "8x50mmR tracker casing"
	desc = "A 8x50mmR tracker casing."
	projectile_type = /obj/projectile/bullet/a8_50r/trac
	gps_tag = "*TRAC"

/obj/item/ammo_casing/caseless/a8_50r/trac/examine_more(mob/user)
	. = ..()
	if(!in_range(src, user) || !isobserver(user))
		. = span_warning("You try to examine [src] closer, but you're too far away.")
		return
	. += span_notice("A small electronic display on [src] reads [gps_tag]")

/obj/item/ammo_casing/caseless/a8_50r/trac/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	gps_tag = stripped_input(user, "Input GPS Tag", "Tagger", max_length=16)


// 8x58mm Caseless (SSG-669C)

/obj/item/ammo_casing/caseless/a858
	name = "8x58mm caseless round"
	desc = "A 8x58mm caseless round."
	icon_state = "caseless"
	caliber = "a858"
	projectile_type = /obj/projectile/bullet/a858
	stack_size = 10

/obj/item/ammo_casing/caseless/a858/trac
	name = "8x58mm tracker round"
	desc = "A 8x58mm caseless tracker round."
	projectile_type = /obj/projectile/bullet/a858/trac
	gps_tag = "*TRAC"

/obj/item/ammo_casing/caseless/a858/trac/examine_more(mob/user)
	. = ..()
	if(!in_range(src, user) || !isobserver(user))
		. = span_warning("You try to examine [src] closer, but you're too far away.")
		return
	. += span_notice("A small electronic display on [src] reads [tag]")

/obj/item/ammo_casing/caseless/a858/trac/multitool_act(mob/living/user, obj/item/I)
	. = ..()
	tag = stripped_input(user, "Input GPS Tag", "Tagger", max_length=16)

// .300 Magnum (Smile Rifle)

/obj/item/ammo_casing/a300
	name = ".300 Magnum bullet casing"
	desc = "A .300 Magnum bullet casing."
	icon_state = "rifle-steel"
	caliber = "a300"
	projectile_type = /obj/projectile/bullet/a300
	stack_size = 15

/obj/item/ammo_casing/a300/hp
	name = ".300 Magnum HP bullet casing"
	desc = "A .300 Magnum hollow point bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a300/hp

/obj/item/ammo_casing/a300/ap
	name = ".300 Magnum AP bullet casing"
	desc = "A .300 Magnum armor piercing bullet casing."
	bullet_skin = "ap"
	projectile_type = /obj/projectile/bullet/a300/ap

// 5.56x42mm CLIP (CM82, Hydra variants)

/obj/item/ammo_casing/a556_42
	name = "5.56x42mm CLIP bullet casing"
	desc = "A 5.56x42mm CLIP bullet casing."
	icon_state = "rifle-brass"
	caliber = "5.56x42mm"
	projectile_type = /obj/projectile/bullet/a556_42
	stack_size = 15

/obj/item/ammo_casing/a556_42/hp
	name = "5.56x42mm CLIP HP bullet casing"
	desc = "A 5.56x42mm CLIP hollow point bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a556_42/hp

/obj/item/ammo_casing/a556_42/ap
	name = "5.56x42mm CLIP bullet casing"
	desc = "A 5.56x42mm CLIP bullet casing."
	bullet_skin = "ap"
	projectile_type = /obj/projectile/bullet/a556_42/ap

/obj/item/ammo_casing/a556_42/rubber
	name = "5.56x42mm CLIP rubber bullet casing"
	desc = "A 5.56x42mm CLIP rubber bullet casing."
	bullet_skin = "rubber"
	projectile_type = /obj/projectile/bullet/a556_42/rubber
	stack_size = 15

// 5.45x39mm (SKM-24v)

/obj/item/ammo_casing/a545_39
	name = "5.45x39mm bullet casing"
	desc = "A 5.45x39mm bullet casing."
	icon_state = "rifle-brass"
	caliber = "5.45x39mm"
	randomspread = TRUE
	projectile_type = /obj/projectile/bullet/a545_39
	stack_size = 15

/obj/item/ammo_casing/a545_39/recycled
	name = "recycled 5.45x39mm bullet casing"
	desc = "A recycled 5.45x39mm bullet casing."
	bullet_skin = "surplus"
	caliber = "5.45x39mm"
	projectile_type = /obj/projectile/bullet/a545_39
	stack_size = 15

// 7.62x40mm CLIP (SKM Rifles)

/obj/item/ammo_casing/a762_40
	name = "7.62x40mm CLIP bullet casing"
	desc = "A 7.62x40mm CLIP bullet casing."
	icon_state = "rifle-brass"
	caliber = "7.62x40mm"
	projectile_type = /obj/projectile/bullet/a762_40
	stack_size = 15

/obj/item/ammo_casing/a762_40/hp
	name = "7.62x40mm CLIP HP bullet casing"
	desc = "A 7.62x40mm CLIP HP bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a762_40/hp

/obj/item/ammo_casing/a762_40/ap
	name = "7.62x40mm CLIP AP bullet casing"
	desc = "A 7.62x40mm CLIP AP bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a762_40/ap

/obj/item/ammo_casing/a762_40/rubber
	name = "7.62x40mm CLIP rubber bullet casing"
	desc = "A 7.62x40mm CLIP rubber bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a762_40/rubber

//.308 (M514 EBR & CM-GAL-S)

/obj/item/ammo_casing/a308
	name = ".308 bullet casing"
	desc = "A .308 bullet casing."
	icon_state = "rifle-brass"
	caliber = ".308"
	projectile_type = /obj/projectile/bullet/a308
	stack_size = 10

/obj/item/ammo_casing/a308/ap
	name = ".308 AP bullet casing"
	desc = "A .308 AP bullet casing."
	bullet_skin = "ap"
	projectile_type = /obj/projectile/bullet/a308/ap

/obj/item/ammo_casing/a308/hp
	name = ".308 HP bullet casing"
	desc = "A .308 HP bullet casing."
	bullet_skin = "hollow"
	projectile_type = /obj/projectile/bullet/a308/hp

/obj/item/ammo_casing/caseless/c299
	name = ".299 Eoehoma caseless bullet casing"
	desc = "A .299 Eoehoma caseless bullet casing."
	icon_state = "caseless"
	caliber = ".299 caseless"
	projectile_type = /obj/projectile/bullet/c299
	stack_size = 15

/obj/item/ammo_casing/a65clip
	name = "6.5x57mm CLIP bullet casing"
	desc = "A 6.5x57mm CLIP bullet casing."
	icon_state = "big-brass"
	caliber = "6.5CLIP"
	projectile_type = /obj/projectile/bullet/a65clip
	stack_size = 5
