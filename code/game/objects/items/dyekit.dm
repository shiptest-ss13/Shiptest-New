/obj/item/dyespray
	name = "hair dye spray"
	desc = "A spray to dye your hair any gradients you'd like."
	icon = 'icons/obj/dyespray.dmi'
	icon_state = "dyespray"

/obj/item/dyespray/attack_self(mob/user)
	dye(user)

/obj/item/dyespray/pre_attack(atom/target, mob/living/user, params)
	dye(target)
	return ..()

/**
 * Applies a gradient and a gradient color to a mob.
 *
 * Arguments:
 * * target - The mob who we will apply the gradient and gradient color to.
 */

/obj/item/dyespray/proc/dye(mob/target)
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/human_target = target

	var/new_grad_style = input(usr, "Choose a color pattern:", "Character Preference")  as null|anything in GLOB.hair_gradients_list
	if(!new_grad_style)
		return

	var/new_grad_color = input(usr, "Choose a secondary hair color:", "Character Preference","#"+human_target.grad_color) as color|null
	if(!new_grad_color)
		return

	human_target.grad_style = new_grad_style
	human_target.grad_color = sanitize_hexcolor(new_grad_color)
	to_chat(human_target, "<span class='notice'>You start applying the hair dye...</span>")
	if(!do_after(usr, 3 SECONDS, target))
		return
	playsound(src, 'sound/effects/spray.ogg', 5, TRUE, 5)
	human_target.update_hair()

/obj/item/colorsalve
	name = "Elzuose color salve"
	desc = "A Kalixcian beauty product for Elzuose that comes in the form of a salve packaged with various color additives. Used to temporarily change the pigment color of light emitting cells in the skin, requiring an extensive amount of time to prepare and apply. Wears off after a few hours."
	icon = 'icons/obj/dyespray.dmi'
	icon_state = "colorsalve"

/datum/species/elzuose/spec_attacked_by(obj/item/I, mob/living/user, mob/living/carbon/human/_human)
	if(istype(I, /obj/item/colorsalve))
		if(user != _human)
			return
		else
			// select new color
			var/new_etherealcolor = input(user, "Choose your Elzuose color:", "Character Preference",default_color) as color|null
			if(new_etherealcolor)
				var/temp_hsv = RGBtoHSV(new_etherealcolor)
				if(ReadHSV(temp_hsv)[3] >= ReadHSV("#505050")[3]) // elzu colors should be bright ok??
					if(!do_after(usr, 30 SECONDS, user))
						return
					playsound(src, 'sound/effects/ointment.ogg', 5, TRUE, 5)
					default_color = sanitize_hexcolor(new_etherealcolor, 6, TRUE)
					current_color = health_adjusted_color(_human, default_color)
					spec_updatehealth(_human)
					_human.visible_message(span_notice("[_human] applies the salve, changing [_human.p_their()] color to [new_etherealcolor]"))
				else
					to_chat(user, span_danger("Invalid color. Your color is not bright enough."))
	else
		. = ..()
