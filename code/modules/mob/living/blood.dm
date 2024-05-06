#define BLOOD_DRIP_RATE_MOD 90 //Greater number means creating blood drips more often while bleeding

/****************************************************
				BLOOD SYSTEM
****************************************************/

/*mob/living/carbon/human/proc/suppress_bloodloss(amount) //KILLING these
	if(bleedsuppress)
		return
	else
		bleedsuppress = TRUE
		addtimer(CALLBACK(src, PROC_REF(resume_bleeding)), amount)

/mob/living/carbon/human/proc/resume_bleeding()
	if(stat != DEAD && get_bleeding_parts(TRUE))
		to_chat(src, "<span class='warning'>The blood soaks through your bandage.</span>")*/


/mob/living/carbon/monkey/handle_blood()
	if(bodytemperature >= TCRYO && !(HAS_TRAIT(src, TRAIT_HUSK))) //cryosleep or husked people do not pump the blood.
		//Blood regeneration if there is some space
		if(blood_volume < BLOOD_VOLUME_NORMAL)
			blood_volume += 0.1 // regenerate blood VERY slowly
			if(blood_volume < BLOOD_VOLUME_OKAY)
				adjustOxyLoss(round((BLOOD_VOLUME_NORMAL - blood_volume) * 0.02, 1))

// Takes care blood loss and regeneration
/mob/living/carbon/human/handle_blood()

	if(NOBLOOD in dna.species.species_traits)
		return

	if(bodytemperature >= TCRYO && !(HAS_TRAIT(src, TRAIT_HUSK))) //cryosleep or husked people do not pump the blood.

		//Blood regeneration if there is some space
		if(blood_volume < BLOOD_VOLUME_NORMAL && !HAS_TRAIT(src, TRAIT_NOHUNGER))
			var/nutrition_ratio = 0
			switch(nutrition)
				if(0 to NUTRITION_LEVEL_STARVING)
					nutrition_ratio = 0.2
				if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
					nutrition_ratio = 0.4
				if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_FED)
					nutrition_ratio = 0.6
				if(NUTRITION_LEVEL_FED to NUTRITION_LEVEL_WELL_FED)
					nutrition_ratio = 0.8
				else
					nutrition_ratio = 1
			if(satiety > 80)
				nutrition_ratio *= 1.25
			adjust_nutrition(-nutrition_ratio * HUNGER_FACTOR)
			blood_volume = min(BLOOD_VOLUME_NORMAL, blood_volume + 0.5 * nutrition_ratio)
		if(blood_volume < BLOOD_VOLUME_NORMAL && HAS_TRAIT(src, TRAIT_NOHUNGER)) //blood regen for non eaters
			blood_volume = min(BLOOD_VOLUME_NORMAL, blood_volume + 0.5 * 1.25) //assumes best nutrition conditions for non eaters because they don't eat

		//Effects of bloodloss
		var/word = pick("dizzy","woozy","faint")
		switch(blood_volume)
			if(BLOOD_VOLUME_EXCESS to BLOOD_VOLUME_MAX_LETHAL)
				if(prob(15))
					to_chat(src, "<span class='userdanger'>Blood starts to tear your skin apart. You're going to burst!</span>")
					inflate_gib()
			if(BLOOD_VOLUME_MAXIMUM to BLOOD_VOLUME_EXCESS)
				if(prob(10))
					to_chat(src, "<span class='warning'>You feel terribly bloated.</span>")
			if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
				if(prob(5))
					to_chat(src, "<span class='warning'>You feel [word].</span>")
				adjustOxyLoss(round((BLOOD_VOLUME_NORMAL - blood_volume) * 0.01, 1))
			if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
				adjustOxyLoss(round((BLOOD_VOLUME_NORMAL - blood_volume) * 0.02, 1))
				if(prob(5))
					blur_eyes(6)
					to_chat(src, "<span class='warning'>You feel very [word].</span>")
			if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
				adjustOxyLoss(5)
				if(prob(15))
					Unconscious(rand(20,60))
					to_chat(src, "<span class='warning'>You feel extremely [word].</span>")
			if(-INFINITY to BLOOD_VOLUME_SURVIVE)
				if(!HAS_TRAIT(src, TRAIT_NODEATH))
					death()

		//Bleeding out
		var/limb_bleed = 0
		for(var/obj/item/bodypart/BP as anything in bodyparts)
			if(BP.GetComponent(/datum/component/bandage))
				continue
			//We want an accurate reading of .len
			listclearnulls(BP.embedded_objects)
			for(var/obj/item/embeddies in BP.embedded_objects)
				if(!embeddies.isEmbedHarmless())
					BP.adjust_bleeding(0.5, BLOOD_LOSS_DAMAGE_CAP)
			limb_bleed += BP.bleeding

		if(limb_bleed && !bleedsuppress && !HAS_TRAIT(src, TRAIT_FAKEDEATH))
			bleed(limb_bleed)

//Makes a blood drop, leaking amt units of blood from the mob
/mob/living/carbon/proc/bleed(amt)
	if(blood_volume)
		blood_volume = max(blood_volume - amt, 0)
		if (prob(sqrt(amt)*BLOOD_DRIP_RATE_MOD))
			if(isturf(src.loc) && !isgroundlessturf(src.loc)) //Blood loss still happens in locker, floor stays clean
				if(amt >= 10)
					add_splatter_floor(src.loc)
				else
					add_splatter_floor(src.loc, 1)

/mob/living/carbon/human/bleed(amt)
	amt *= physiology.bleed_mod
	if(!(NOBLOOD in dna.species.species_traits))
		..()



/mob/living/proc/restore_blood()
	blood_volume = initial(blood_volume)

/mob/living/carbon/human/restore_blood()
	blood_volume = BLOOD_VOLUME_NORMAL
	for(var/obj/item/bodypart/BP as anything in get_bleeding_parts())
		BP.bleeding = 0

/****************************************************
				BLOOD TRANSFERS
****************************************************/

//Gets blood from mob to a container or other mob, preserving all data in it.
/mob/living/proc/transfer_blood_to(atom/movable/AM, amount, forced)
	if(!blood_volume || !AM.reagents)
		return FALSE
	if(blood_volume < BLOOD_VOLUME_BAD && !forced)
		return FALSE

	if(blood_volume < amount)
		amount = blood_volume

	var/blood_id = get_blood_id()
	if(!blood_id)
		return FALSE

	blood_volume -= amount

	var/list/blood_data = get_blood_data(blood_id)

	if(iscarbon(AM))
		var/mob/living/carbon/C = AM
		if(blood_id == C.get_blood_id())//both mobs have the same blood substance
			if(blood_id == /datum/reagent/blood) //normal blood
				if(blood_data["viruses"])
					for(var/thing in blood_data["viruses"])
						var/datum/disease/D = thing
						if((D.spread_flags & DISEASE_SPREAD_SPECIAL) || (D.spread_flags & DISEASE_SPREAD_NON_CONTAGIOUS))
							continue
						C.ForceContractDisease(D)

				var/datum/blood_type/blood_type = blood_data["blood_type"]
				if(!blood_type || !(blood_type.type in C.dna.blood_type.compatible_types))
					C.reagents.add_reagent(/datum/reagent/toxin, amount * 0.5)
					return TRUE

			C.blood_volume = min(C.blood_volume + round(amount, 0.1), BLOOD_VOLUME_MAX_LETHAL)
			return TRUE

	AM.reagents.add_reagent(blood_id, amount, blood_data, bodytemperature)
	return TRUE


/mob/living/proc/get_blood_data(blood_id)
	return

/mob/living/carbon/get_blood_data(blood_id)
	if(blood_id == /datum/reagent/blood) //actual blood reagent
		var/blood_data = list()
		//set the blood data
		blood_data["viruses"] = list()

		for(var/thing in diseases)
			var/datum/disease/D = thing
			blood_data["viruses"] += D.Copy()

		blood_data["blood_DNA"] = dna.unique_enzymes
		if(disease_resistances && disease_resistances.len)
			blood_data["resistances"] = disease_resistances.Copy()
		var/list/temp_chem = list()
		for(var/datum/reagent/R in reagents.reagent_list)
			temp_chem[R.type] = R.volume
		blood_data["trace_chem"] = list2params(temp_chem)
		if(mind)
			blood_data["mind"] = mind
		else if(last_mind)
			blood_data["mind"] = last_mind
		if(ckey)
			blood_data["ckey"] = ckey
		else if(last_mind)
			blood_data["ckey"] = ckey(last_mind.key)

		blood_data["blood_type"] = dna.blood_type
		blood_data["gender"] = gender
		blood_data["real_name"] = real_name
		blood_data["features"] = dna.features
		blood_data["factions"] = faction
		blood_data["quirks"] = list()
		for(var/V in roundstart_quirks)
			var/datum/quirk/T = V
			blood_data["quirks"] += T.type
		return blood_data

//get the id of the substance this mob use as blood.
/mob/proc/get_blood_id()
	return

/mob/living/simple_animal/get_blood_id()
	if(blood_volume)
		return /datum/reagent/blood

/mob/living/carbon/monkey/get_blood_id()
	if(!(HAS_TRAIT(src, TRAIT_HUSK)))
		return /datum/reagent/blood

/mob/living/carbon/human/get_blood_id()
	if(HAS_TRAIT(src, TRAIT_HUSK))
		return
	if(dna.species.exotic_blood)
		return dna.species.exotic_blood
	else if((NOBLOOD in dna.species.species_traits))
		return
	return /datum/reagent/blood

// This is has more potential uses, and is probably faster than the old proc.
/proc/random_blood_type()
	return get_blood_type(pick(4;"O-", 36;"O+", 3;"A-", 28;"A+", 1;"B-", 20;"B+", 1;"AB-", 5;"AB+"))

/proc/get_blood_type(type)
	return GLOB.blood_types[type]

/proc/get_blood_dna_color(list/blood_dna)
	var/blood_print = blood_dna[length(blood_dna)]
	var/datum/blood_type/blood_type = blood_dna[blood_print]
	return blood_type.color

//to add a splatter of blood or other mob liquid.
/mob/living/proc/add_splatter_floor(turf/T, small_drip)
	if(get_blood_id() != /datum/reagent/blood)
		return
	if(!T)
		T = get_turf(src)

	var/list/temp_blood_DNA
	if(small_drip)
		// Only a certain number of drips (or one large splatter) can be on a given turf.
		var/obj/effect/decal/cleanable/blood/drip/drop = locate() in T
		if(drop)
			if(drop.drips < 5)
				drop.drips++
				drop.add_overlay(pick(drop.random_icon_states))
				drop.transfer_mob_blood_dna(src)
				return
			else
				temp_blood_DNA = drop.return_blood_DNA() //we transfer the dna from the drip to the splatter
				qdel(drop)//the drip is replaced by a bigger splatter
		else
			drop = new(T, get_static_viruses())
			drop.transfer_mob_blood_dna(src)
			return

	// Find a blood decal or create a new one.
	var/obj/effect/decal/cleanable/blood/B
	for (var/obj/effect/decal/cleanable/blood/candidate in T)
		if (QDELETED(T))
			continue
		B = candidate
		break
	if(!B)
		B = new /obj/effect/decal/cleanable/blood/splatter(T, get_static_viruses())
	if(QDELETED(B)) //Give it up
		return
	B.bloodiness = min((B.bloodiness + BLOOD_AMOUNT_PER_DECAL), BLOOD_POOL_MAX)
	B.transfer_mob_blood_dna(src) //give blood info to the blood decal.
	if(temp_blood_DNA)
		B.add_blood_DNA(temp_blood_DNA)

/mob/living/carbon/human/add_splatter_floor(turf/T, small_drip)
	if(!(NOBLOOD in dna.species.species_traits))
		..()

/mob/living/carbon/alien/add_splatter_floor(turf/T, small_drip)
	if(!T)
		T = get_turf(src)
	var/obj/effect/decal/cleanable/xenoblood/B = locate() in T.contents
	if(!B)
		B = new(T)
	B.add_blood_DNA(list("UNKNOWN DNA" = "X*"))

/mob/living/silicon/robot/add_splatter_floor(turf/T, small_drip)
	if(!T)
		T = get_turf(src)
	var/obj/effect/decal/cleanable/oil/B = locate() in T.contents
	if(!B)
		B = new(T)
