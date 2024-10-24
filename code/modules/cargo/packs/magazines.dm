/* VI */

/datum/supply_pack/magazine/co9mm_mag
	name = "9mm Commander Magazine Crate"
	desc = "Contains a 9mm magazine for the standard-issue Commander pistol, containing ten rounds."
	contains = list(/obj/item/ammo_box/magazine/co9mm)
	cost = 500

/* Hunter's Pride */

/datum/supply_pack/magazine/c38_mag
	name = ".38 Speedloader Crate"
	desc = "Contains a .38 speedloader for revolvers, containing six rounds."
	contains = list(/obj/item/ammo_box/c38)
	cost = 250

/datum/supply_pack/magazine/c38match
	name = ".38 Match Grade Speedloader"
	desc = "Contains one speedloader of match grade .38 ammunition, perfect for showing off trickshots."
	cost = 200
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/match)
	crate_name = ".38 match crate"

/datum/supply_pack/magazine/c38dumdum
	name = ".38 DumDum Speedloader"
	desc = "Contains one speedloader of .38 DumDum ammunition, good for embedding in soft targets."
	cost = 200
	small_item = TRUE
	contains = list(/obj/item/ammo_box/c38/dumdum)
	crate_name = ".38 match crate"

/datum/supply_pack/magazine/m45_mag
	name = ".45 ACP Candor Magazine Crate"
	desc = "Contains a .45 ACP magazine for the Candor pistol, containing eight rounds."
	contains = list(/obj/item/ammo_box/magazine/m45)
	cost = 500

/datum/supply_pack/magazine/a44roum_speedloader
	name = ".44 Roumain Speedloader Crate"
	desc = "Contains a .44 Roumain speedloader for the HP Montagne, containing six rounds."
	contains = list(/obj/item/ammo_box/a44roum_speedloader)
	cost = 400

/* Scarbie */

/datum/supply_pack/magazine/m10mm_mag
	name = "10mm Ringneck Magazine Crate"
	desc = "Contains a 10mm magazine for the ringneck pistol, containing ten rounds."
	contains = list(/obj/item/ammo_box/magazine/m10mm_ringneck)
	cost = 500

/datum/supply_pack/magazine/a357_mag
	name = ".357 Speedloader Crate"
	desc = "Contains a .357 speedloader for revolvers,  containing seven rounds."
	contains = list(/obj/item/ammo_box/a357)
	cost = 750

/datum/supply_pack/magazine/c45_cobra_mag
	name = "Cobra Magazine Crate"
	desc = "Contains a .45 magazine for the Cobra-20, containing 24 rounds."
	cost = 750
	contains = list(/obj/item/ammo_box/magazine/m45_cobra)

/datum/supply_pack/ammo/ebr_ammo
	name = "SMR-80 Magazine Crate"
	desc = "Contains a .308 magazine for the M514 EBR rifle, containing ten rounds."
	contains = list(/obj/item/ammo_box/magazine/m556_42_hydra/small)
	cost = 1000

/* CM Lancaster */

/datum/supply_pack/ammo/cm82_mag
	name = "CM-82 Magazine Crate"
	desc = "Contains a 5.56mm magazine for the P-16 rifle, containing thirty rounds. Notably, these are also compatable with the P-16 rifle."
	contains = list(/obj/item/ammo_box/magazine/p16)
	cost = 1000

/datum/supply_pack/ammo/skm_ammo
	name = "SKM Magazine Crate"
	desc = "Contains a 7.62x40mm magazine for the SKM rifles, containing twenty rounds."
	contains = list(/obj/item/ammo_box/magazine/skm_762_40)
	cost = 1000

/datum/supply_pack/ammo/f4_mag
	name = "F4 Magazine Crate"
	desc = "Contains a .308 magazine for F4 platform rifles, containing ten rounds."
	contains = list(/obj/item/ammo_box/magazine/f4_308)
	cost = 1000

/datum/supply_pack/ammo/boomslang_mag
	name = "Boomslang-90 Magazine Crate"
	desc = "Contains a 6.5 CLIP magazine for the Boomslang-90 rifle, containing five rounds."
	contains = list(/obj/item/ammo_box/magazine/boomslang/short)
	cost = 1000

/* NT */

/datum/supply_pack/magazine/wt550_mag
	name = "WT-550 Auto Rifle Magazine Crate"
	desc = "Contains a 20-round magazine for the WT-550 Auto Rifle. Each magazine is designed to facilitate rapid tactical reloads."
	cost = 750
	contains = list(/obj/item/ammo_box/magazine/wt550m9)

/datum/supply_pack/magazine/ap_wt550_mag
	name = "WT-550 Auto Rifle AP Magazine Crate"
	desc = "Contains one magazine of armor-piercing ammunition for the WT-550 Auto Rifle."
	cost = 1000
	contains = list(/obj/item/ammo_box/magazine/wt550m9/ap)

/datum/supply_pack/magazine/incin_wt550_mag
	name = "WT-550 Auto Rifle Incendiary Magazine Crate"
	desc = "Contains one magazine of incendiary ammunition for the WT-550 Auto Rifle. Nanotrasen has discontinued the Depleted Uranium magazines as of recently."
	cost = 1000
	contains = list(/obj/item/ammo_box/magazine/wt550m9/inc)

/* Solgov */

/datum/supply_pack/magazine/mag_556mm
	name = "5.56 Pistole C Magazine Crate"
	desc = "Contains a 5.56mm magazine for the Pistole C, containing twelve rounds."
	contains = list(/obj/item/storage/box/ammo/c556mm)
	cost = 750
	faction = FACTION_SOLGOV

/datum/supply_pack/magazine/fms_mag
	name = "Ferromagnetic Slug Magazine Crate"
	desc = "Contains a ferromagnetic slug magazine for the Model H pistol, containing ten rounds."
	contains = list(/obj/item/ammo_box/magazine/modelh)
	cost = 750
	faction = FACTION_SOLGOV

/datum/supply_pack/ammo/gar_ammo
	name = "GAR Ferromagnetic Lance Magazine Crate"
	desc = "Contains a ferromagnetic lance magazine for the GAR rifle, containing thirty two rounds."
	contains = list(/obj/item/ammo_box/magazine/gar)
	cost = 1000

/datum/supply_pack/ammo/claris_ammo
	name = "Claris Ferromagnetic Pellet Speedloader Crate"
	desc = "Contains a ferromagnetic pellet speedloader for the Claris rifle, containing twenty two rounds."
	contains = list(/obj/item/ammo_box/amagpellet_claris)
	cost = 1000

/* energy weapons */

/datum/supply_pack/ammo/guncell
	name = "Weapon Cell Crate"
	desc = "Contains a weapon cell, compatible with laser guns."
	contains = list(/obj/item/stock_parts/cell/gun)
	cost = 500

/* etherbor */

/datum/supply_pack/ammo/guncell/kalix
	name = "Etherbor Cell Crate"
	desc = "Contains an Etherbor weapon cell, compatible with Etherbor armaments with a slightly higher capacity."
	contains = list(/obj/item/stock_parts/cell/gun/kalix)
	cost = 600

/* Expand once the energy weapons have been actually expanded upon */
