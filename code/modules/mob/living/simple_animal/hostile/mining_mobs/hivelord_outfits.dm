/datum/outfit/generic/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	uniform = pickweight(list(
		/obj/item/clothing/under/utility = 1,
		/obj/item/clothing/under/utility/skirt = 1,
		/obj/item/clothing/under/color/black = 1,
		/obj/item/clothing/under/color/white = 1,
		/obj/item/clothing/under/color/random = 1,
		/obj/item/clothing/under/shorts/black = 1,
		/obj/item/clothing/under/shorts/grey = 1,
		/obj/item/clothing/under/shorts/blue = 1,
		/obj/item/clothing/under/shorts/green = 1,
		/obj/item/clothing/under/pants/jeans = 1,
		/obj/item/clothing/under/pants/khaki = 1,
		/obj/item/clothing/under/pants/tan = 1,
		/obj/item/clothing/under/pants/white = 1,
		/obj/item/clothing/under/pants/red = 1,
		/obj/item/clothing/under/pants/track = 1,
		/obj/item/clothing/under/pants/blackjeans = 1,
		/obj/item/clothing/under/pants/black = 1,
		/obj/item/clothing/under/pants/camo = 1,
		/obj/item/clothing/under/suit/white = 1,
		/obj/item/clothing/under/suit/tan = 1,
		/obj/item/clothing/under/suit/black_really = 1,
		/obj/item/clothing/under/suit/navy = 1,
		/obj/item/clothing/under/suit/burgundy = 1,
		/obj/item/clothing/under/suit/charcoal = 1,
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy = 1,
		/obj/item/clothing/under/suit/black/skirt = 1,
		/obj/item/clothing/under/suit/black = 1,
		/obj/item/clothing/under/dress/sailor = 1,
		/obj/item/clothing/under/dress/striped = 1,
		/obj/item/clothing/under/dress/skirt/blue = 1,
		/obj/item/clothing/under/syndicate/tacticool = 1,
		)
	)
	suit = pickweight(list(
		/obj/item/clothing/suit/hooded/wintercoat = 1,
		/obj/item/clothing/suit/jacket = 1,
		/obj/item/clothing/suit/jacket/leather = 1,
		/obj/item/clothing/suit/jacket/leather/overcoat = 1,
		/obj/item/clothing/suit/jacket/leather/duster = 1,
		/obj/item/clothing/suit/jacket/miljacket = 1,
		/obj/item/clothing/suit/jacket/puffer = 1,
		/obj/item/clothing/suit/gothcoat = 1,
		/obj/item/clothing/suit/toggle/industrial = 1,
		/obj/item/clothing/suit/toggle/hazard = 1,
		/obj/item/clothing/suit/poncho/green = 1,
		/obj/item/clothing/suit/apron/overalls = 1,
		/obj/item/clothing/suit/ianshirt = 1
		)
	)
	shoes = pickweight(list(
		/obj/item/clothing/shoes/laceup = 1,
		/obj/item/clothing/shoes/sandal = 1,
		/obj/item/clothing/shoes/winterboots = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/clothing/shoes/workboots/mining = 1,
		/obj/item/clothing/shoes/workboots = 1,
		/obj/item/clothing/shoes/sneakers/black = 1,
		/obj/item/clothing/shoes/sneakers/brown = 1,
		/obj/item/clothing/shoes/sneakers/white = 1
		)
	)
	if(prob(50))
		head = pickweight(list(
			/obj/item/clothing/head/hardhat = 1,
			/obj/item/clothing/head/hardhat/orange = 1,
			/obj/item/clothing/head/hardhat/dblue = 1,
			/obj/item/clothing/head/beret = 1,
			/obj/item/clothing/head/beret/grey = 1,
			/obj/item/clothing/head/beret/ce = 1,
			/obj/item/clothing/head/flatcap = 1,
			/obj/item/clothing/head/beanie = 1,
			/obj/item/clothing/head/foilhat = 1,
			/obj/item/clothing/head/cowboy = 1,
			/obj/item/clothing/head/pirate = 1,
			/obj/item/clothing/head/trapper = 1
			)
		)
	if(prob(50))
		glasses = pickweight(list(
			/obj/item/clothing/glasses/regular = 1,
			/obj/item/clothing/glasses/regular/circle = 1,
			/obj/item/clothing/glasses/regular/jamjar = 1,
			/obj/item/clothing/glasses/eyepatch = 1,
			/obj/item/clothing/glasses/cheapsuns = 1,
			/obj/item/clothing/glasses/regular/hipster = 1,
			/obj/item/clothing/glasses/cold = 1,
			/obj/item/clothing/glasses/heat = 1,
			/obj/item/clothing/glasses/orange = 1,
			/obj/item/clothing/glasses/red = 1
			)
		)
	if(prob(50))
		gloves = pickweight(list(
			/obj/item/clothing/gloves/color/black = 1,
			/obj/item/clothing/gloves/fingerless = 1,
			/obj/item/clothing/gloves/color/white = 1,
			)
		)
	if(prob(50))
		neck = pickweight(list(
			/obj/item/clothing/neck/scarf/red = 1,
			/obj/item/clothing/neck/scarf/green = 1,
			/obj/item/clothing/neck/scarf/darkblue = 1,
			/obj/item/clothing/neck/shemagh = 1,
			/obj/item/clothing/neck/stripedredscarf = 1,
			/obj/item/clothing/neck/stripedgreenscarf = 1,
			/obj/item/clothing/neck/stripedbluescarf = 1
			)
		)
	if(prob(50))
		mask = pickweight(list(
			/obj/item/clothing/mask/balaclava = 1,
			/obj/item/clothing/mask/bandana/red = 1,
			/obj/item/clothing/mask/gas = 1,
			/obj/item/clothing/mask/breath = 1,
			)
		)
	back = pickweight(list(
		/obj/item/storage/backpack = 1,
		/obj/item/storage/backpack/satchel = 1,
		/obj/item/storage/backpack/duffelbag = 1,
		/obj/item/storage/backpack/messenger = 1,
		/obj/item/storage/backpack/satchel/leather = 1
		)
	)
	backpack_contents += pickweight(list(
		/obj/item/dice/d20,
		/obj/item/lipstick/black,
		/obj/item/lipstick,
		/obj/item/clothing/mask/balaclava,
		/obj/item/clothing/mask/vape,
		/obj/item/clothing/mask/vape/cigar,
		/obj/item/clothing/mask/bandana/red,
		/obj/item/storage/book/bible,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/reagent_containers/food/drinks/britcup,
		/obj/item/lighter/greyscale,
		/obj/item/lighter,
		/obj/item/toy/cards/deck,
		/obj/item/toy/eightball,
		/obj/item/storage/wallet,
		/obj/item/paicard,
		/obj/item/modular_computer/tablet/preset/cheap,
		/obj/item/modular_computer/laptop/preset/civilian,
		/obj/item/pen,
		/obj/item/pen/fourcolor,
		/obj/item/paper_bin,
		/obj/item/cane,
		/obj/item/radio,
		/obj/item/toy/plush/lizardplushie,
		/obj/item/toy/plush/snakeplushie,
		/obj/item/toy/plush/moth,
		/obj/item/toy/plush/hornet,
		/obj/item/toy/plush/hornet/gay,
		/obj/item/toy/plush/knight,
		/obj/item/toy/plush/among,
		/obj/item/dyespray,
		/obj/item/table_bell/brass,
		/obj/item/flashlight,
		/obj/item/crowbar/red,
		)
	)

/datum/outfit/generic

/datum/outfit/generric/miner/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(prob(2))
		mob_species = /datum/species/plasmaman
		uniform = /obj/item/clothing/under/plasmaman
		head = /obj/item/clothing/head/helmet/space/plasmaman
		belt = /obj/item/tank/internals/plasmaman/belt
	else
		uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
		if (prob(4))
			belt = pickweight(list(
				/obj/item/storage/belt/mining = 2,
				/obj/item/storage/belt/mining/alt = 2
				)
			)
		else if(prob(10))
			belt = pickweight(list(
				/obj/item/pickaxe = 8,
				/obj/item/pickaxe/mini = 4,
				/obj/item/pickaxe/silver = 2,
				/obj/item/pickaxe/diamond = 1,
				/obj/item/gun/energy/kinetic_accelerator = 1
				)
			)
		else
			belt = /obj/item/tank/internals/emergency_oxygen/engi
	if(mob_species != /datum/species/lizard)
		shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/color/black
	mask = /obj/item/clothing/mask/gas/explorer
	if(prob(45))
		glasses = /obj/item/clothing/glasses/meson
	if(prob(20))
		suit = pickweight(list(
			/obj/item/clothing/suit/hooded/explorer = 18,
			/obj/item/clothing/suit/hooded/cloak/goliath = 2
			)
		)
	if(prob(30))
		r_pocket = pickweight(list(
			/obj/item/stack/marker_beacon = 20,
			/obj/item/spacecash/bundle/mediumrand = 7,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/damage = 1
			)
		)
	if(prob(10))
		l_pocket = pickweight(list(
			/obj/item/spacecash/bundle/mediumrand = 7,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/cooldown = 1
			)
		)
	if(prob(95))
		back = /obj/item/storage/backpack/explorer
		backpack_contents = list(/obj/item/radio)
		if(prob(70))
			backpack_contents += pickweight(list(
				/obj/item/borg/upgrade/modkit/damage = 1,
				/obj/item/borg/upgrade/modkit/trigger_guard = 1,
				/obj/item/soap/nanotrasen = 1,
				/obj/item/wormhole_jaunter = 1,
				/obj/item/fulton_core = 1,
				/obj/item/extraction_pack = 2,
				/obj/item/stack/sheet/animalhide/goliath_hide = 3,
				/obj/item/hivelordstabilizer = 2,
				/obj/item/stack/marker_beacon/ten = 2,
				/obj/item/mining_scanner = 2,
				/obj/item/extinguisher/mini = 2,
				/obj/item/kitchen/knife/combat/survival = 3,
				/obj/item/flashlight/seclite=3,
				/obj/item/stack/sheet/sinew = 3,
				/obj/item/stack/sheet/bone = 3
				)
			)
		if(prob(70))
			backpack_contents += pickweight(list(
				/obj/item/borg/upgrade/modkit/damage = 1,
				/obj/item/borg/upgrade/modkit/trigger_guard = 1,
				/obj/item/soap/nanotrasen = 1,
				/obj/item/wormhole_jaunter = 1,
				/obj/item/fulton_core = 1,
				/obj/item/extraction_pack = 2,
				/obj/item/stack/sheet/animalhide/goliath_hide = 3,
				/obj/item/hivelordstabilizer = 2,
				/obj/item/stack/marker_beacon/ten = 2,
				/obj/item/mining_scanner = 2,
				/obj/item/extinguisher/mini = 2,
				/obj/item/kitchen/knife/combat/survival = 3,
				/obj/item/flashlight/seclite = 3,
				/obj/item/stack/sheet/sinew = 3,
				/obj/item/stack/sheet/bone = 3
				)
			)
		if(prob(70))
			backpack_contents += pickweight(list(
				/obj/item/borg/upgrade/modkit/damage = 1,
				/obj/item/borg/upgrade/modkit/trigger_guard = 1,
				/obj/item/soap/nanotrasen = 1,
				/obj/item/wormhole_jaunter = 1,
				/obj/item/fulton_core = 1,
				/obj/item/extraction_pack = 2,
				/obj/item/stack/sheet/animalhide/goliath_hide = 3,
				/obj/item/hivelordstabilizer = 2,
				/obj/item/stack/marker_beacon/ten = 2,
				/obj/item/mining_scanner = 2,
				/obj/item/extinguisher/mini = 2,
				/obj/item/kitchen/knife/combat/survival = 3,
				/obj/item/flashlight/seclite = 3,
				/obj/item/stack/sheet/sinew = 3,
				/obj/item/stack/sheet/bone = 3
				)
			)
		if(prob(30))
			backpack_contents += list(
				/obj/item/reagent_containers/hypospray/medipen/survival = pickweight(list(
					1 = 3,
					2 = 2,
					3 = 1
					)
				)
			)
	else
		back = /obj/item/kinetic_crusher
		backpack_contents = list()

/datum/outfit/generic/miner

/datum/outfit/generic/oldminer/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	suit = /obj/item/clothing/suit/hooded/explorer/old
	mask = /obj/item/clothing/mask/gas/explorer/old
	if(prob(95))
		glasses = /obj/item/clothing/glasses/meson
	else
		glasses = /obj/item/clothing/glasses/meson/night
	suit_store = /obj/item/tank/internals/oxygen
	gloves = /obj/item/clothing/gloves/explorer/old
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland/old
	if(prob(85))
		back = /obj/item/storage/backpack/explorer //someone could totally make these backpacks a subtype and just have them be there. It'd cut down this file size a bit.
		backpack_contents = list()
		for(var/count in 1 to 3)
			if(prob(70))
				backpack_contents += pickweight(list(
					/obj/item/borg/upgrade/modkit/damage = 1,
					/obj/item/borg/upgrade/modkit/trigger_guard = 1,
					/obj/item/soap/nanotrasen = 1,
					/obj/item/wormhole_jaunter = 1,
					/obj/item/fulton_core = 1,
					/obj/item/extraction_pack = 2,
					/obj/item/stack/sheet/animalhide/goliath_hide = 3,
					/obj/item/hivelordstabilizer = 2,
					/obj/item/stack/marker_beacon/ten = 2,
					/obj/item/mining_scanner = 2,
					/obj/item/extinguisher/mini = 2,
					/obj/item/kitchen/knife/combat/survival = 3,
					/obj/item/flashlight/seclite=3,
					/obj/item/stack/sheet/sinew = 3,
					/obj/item/stack/sheet/bone = 3
					)
				)
		if(prob(30))
			backpack_contents += list(
				/obj/item/reagent_containers/hypospray/medipen/survival = pickweight(list(
					1 = 3,
					2 = 2,
					3 = 1
					)
				)
			)
	else
		back = /obj/item/kinetic_crusher/old
	if(prob(30))
		belt = /obj/item/gun/energy/kinetic_accelerator/old
	if(prob(30))
		r_pocket = pickweight(list(
			/obj/item/stack/marker_beacon = 20,
			/obj/item/spacecash/bundle/mediumrand = 7,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/damage = 1
			)
		)
	if(prob(30))
		l_pocket = pickweight(list(
			/obj/item/spacecash/bundle/mediumrand = 5,
			/obj/item/reagent_containers/hypospray/medipen/survival = 2,
			/obj/item/borg/upgrade/modkit/cooldown = 1
			)
		)
/datum/outfit/generic/oldminer

/datum/outfit/generic/solgov/soldier/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(prob(90))
		uniform = /obj/item/clothing/under/solgov
		suit = /obj/item/clothing/suit/armor/vest/bulletproof/solgov
		shoes = /obj/item/clothing/shoes/jackboots
		gloves = /obj/item/clothing/gloves/color/black
		mask = /obj/item/clothing/mask/gas/sechailer
		head = /obj/item/clothing/head/solgov/sonnensoldner
		id = /obj/item/card/id/solgov
	else
		uniform = /obj/item/clothing/under/solgov
		suit = /obj/item/clothing/suit/space/hardsuit/solgov
		shoes = /obj/item/clothing/shoes/combat
		gloves = /obj/item/clothing/gloves/combat
		mask = /obj/item/clothing/mask/gas/sechailer/swat
		id = /obj/item/card/id/solgov
	if(prob(85))
		back = /obj/item/storage/backpack
		backpack_contents = list()
		for(var/i = 1 to 3)
			if(prob(75))
				backpack_contents += pickweight(list(
					/obj/item/reagent_containers/hypospray/medipen/stimpack/traitor = 1,
					/obj/item/storage/firstaid/advanced = 1,
					/obj/item/gun/ballistic/automatic/pistol/solgov = 1,
					/obj/item/gps = 1,
					/obj/item/stock_parts/cell/gun/upgraded = 2,
					/obj/item/ammo_box/magazine/pistol556mm = 3,
					/obj/item/desk_flag/solgov = 3,
					/obj/item/stack/marker_beacon/ten = 3,
					/obj/item/extinguisher/mini = 3,
					/obj/item/kitchen/knife/combat = 3,
					/obj/item/flashlight/seclite=3,
					/obj/item/ammo_casing/shotgun = 3,
					/obj/item/binoculars = 3,
					/obj/item/clipboard = 3
					)
				)
	else
		back = pickweight(list(
			/obj/item/energyhalberd = 5,
			/obj/item/gun/ballistic/rocketlauncher/unrestricted = 5
			)
		)
	if(prob(25))
		belt = /obj/item/storage/belt/military
	if(prob(50))
		r_pocket = pickweight(list(
			/obj/item/reagent_containers/hypospray/medipen/stimpack = 1,
			/obj/item/kitchen/knife/letter_opener = 3,
			/obj/item/radio/off = 3,
			/obj/item/grenade/syndieminibomb/concussion = 1,
			/obj/item/melee/transforming/energy/ctf/solgov = 1
			)
		)
	if(prob(70))
		glasses = pickweight(list(
			/obj/item/clothing/glasses/sunglasses = 3,
			/obj/item/clothing/glasses/hud/health = 3,
			/obj/item/clothing/glasses/hud/health/night = 1,
			/obj/item/clothing/glasses/night = 2
			)
		)

/datum/outfit/generic/solgov/soldier

/datum/outfit/generic/syndicate/infiltrator/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	uniform = /obj/item/clothing/under/syndicate/bloodred
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/infiltrator
	suit = /obj/item/clothing/suit/armor/vest/infiltrator
	head = /obj/item/clothing/head/helmet/infiltrator
	shoes = /obj/item/clothing/shoes/combat/sneakboots
	ears = /obj/item/radio/headset/syndicate
	if(prob(70))
		glasses = pickweight(list(
			/obj/item/clothing/glasses/regular/circle = 1,
			/obj/item/clothing/glasses/night = 2,
			/obj/item/clothing/glasses/sunglasses = 3
			)
		)
	mask = /obj/item/clothing/mask/infiltrator
	id = /obj/item/card/id/syndicate
	back = /obj/item/storage/backpack
	backpack_contents = list()
	for(var/i = 1 to 3)
		if(prob(50))
			backpack_contents += pickweight(list(
				/obj/item/pen/sleepy = 3,
				/obj/item/pen/edagger = 3,
				/obj/item/reagent_containers/syringe/mulligan = 3,
				/obj/item/suppressor = 5,
				/obj/item/storage/box/syndie_kit/chameleon = 5,
				/obj/item/grenade/smokebomb = 5,
				/obj/item/grenade/flashbang = 5
				)
			)
	if(prob(70))
		backpack_contents += (list(
			/obj/item/gun/ballistic/automatic/pistol/APS,
			/obj/item/ammo_box/magazine/pistolm9mm
			)
		)
	if(prob(25))
		r_pocket = pickweight(list(
			/obj/item/chameleon = 1,
			/obj/item/dnainjector/chameleonmut = 1,
			)
		)
	if(prob(25))
		l_pocket = pickweight(list(
			/obj/item/chameleon = 1,
			/obj/item/dnainjector/chameleonmut = 1,
			)
		)

/datum/outfit/generic/syndicate/infiltrator

/datum/outfit/generic/syndicate/operative/pre_equip(mob/living/carbon/human/H, visualsOnly)
	id_job = "Operative"
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/syndicate
	id = /obj/item/card/id/syndicate
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	if(prob(25))
		suit = /obj/item/clothing/suit/space/hardsuit/syndi/scarlet
		mask = /obj/item/clothing/mask/gas/syndicate
		back = /obj/item/tank/jetpack/oxygen
	else if(prob(25))
		suit = /obj/item/clothing/suit/space/hardsuit/syndi
		mask = /obj/item/clothing/mask/gas/syndicate
		back = /obj/item/tank/jetpack/oxygen
	else
		suit = /obj/item/clothing/suit/armor/vest
		mask = /obj/item/clothing/mask/gas
		head = /obj/item/clothing/head/helmet/swat
		back = /obj/item/storage/backpack

/datum/outfit/generic/syndicate/operative

/datum/outfit/generic/srm/hunter/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	uniform = /obj/item/clothing/under/suit/roumain
	shoes = /obj/item/clothing/shoes/workboots/mining
	if(prob(50))
		suit = /obj/item/clothing/suit/armor/roumain/shadow
		head = /obj/item/clothing/head/cowboy/sec/roumain/shadow
	else
		suit = /obj/item/clothing/suit/armor/roumain
		head = /obj/item/clothing/head/cowboy/sec/roumain
	if(prob(25))
		suit_store = /obj/item/gun/ballistic/shotgun/winchester
	r_pocket = /obj/item/book/manual/trickwines_4_brewers
	belt = pick(list(/obj/item/kitchen/knife/hunting = 1, /obj/item/gun/ballistic/derringer = 1))
	back = /obj/item/storage/backpack/cultpack
	backpack_contents = list()
	if(prob(75))
		backpack_contents += list(/obj/item/ammo_box/c38_box = 1)
	if(prob(75))
		backpack_contents += list(pick(
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/ashwine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/icewine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/shockwine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/hearthwine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/forcewine,
			/obj/item/reagent_containers/food/drinks/breakawayflask/vintage/prismwine,) = 2)

/datum/outfit/generic/srm/hunter
