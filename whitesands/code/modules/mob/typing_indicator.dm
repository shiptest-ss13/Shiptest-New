/// state = overlay/image/object/type/whatever add_overlay will accept
GLOBAL_LIST_EMPTY(typing_indicator_overlays)

/// Fetches the typing indicator we'll use from GLOB.typing_indicator_overlays
/mob/proc/get_indicator_overlay(state)
	. = GLOB.typing_indicator_overlays[state]
	if(.)
		return
	// doesn't exist, make it and cache it
	if(ispath(state))
		. = GLOB.typing_indicator_overlays[state] = state
	// We only support paths for now because anything else isn't necessary yet.

/**
  * Displays typing indicator.
  * timeout_override - Sets how long until this will disappear on its own without the user finishing their message or logging out. Defaults to src.typing_indicator_timeout
  * state_override - Sets the state that we will fetch. Defaults to src.get_typing_indicator_icon_state()
  * force - shows even if src.typing_indcator_enabled is FALSE.
  */
/mob/proc/display_typing_indicator(state_override)
	if(typing_indicator_current)
		return
	typing_indicator_current = mutable_appearance('icons/mob/talk.dmi', state_override || "default0", plane = RUNECHAT_PLANE)
	typing_indicator_current.appearance_flags = RESET_COLOR | TILE_BOUND | PIXEL_SCALE
	add_overlay(typing_indicator_current)
	typing_indicator_timerid = addtimer(CALLBACK(src, .proc/clear_typing_indicator), TYPING_INDICATOR_TIMEOUT, TIMER_STOPPABLE)

/mob/living/display_typing_indicator(state_override)
	. = ..(state_override || "[bubble_icon]0") // if the mob has a bubble_icon and a state override isn't already specified, use the bubble_icon

/**
  * Removes typing indicator.
  */
/mob/proc/clear_typing_indicator()
	cut_overlay(typing_indicator_current)
	typing_indicator_current = null
	if(typing_indicator_timerid)
		deltimer(typing_indicator_timerid)
		typing_indicator_timerid = null
