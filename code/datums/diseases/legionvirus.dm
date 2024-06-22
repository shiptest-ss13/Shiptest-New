/datum/disease/transformation/legionvirus
	name = "Legion Infection"
	max_stages = 5
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	cure_text = "Surgery; applications of spaceacillin or synaptizine can delay effects."
	agent = "Legion skull"
	viable_mobtypes = list(/mob/living/carbon/human)
	visibility_flags = 0
	stage_prob = 0 // WOOOOOO SNOWFLAKE!!!!!!! WOOOOOO!!!!
	desc = "If left untreated, the skull will slowly overtake its host's body, eventually growing into a legion."
	severity = DISEASE_SEVERITY_HARMFUL
	disease_flags = NONE
	visibility_flags = HIDDEN_PANDEMIC
	bypasses_immunity = TRUE

	stage1 = list("You feel a dull pain in your chest.")
	stage2 = list("Your head begins to ache.")
	stage3 = list("Something moves underneath your skin.")
	stage4 = list("<span class='warning'>You feel something pressing against your skin!</span>")
	stage5 = list("<span class='warning'>Your skin begins to tear apart-!</span>")
	new_form = /mob/living/simple_animal/hostile/asteroid/hivelord/legion

/datum/disease/transformation/legionvirus/do_disease_transformation(mob/living/H)
	H.visible_message(span_warning("[H] suddenly collapses, a pallid grey mass rapidly growing over their body!"))
	var/mob/living/simple_animal/hostile/asteroid/hivelord/legion/L
	if(HAS_TRAIT(H, TRAIT_DWARF)) //dwarf legions aren't just fluff!
		L = new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf(H.loc)
	else
		L = new(H.loc)
	H.death()
	H.adjustBruteLoss(1000)
	L.stored_mob = H
	H.forceMove(L)
	qdel(src)
