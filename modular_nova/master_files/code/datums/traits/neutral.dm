GLOBAL_VAR_INIT(DNR_trait_overlay, generate_DNR_trait_overlay())

/// Instantiates GLOB.DNR_trait_overlay by creating a new mutable_appearance instance of the overlay.
/proc/generate_DNR_trait_overlay()
	RETURN_TYPE(/mutable_appearance)

	var/mutable_appearance/DNR_trait_overlay = mutable_appearance('modular_nova/modules/indicators/icons/DNR_trait_overlay.dmi', "DNR", FLY_LAYER)
	DNR_trait_overlay.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART
	return DNR_trait_overlay


// NOVA NEUTRAL TRAITS
/datum/quirk/excitable
	name = "Excitable!"
	desc = "Head patting makes your tail wag! You're very excitable! WAG WAG."
	gain_text = span_notice("You crave for some headpats!")
	lose_text = span_notice("You no longer care for headpats all that much.")
	medical_record_text = "Patient seems to get excited easily."
	value = 0
	mob_trait = TRAIT_EXCITABLE
	icon = FA_ICON_LAUGH_BEAM

/datum/quirk/affectionaversion
	name = "Affection Aversion"
	desc = "You refuse to be licked or nosed by quadruped cyborgs."
	gain_text = span_notice("You've been added to the Do Not Lick and No Nosing registries.")
	lose_text = span_notice("You've been removed from the Do Not Lick and No Nosing registries.")
	medical_record_text = "Patient is in the Do Not Lick and No Nosing registries."
	value = 0
	mob_trait = TRAIT_AFFECTION_AVERSION
	icon = FA_ICON_CIRCLE_EXCLAMATION

/datum/quirk/personalspace
	name = "Personal Space"
	desc = "You'd rather people keep their hands off your rear end."
	gain_text = span_notice("You'd like it if people kept their hands off your butt.")
	lose_text = span_notice("You're less concerned about people touching your butt.")
	medical_record_text = "Patient demonstrates negative reactions to their posterior being touched."
	value = 0
	mob_trait = TRAIT_PERSONALSPACE
	icon = FA_ICON_HAND_PAPER

/datum/quirk/dnr
	name = "Do Not Revive"
	desc = "For whatever reason, you cannot be revived in any way."
	gain_text = span_notice("Your spirit gets too scarred to accept revival.")
	lose_text = span_notice("You can feel your soul healing again.")
	medical_record_text = "Patient is a DNR, and cannot be revived in any way."
	value = 0
	mob_trait = TRAIT_DNR
	icon = FA_ICON_SKULL_CROSSBONES

/datum/quirk/dnr/add(client/client_source)
	. = ..()

	quirk_holder.update_dnr_hud()

/datum/quirk/dnr/remove()
	var/mob/living/old_holder = quirk_holder

	. = ..()

	old_holder.update_dnr_hud()

/mob/living/prepare_data_huds()
	. = ..()

	update_dnr_hud()

/// Adds the DNR HUD element if src has TRAIT_DNR. Removes it otherwise.
/mob/living/proc/update_dnr_hud()
	set_hud_image_state(DNR_HUD, "hud_dnr")
	if(HAS_TRAIT(src, TRAIT_DNR))
		set_hud_image_active(DNR_HUD)
	else
		set_hud_image_inactive(DNR_HUD)

/mob/living/carbon/human/examine(mob/user)
	. = ..()

	if(stat != DEAD && HAS_TRAIT(src, TRAIT_DNR) && (HAS_TRAIT(user, TRAIT_SECURITY_HUD) || HAS_TRAIT(user, TRAIT_MEDICAL_HUD)))
		. += "\n[span_boldwarning("This individual is unable to be revived, and may be permanently dead if allowed to die!")]"

/datum/atom_hud/data/human/dnr
	hud_icons = list(DNR_HUD)

// uncontrollable laughter
/datum/quirk/item_quirk/joker
	name = "Pseudobulbar Affect"
	desc = "At random intervals, you suffer uncontrollable bursts of laughter."
	value = 0
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_PROCESSES
	medical_record_text = "Patient suffers with sudden and uncontrollable bursts of laughter."
	var/pcooldown = 0
	var/pcooldown_time = 60 SECONDS
	icon = FA_ICON_GRIN_TEARS

/datum/quirk/item_quirk/joker/add_unique(client/client_source)
	give_item_to_holder(/obj/item/paper/joker, list(LOCATION_BACKPACK, LOCATION_HANDS))

/datum/quirk/item_quirk/joker/process()
	if(pcooldown > world.time)
		return
	pcooldown = world.time + pcooldown_time
	var/mob/living/carbon/human/user = quirk_holder
	if(user && istype(user))
		if(user.stat == CONSCIOUS)
			if(prob(20))
				user.emote("laugh")
				addtimer(CALLBACK(user, /mob/proc/emote, "laugh"), 5 SECONDS)
				addtimer(CALLBACK(user, /mob/proc/emote, "laugh"), 10 SECONDS)

/obj/item/paper/joker
	name = "disability card"
	icon = 'modular_nova/master_files/icons/obj/card.dmi'
	icon_state = "joker"
	desc = "Smile, though your heart is aching."
	default_raw_text = "<i>\
			<div style='border-style:solid;text-align:center;border-width:5px;margin: 20px;margin-bottom:0px'>\
			<div style='margin-top:20px;margin-bottom:20px;font-size:150%;'>\
			Forgive my laughter:<br>\
			I have a condition.\
			</div>\
			</div>\
			</i>\
			<br>\
			<center>\
			<b>\
			MORE ON BACK\
			</b>\
			</center>"
	/// Whether or not the card is currently flipped.
	var/flipped = FALSE
	/// The flipped version of default_raw_text.
	var/flipside_default_raw_text = "<i>\
			<div style='border-style:solid;text-align:center;border-width:5px;margin: 20px;margin-bottom:0px'>\
			<div style='margin-top:20px;margin-bottom:20px;font-size:100%;'>\
			<b>\
			It's a medical condition causing sudden,<br>\
			frequent and uncontrollable laughter that<br>\
			doesn't match how you feel.<br>\
			It can happen in people with a brain injury<br>\
			or certain neurological conditions.<br>\
			</b>\
			</div>\
			</div>\
			</i>\
			<br>\
			<center>\
			<b>\
			KINDLY RETURN THIS CARD\
			</b>\
			</center>"
	/// Flipside version of raw_text_inputs.
	var/list/datum/paper_input/flipside_raw_text_inputs
	/// Flipside version of raw_stamp_data.
	var/list/datum/paper_stamp/flipside_raw_stamp_data
	/// Flipside version of raw_field_input_data.
	var/list/datum/paper_field/flipside_raw_field_input_data
	/// Flipside version of input_field_count
	var/flipside_input_field_count = 0


/obj/item/paper/joker/Initialize(mapload)
	. = ..()
	if(flipside_default_raw_text)
		add_flipside_raw_text(flipside_default_raw_text)


/**
 * This is an unironic copy-paste of add_raw_text(), meant to have the same functionalities, but for the flipside.
 *
 * This simple helper adds the supplied raw text to the flipside of the paper, appending to the end of any existing contents.
 *
 * This a God proc that does not care about paper max length and expects sanity checking beforehand if you want to respect it.
 *
 * The caller is expected to handle updating icons and appearance after adding text, to allow for more efficient batch adding loops.
 * * Arguments:
 * * text - The text to append to the paper.
 * * font - The font to use.
 * * color - The font color to use.
 * * bold - Whether this text should be rendered completely bold.
 */
/obj/item/paper/joker/proc/add_flipside_raw_text(text, font, color, bold)
	var/new_input_datum = new /datum/paper_input(
		text,
		font,
		color,
		bold,
	)

	flipside_input_field_count += get_input_field_count(text)

	LAZYADD(flipside_raw_text_inputs, new_input_datum)


/obj/item/paper/joker/update_icon()
	..()
	icon_state = "joker"

/obj/item/paper/joker/click_alt(mob/user)
	var/list/datum/paper_input/old_raw_text_inputs = raw_text_inputs
	var/list/datum/paper_stamp/old_raw_stamp_data = raw_stamp_data
	var/list/datum/paper_stamp/old_raw_field_input_data = raw_field_input_data
	var/old_input_field_count = input_field_count

	raw_text_inputs = flipside_raw_text_inputs
	raw_stamp_data = flipside_raw_stamp_data
	raw_field_input_data = flipside_raw_field_input_data
	input_field_count = flipside_input_field_count

	flipside_raw_text_inputs = old_raw_text_inputs
	flipside_raw_stamp_data = old_raw_stamp_data
	flipside_raw_field_input_data = old_raw_field_input_data
	flipside_input_field_count = old_input_field_count

	flipped = !flipped
	update_static_data()

	balloon_alert(user, "card flipped")
	return CLICK_ACTION_SUCCESS

/datum/quirk/feline_aspect
	name = "Feline Traits"
	desc = "You happen to act like a feline, for whatever reason. This will replace most other tongue-based speech quirks."
	gain_text = span_notice("Nya could go for some catnip right about now...")
	lose_text = span_notice("You feel less attracted to lasers.")
	medical_record_text = "Patient seems to possess behavior much like a feline."
	mob_trait = TRAIT_FELINE
	icon = FA_ICON_CAT

/datum/quirk/feline_aspect/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/cat/new_tongue = new(get_turf(human_holder))

	ADD_TRAIT(human_holder, TRAIT_WATER_HATER, QUIRK_TRAIT)

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/feline_aspect/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/new_tongue = new human_holder.dna.species.mutanttongue

	REMOVE_TRAIT(human_holder, TRAIT_WATER_HATER, QUIRK_TRAIT)

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/canine_aspect
	name = "Canidae Traits"
	desc = "Bark. You seem to act like a canine for whatever reason. This will replace most other tongue-based speech quirks."
	gain_text = span_notice("B-.. Bacon strips...")
	lose_text = span_notice("You feel less abandonment issues.")
	mob_trait = TRAIT_CANINE
	icon = FA_ICON_DOG
	value = 0
	medical_record_text = "Patient was seen digging through the trash can. Keep an eye on them."

/datum/quirk/canine_aspect/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/dog/new_tongue = new(get_turf(human_holder))

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/canine_aspect/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/new_tongue = new human_holder.dna.species.mutanttongue

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/avian_aspect
	name = "Avian Traits"
	desc = "You're a birdbrain, or you've got a bird's brain. This will replace most other tongue-based speech quirks."
	gain_text = span_notice("BAWWWWWK LEAVE THE HEADSET BAWKKKKK!")
	lose_text = span_notice("You feel less inclined to sit on eggs.")
	mob_trait = TRAIT_AVIAN
	icon = FA_ICON_KIWI_BIRD
	value = 0
	medical_record_text = "Patient exhibits avian-adjacent mannerisms."

/datum/quirk/avian_aspect/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/avian/new_tongue = new(get_turf(human_holder))

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

/datum/quirk/avian_aspect/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/tongue/new_tongue = new human_holder.dna.species.mutanttongue

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE), human_holder)
	new_tongue.Insert(human_holder, special = TRUE, movement_flags = DELETE_IF_REPLACED)

#define SEVERITY_STUN 1
#define SEVERITY_SNEEZE 2
#define SEVERITY_KNOCKDOWN 3
#define SEVERITY_BLEP 4

GLOBAL_LIST_INIT(possible_snout_sensitivities, list(
	"Stun" = SEVERITY_STUN,
	"Sneeze" = SEVERITY_SNEEZE, //Includes a stun
	"Collapse" = SEVERITY_KNOCKDOWN,
	"Blep" = SEVERITY_BLEP,
))

/datum/quirk/sensitivesnout
	name = "Sensitive Snout"
	desc = "Your face has always been sensitive, and it really hurts when someone pokes it!"
	gain_text = span_notice("Your face is awfully sensitive.")
	lose_text = span_notice("Your face feels numb.")
	medical_record_text = "Patient's nose seems to have a cluster of nerves in the tip, would advise against direct contact."
	value = 0
	mob_trait = TRAIT_SENSITIVESNOUT
	icon = FA_ICON_FINGERPRINT
	var/severity = SEVERITY_KNOCKDOWN
	COOLDOWN_DECLARE(emote_cooldown)

/datum/quirk_constant_data/sensitive_snout
	associated_typepath = /datum/quirk/sensitivesnout
	customization_options = list(/datum/preference/choiced/snout_sensitivity)

/datum/quirk/sensitivesnout/add(client/client_source)
	var/desired_severity = GLOB.possible_snout_sensitivities[client_source?.prefs?.read_preference(/datum/preference/choiced/snout_sensitivity)]
	severity = isnum(desired_severity) ? desired_severity : 1

/datum/quirk/sensitivesnout/proc/get_booped(attacker)
	var/can_emote = FALSE
	if(COOLDOWN_FINISHED(src, emote_cooldown))
		can_emote = TRUE
		COOLDOWN_START(src, emote_cooldown, 5 SECONDS)
	if (ishuman(quirk_holder) && can_emote)
		var/mob/living/carbon/human/human_holder = quirk_holder
		human_holder.force_say()
	switch(severity)
		if(SEVERITY_STUN)
			to_chat(quirk_holder, span_warning("[attacker] boops you on your sensitive nose, freezing you in place!"))
			quirk_holder.Stun(1 SECONDS)
		if(SEVERITY_SNEEZE)
			quirk_holder.Stun(1 SECONDS)
			if(can_emote)
				to_chat(quirk_holder, span_warning("[attacker] boops you on your sensitive nose! You can't hold back a sneeze!"))
				quirk_holder.emote("sneeze")
		if(SEVERITY_KNOCKDOWN)
			to_chat(quirk_holder, span_warning("[attacker] boops you on your sensitive nose, sending you to the ground!"))
			quirk_holder.Knockdown(1 SECONDS)
			quirk_holder.apply_damage(30, STAMINA)
		if(SEVERITY_BLEP)
			if(can_emote)
				to_chat(quirk_holder, span_warning("[attacker] boops you on your sensitive nose! You stick your tongue out on reflex!"))
				quirk_holder.emote("blep")

#undef SEVERITY_STUN
#undef SEVERITY_SNEEZE
#undef SEVERITY_KNOCKDOWN
#undef SEVERITY_BLEP

/datum/quirk/overweight
	name = "Overweight"
	desc = "You weigh more than an average person at your size, you've gotten used to it by now."
	gain_text = span_notice("Your body feels heavy.")
	lose_text = span_notice("Your suddenly feel lighter!")
	value = 0
	icon = FA_ICON_HAMBURGER // I'm very hungry. Give me the burger!
	medical_record_text = "Patient weighs higher than average."
	mob_trait = TRAIT_OFF_BALANCE_TACKLER

/datum/quirk/overweight/add(client/client_source)
	quirk_holder.add_movespeed_modifier(/datum/movespeed_modifier/overweight)

/datum/quirk/overweight/remove()
	quirk_holder.remove_movespeed_modifier(/datum/movespeed_modifier/overweight)

/datum/movespeed_modifier/overweight
	multiplicative_slowdown = 0.5 //Around that of a dufflebag, enough to be impactful but not debilitating.

/datum/mood_event/fat/New(mob/parent_mob, ...)
	. = ..()
	if(HAS_TRAIT_FROM(parent_mob, TRAIT_OFF_BALANCE_TACKLER, QUIRK_TRAIT))
		mood_change = 0 // They are probably used to it, no reason to be viscerally upset about it.
		description = "<b>I'm fat.</b>"
