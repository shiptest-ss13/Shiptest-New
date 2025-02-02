/datum/supply_pack/medical
	group = "Medical"
	crate_type = /obj/structure/closet/crate/medical

/*
		First aid kits
*/

/datum/supply_pack/medical/firstaid_single
	name = "First Aid Kit Single-Pack"
	desc = "Contains one first aid kit for healing most types of wounds."
	cost = 400
	small_item = TRUE
	contains = list(/obj/item/storage/firstaid/regular)

/datum/supply_pack/medical/firstaidbruises_single
	name = "Bruise Treatment Kit Single-Pack"
	desc = "Contains one first aid kit focused on healing bruises and broken bones."
	cost = 700
	small_item = TRUE
	contains = list(/obj/item/storage/firstaid/brute)

/datum/supply_pack/medical/firstaidburns_single
	name = "Burn Treatment Kit Single-Pack"
	desc = "Contains one first aid kit focused on healing severe burns."
	cost = 700
	small_item = TRUE
	contains = list(/obj/item/storage/firstaid/fire)

/datum/supply_pack/medical/firstaidoxygen_single
	name = "Oxygen Deprivation Kit Single-Pack"
	desc = "Contains one first aid kit focused on helping oxygen deprivation victims."
	cost = 500
	small_item = TRUE
	contains = list(/obj/item/storage/firstaid/o2)

/datum/supply_pack/medical/firstaidtoxins_single
	name = "Toxin Treatment Kit Single-Pack"
	desc = "Contains one first aid kit focused on healing damage dealt by heavy toxins."
	cost = 500
	small_item = TRUE
	contains = list(/obj/item/storage/firstaid/toxin)

/datum/supply_pack/medical/firstaid_rad_single
	name = "Radiation Treatment Kit Single-Pack"
	desc = "Contains one first aid kit focused on reducing the damage done by radiation."
	cost = 500
	small_item = TRUE
	contains = list(/obj/item/storage/firstaid/radiation)

/*
		Tools
*/

/datum/supply_pack/medical/painkillers
	name = "Painkiller Supply Crate"
	desc = "Contains a supply of painkillers. Great for stopping headaches, feeling broken bones, and screaming people!"
	cost = 1000
	contains = list(
		/obj/item/reagent_containers/glass/bottle/morphine,
		/obj/item/reagent_containers/glass/bottle/morphine,
		/obj/item/reagent_containers/glass/bottle/morphine,
	)
	faction = /datum/faction/syndicate/suns
	faction_discount = 25

/datum/supply_pack/medical/painkillers/fill(obj/structure/closet/crate/cargo_crate)
	. = ..()
	if(prob(5))
		new /obj/item/reagent_containers/glass/bottle/painkiller_booze(cargo_crate)

/datum/supply_pack/medical/iv_drip
	name = "IV Drip Crate"
	desc = "Contains a single IV drip for administering blood to patients."
	cost = 1000
	contains = list(/obj/machinery/iv_drip)
	crate_name = "iv drip crate"

/datum/supply_pack/medical/defibs
	name = "Defibrillator Crate"
	desc = "Contains a defibrillator for bringing the recently deceased back to life."
	cost = 750
	contains = list(/obj/item/defibrillator/loaded)
	crate_name = "defibrillator crate"

/datum/supply_pack/medical/surgery
	name = "Surgical Supplies Crate"
	desc = "Do you want to perform surgery, but don't have one of those fancy shmancy degrees? Just get started with this crate containing a medical case, Sterilizine spray and collapsible roller bed."
	cost = 3000
	contains = list(/obj/item/storage/case/surgery,
					/obj/item/reagent_containers/medigel/sterilizine,
					/obj/item/roller)
	crate_name = "surgical supplies crate"
	faction = /datum/faction/syndicate/suns
	faction_discount = 50 //this shouldnt be 3k but if it is...


/datum/supply_pack/medical/anesthetic
	name = "Anesthetics Crate"
	desc = "Contains a standard anesthetics tank, for standard surgical procedures."
	cost = 500
	contains = list(/obj/item/clothing/mask/breath/medical,
					/obj/item/tank/internals/anesthetic)
	crate_name = "anesthetics crate"
	faction = /datum/faction/syndicate/suns
	faction_discount = 25

/*
		Bundles and supplies
*/

/datum/supply_pack/medical/bloodpacks
	name = "Blood Pack Variety Crate"
	desc = "Contains several different blood packs for reintroducing blood to patients."
	cost = 1000
	contains = list(/obj/item/reagent_containers/blood,
					/obj/item/reagent_containers/blood,
					/obj/item/reagent_containers/blood/APlus,
					/obj/item/reagent_containers/blood/AMinus,
					/obj/item/reagent_containers/blood/BPlus,
					/obj/item/reagent_containers/blood/BMinus,
					/obj/item/reagent_containers/blood/OPlus,
					/obj/item/reagent_containers/blood/OMinus,
					/obj/item/reagent_containers/blood/lizard,
					/obj/item/reagent_containers/blood/elzuose,
					/obj/item/reagent_containers/blood/synthetic)
	crate_name = "blood freezer"
	crate_type = /obj/structure/closet/crate/freezer
	faction = /datum/faction/syndicate/suns
	faction_discount = 25

/datum/supply_pack/medical/surplus
	name = "Medical Surplus Crate"
	desc = "Contains an assortment of medical supplies haphazardly pulled from storage. German doctor not included."
	cost = 3000
	contains = list(/obj/item/reagent_containers/glass/bottle/charcoal,
					/obj/item/reagent_containers/glass/bottle/epinephrine,
					/obj/item/reagent_containers/glass/bottle/morphine,
					/obj/item/reagent_containers/glass/bottle/toxin,
					/obj/item/reagent_containers/glass/beaker/large,
					/obj/item/reagent_containers/pill/insulin,
					/obj/item/stack/medical/gauze,
					/obj/item/storage/box/beakers,
					/obj/item/storage/box/medigels,
					/obj/item/storage/box/syringes,
					/obj/item/storage/box/bodybags,
					/obj/item/storage/firstaid/regular,
					/obj/item/storage/firstaid/o2,
					/obj/item/storage/firstaid/toxin,
					/obj/item/storage/firstaid/brute,
					/obj/item/storage/firstaid/fire,
					/obj/item/defibrillator/loaded,
					/obj/item/reagent_containers/blood/OMinus,
					/obj/item/storage/pill_bottle/mining,
					/obj/item/reagent_containers/pill/neurine,
					/obj/item/vending_refill/medical)
	crate_name = "medical surplus crate"
	faction = /datum/faction/syndicate/suns
	faction_discount = 25

/datum/supply_pack/medical/surplus/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to 7)
		var/item = pick(contains)
		new item(C)

/datum/supply_pack/medical/salglucanister
	name = "Heavy-Duty Saline Canister"
	desc = "Contains a bulk supply of saline-glucose condensed into a single canister that should last a long time, with a large pump to fill containers with. Direct injection of saline should be left to medical professionals as the pump is capable of overdosing patients."
	cost = 5000
	contains = list(/obj/machinery/iv_drip/saline)
	crate_name = "saline glucose crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/medical/epipen_crate
	name = "Bulk Epipen Crate"
	desc = "Contains a spare box of epinephrine medipens, for when the going gets tough."
	cost = 600
	contains = list(/obj/item/storage/box/medipens)
	crate_name = "epinephrine medipen crate"

/* Hypospray supplies */

/datum/supply_pack/medical/mkii_hypo
	name = "mk.II Hypospray kit"
	desc = "Contains an Nanotrasen Hypospray, for on the field medical care. Comes with an assortment of Ready-To-Go Vials"
	cost = 1200
	contains = list(/obj/item/storage/box/hypospray)
	crate_name = "mk.II hypospray crate"
	faction = /datum/faction/nt

/datum/supply_pack/medical/mkiii_hypo
	name = "mk.III Hypospray kit"
	desc = "Contains a mk.III Nanotrasen Hypospray, for on the field medical care. Comes with an assortment of Ready-To-Go Vials"
	cost = 2000
	contains = list(/obj/item/storage/box/hypospray/mkiii)
	crate_name = "mk.III hypospray crate"
	faction = /datum/faction/nt
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/medical/vials
	faction = /datum/faction/nt
	faction_discount = 50

/datum/supply_pack/medical/vials/bica_vial
	name = "Bicardine Vial Crate"
	desc = "Contains 2 spare bicardine vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/bicaridine,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/bicaridine
	)
	crate_name = "bicardine vial crate"

/datum/supply_pack/medical/vials/kelo_vial
	name = "Kelotane Vial Crate"
	desc = "Contains 2 spare kelotane vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/kelotane,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/kelotane
	)
	crate_name = "kelotane vial crate"

/datum/supply_pack/medical/vials/dylo_vial
	name = "Dylovene Vial Crate"
	desc = "Contains 2 spare dylovene vials, for usage in a Hypospray."
	cost = 1200
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/antitoxin,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/antitoxin
	)
	crate_name = "dylovene vial crate"

/datum/supply_pack/medical/vials/dexa_vial
	name = "Dexalin Vial Crate"
	desc = "Contains 2 spare dexalin vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/dexalin,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/dexalin
	)
	crate_name = "dexalin vial crate"

/datum/supply_pack/medical/vials/tric_vial
	name = "Tricordrazine Vial Crate"
	desc = "Contains 2 spare tricordrazine vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/tricord,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/tricord
	)
	crate_name = "tricordrazine vial crate"

/datum/supply_pack/medical/vials/morb_vial
	name = "Morphine Vial Crate"
	desc = "Contains 2 spare morphine vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/morphine,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/morphine
	)
	crate_name = "morphine vial crate"

/datum/supply_pack/medical/vials/atro_vial
	name = "Atropine Vial Crate"
	desc = "Contains 2 spare atropine vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/atropine,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/morphine
	)
	crate_name = "atropine vial crate"

/datum/supply_pack/medical/vials/erp_vial
	name = "Radiation Purgant Vial Crate"
	desc = "Contains 2 spare radiation purgant vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/erp,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/erp
	)
	crate_name = "radiation purgant vial crate"

/datum/supply_pack/medical/vials/sal_vial
	name = "SalGlu Vial Crate"
	desc = "Contains 2 spare SalGlu Solution vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/salclu,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/salclu
	)
	crate_name = "SalGlu vial crate"

/datum/supply_pack/medical/vials/chit_vial
	name = "Chitosan Vial Crate"
	desc = "Contains 2 spare Chitosan vials, for usage in a Hypospray."
	cost = 800
	contains = list(
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/chitosan,
		/obj/item/reagent_containers/glass/bottle/vial/small/preloaded/chitosan
	)
	crate_name = "chitosan vial crate"
