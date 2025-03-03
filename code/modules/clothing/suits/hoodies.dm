/obj/item/clothing/suit/hooded/hoodie
	name = "hoodie"
	desc = "A hoodie. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiewhite"
	item_state = "hoodiewhite"
	icon = 'icons/obj/clothing/suits/color.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suits/color.dmi'
	hoodtype = /obj/item/clothing/head/hooded/hood
	body_parts_covered = CHEST|ARMS
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/exo/large
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
		/obj/item/toy,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/lighter,
		/obj/item/radio,
		/obj/item/storage/pill_bottle
	)
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //it's just a hoodie.
	supports_variations = KEPORI_VARIATION
	unique_reskin = list(
		"white hoodie" = "hoodiewhite",
		"grey hoodie" = "hoodiegrey",
		"black hoodie" = "hoodieblack",
		"red hoodie" = "hoodiered",
		"maroon hoodie" = "hoodiemaroon",
		"orange hoodie" = "hoodieorange",
		"yellow hoodie" = "hoodieyellow",
		"green hoodie" = "hoodiegreen",
		"dark green hoodie" = "hoodiedarkgreen",
		"teal hoodie" = "hoodieteal",
		"blue hoodie" = "hoodieblue",
		"dark blue hoodie" = "hoodiedarkblue",
		"purple hoodie" = "hoodiepurple",
		"pink hoodie" = "hoodiepink",
		"brown hoodie" = "hoodiebrown",
		"light brown hoodie" = "hoodielightbrown"
	)

/obj/item/clothing/head/hooded/hood
	name = "hood"
	desc = "A hood for your hoodie."
	icon_state = "hoodiewhite"
	item_state = "hoodiewhite"
	icon = 'icons/obj/clothing/head/color.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/color.dmi'
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEEARS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //it's just a hoodie.
	supports_variations = KEPORI_VARIATION

/obj/item/clothing/suit/hooded/hoodie/white
	name = "white hoodie"
	desc = "A hoodie that is white. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiewhite"
	item_state = "hoodiewhite"
	hoodtype = /obj/item/clothing/head/hooded/hood/white

/obj/item/clothing/head/hooded/hood/white
	name = "white hood"
	desc = "A white hood for your white hoodie."
	icon_state = "hoodiewhite"
	item_state = "hoodiewhite"

/obj/item/clothing/suit/hooded/hoodie/gray
	name = "grey hoodie"
	desc = "A hoodie that is grey. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiegrey"
	item_state = "hoodiegrey"
	hoodtype = /obj/item/clothing/head/hooded/hood/gray

/obj/item/clothing/head/hooded/hood/gray
	name = "grey hood"
	desc = "A grey hood for your grey hoodie."
	icon_state = "hoodiegrey"
	item_state = "hoodiegrey"

/obj/item/clothing/suit/hooded/hoodie/black
	name = "black hoodie"
	desc = "A hoodie that is black. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodieblack"
	item_state = "hoodieblack"
	hoodtype = /obj/item/clothing/head/hooded/hood/black

/obj/item/clothing/head/hooded/hood/black
	name = "black hood"
	desc = "A black hood for your black hoodie."
	icon_state = "hoodieblack"
	item_state = "hoodieblack"

/obj/item/clothing/suit/hooded/hoodie/red
	name = "red hoodie"
	desc = "A hoodie that is red. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiered"
	item_state = "hoodiered"
	hoodtype = /obj/item/clothing/head/hooded/hood/red

/obj/item/clothing/head/hooded/hood/red
	name = "red hood"
	desc = "A red hood for your red hoodie."
	icon_state = "hoodiered"
	item_state = "hoodiered"

/obj/item/clothing/suit/hooded/hoodie/maroon
	name = "maroon hoodie"
	desc = "A hoodie that is maroon. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiemaroon"
	item_state = "hoodiemaroon"
	hoodtype = /obj/item/clothing/head/hooded/hood/maroon

/obj/item/clothing/head/hooded/hood/maroon
	name = "maroon hood"
	desc = "A maroon hood for your maroon hoodie."
	icon_state = "hoodiemaroon"
	item_state = "hoodiemaroon"

/obj/item/clothing/suit/hooded/hoodie/orange
	name = "orange hoodie"
	desc = "A hoodie that is orange. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodieorange"
	item_state = "hoodieorange"
	hoodtype = /obj/item/clothing/head/hooded/hood/orange

/obj/item/clothing/head/hooded/hood/orange
	name = "orange hood"
	desc = "A orange hood for your orange hoodie."
	icon_state = "hoodieorange"
	item_state = "hoodieorange"

/obj/item/clothing/suit/hooded/hoodie/yellow
	name = "yellow hoodie"
	desc = "A hoodie that is yellow. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodieyellow"
	item_state = "hoodieyellow"
	hoodtype = /obj/item/clothing/head/hooded/hood/yellow

/obj/item/clothing/head/hooded/hood/yellow
	name = "yellow hood"
	desc = "A yellow hood for your yellow hoodie."
	icon_state = "hoodieyellow"
	item_state = "hoodieyellow"

/obj/item/clothing/suit/hooded/hoodie/green
	name = "green hoodie"
	desc = "A hoodie that is green. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiegreen"
	item_state = "hoodiegreen"
	hoodtype = /obj/item/clothing/head/hooded/hood/green

/obj/item/clothing/head/hooded/hood/green
	name = "green hood"
	desc = "A green hood for your green hoodie."
	icon_state = "hoodiegreen"
	item_state = "hoodiegreen"

/obj/item/clothing/suit/hooded/hoodie/darkgreen
	name = "dark green hoodie"
	desc = "A hoodie that is dark green. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiedarkgreen"
	item_state = "hoodiedarkgreen"
	hoodtype = /obj/item/clothing/head/hooded/hood/darkgreen

/obj/item/clothing/head/hooded/hood/darkgreen
	name = "dark green hood"
	desc = "A dark green hood for your dark green hoodie."
	icon_state = "hoodiedarkgreen"
	item_state = "hoodiedarkgreen"

/obj/item/clothing/suit/hooded/hoodie/teal
	name = "teal hoodie"
	desc = "A hoodie that is teal. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodieteal"
	item_state = "hoodieteal"
	hoodtype = /obj/item/clothing/head/hooded/hood/teal

/obj/item/clothing/head/hooded/hood/teal
	name = "teal hood"
	desc = "A teal hood for your teal hoodie."
	icon_state = "hoodieteal"
	item_state = "hoodieteal"

/obj/item/clothing/suit/hooded/hoodie/blue
	name = "blue hoodie"
	desc = "A hoodie that is blue. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodieblue"
	item_state = "hoodieblue"
	hoodtype = /obj/item/clothing/head/hooded/hood/blue

/obj/item/clothing/head/hooded/hood/blue
	name = "blue hood"
	desc = "A blue hood for your blue hoodie."
	icon_state = "hoodieblue"
	item_state = "hoodieblue"

/obj/item/clothing/suit/hooded/hoodie/darkblue
	name = "dark blue hoodie"
	desc = "A hoodie that is dark blue. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiedarkblue"
	item_state = "hoodiedarkblue"
	hoodtype = /obj/item/clothing/head/hooded/hood/darkblue

/obj/item/clothing/head/hooded/hood/darkblue
	name = "dark blue hood"
	desc = "A dark blue hood for your darkblue hoodie."
	icon_state = "hoodiedarkblue"
	item_state = "hoodiedarkblue"

/obj/item/clothing/suit/hooded/hoodie/purple
	name = "purple hoodie"
	desc = "A hoodie that is purple. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiepurple"
	item_state = "hoodiepurple"
	hoodtype = /obj/item/clothing/head/hooded/hood/purple

/obj/item/clothing/head/hooded/hood/purple
	name = "purple hood"
	desc = "A purple hood for your purple hoodie."
	icon_state = "hoodiepurple"
	item_state = "hoodiepurple"

/obj/item/clothing/suit/hooded/hoodie/pink
	name = "pink hoodie"
	desc = "A hoodie that is pink. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiepink"
	item_state = "hoodiepink"
	hoodtype = /obj/item/clothing/head/hooded/hood/pink

/obj/item/clothing/head/hooded/hood/pink
	name = "pink hood"
	desc = "A pink hood for your pink hoodie."
	icon_state = "hoodiepink"
	item_state = "hoodiepink"

/obj/item/clothing/suit/hooded/hoodie/brown
	name = "brown hoodie"
	desc = "A hoodie that is brown. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodiebrown"
	item_state = "hoodiebrown"
	hoodtype = /obj/item/clothing/head/hooded/hood/brown

/obj/item/clothing/head/hooded/hood/brown
	name = "brown hood"
	desc = "A brown hood for your brown hoodie."
	icon_state = "hoodiebrown"
	item_state = "hoodiebrown"

/obj/item/clothing/suit/hooded/hoodie/lightbrown
	name = "light brown hoodie"
	desc = "A hoodie that is light brown. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodielightbrown"
	item_state = "hoodielightbrown"
	hoodtype = /obj/item/clothing/head/hooded/hood/lightbrown

/obj/item/clothing/head/hooded/hood/lightbrown
	name = "light brown hood"
	desc = "A light brown hood for your light brown hoodie."
	icon_state = "hoodielightbrown"
	item_state = "hoodielightbrown"

/obj/item/clothing/suit/hooded/hoodie/fbp
	name = "\improper FBP kepori hoodie"
	desc = "A hoodie themed to look like a kepori in a Full Body Prosthetic. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodie_fbp"
	item_state = "hoodie_fbp"
	hoodtype = /obj/item/clothing/head/hooded/hood/fbp

/obj/item/clothing/head/hooded/hood/fbp
	name = "\improper FBP kepori hood"
	desc = "A hood for your FBP hoodie."
	icon_state = "hoodie_fbp"
	item_state = "hoodie_fbp"

/obj/item/clothing/suit/hooded/hoodie/rilena
	name = "K4L1 hoodie"
	desc = "A hoodie themed to look like K4L1 from the popular webseries RILENA. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodie_rilena"
	item_state = "hoodie_rilena"
	hoodtype = /obj/item/clothing/head/hooded/hood/rilena

/obj/item/clothing/suit/hooded/hoodie/rilena/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_OCLOTHING)
		return
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_RILENA))
		SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "hoodie_rilena", /datum/mood_event/rilena_super_fan)

/obj/item/clothing/suit/hooded/hoodie/rilena/dropped(mob/user)
	. = ..()
	var/mob/living/L = user
	if(HAS_TRAIT(L, TRAIT_FAN_RILENA))
		SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "hoodie_rilena")

/obj/item/clothing/head/hooded/hood/rilena
	name = "RILENA: LMR K4L1 hood"
	desc = "A hood for your RILENA themed hoodie."
	icon_state = "hoodie_rilena"
	item_state = "hoodie_rilena"

/obj/item/clothing/suit/hooded/hoodie/blackwa
	name = "black and white hoodie"
	desc = "A hoodie that is black, with a white hood. It has a comfy pocket for keeping your hands warm."
	icon_state = "hoodie_bwa"
	item_state = "hoodie_bwa"
	hoodtype = /obj/item/clothing/head/hooded/hood/gray
