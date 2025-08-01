/**
 * This is a cheap replica of the standard savefile version, only used for characters for now.
 * You can't really use the non-modular version, least you eventually want asinine merge
 * conflicts and/or potentially disastrous issues to arise, so here's your own.
 */
#define MODULAR_SAVEFILE_VERSION_MAX 15

#define MODULAR_SAVEFILE_UP_TO_DATE -1

#define VERSION_GENITAL_TOGGLES 1
#define VERSION_BREAST_SIZE_CHANGE 2
#define VERSION_SYNTH_REFACTOR 3
#define VERSION_UNDERSHIRT_BRA_SPLIT 4
#define VERSION_CHRONOLOGICAL_AGE 5
#define VERSION_TG_LOADOUT 6
#define VERSION_INTERNAL_EXTERNAL_ORGANS 7
#define VERSION_SKRELL_HAIR_NAME_UPDATE 8
#define VERSION_TG_EMOTE_SOUNDS 9
#define VERSION_CAT_EARS_DUPES 10
#define VERSION_LOADOUT_PRESETS 12
#define VERSION_EMO_LONG_REMOVAL 13
#define VERSION_TOOLKIT_IMPLANTS 14
#define VERSION_VOCAL_BARKS 15

#define INDEX_UNDERWEAR 1
#define INDEX_BRA 2

/**
 * Checks if the modular side of the savefile is up to date.
 * If the return value is higher than 0, update_character_nova() will be called later.
 */
/datum/preferences/proc/savefile_needs_update_nova(list/save_data)
	var/savefile_version = save_data["modular_version"]

	if(save_data.len && savefile_version < MODULAR_SAVEFILE_VERSION_MAX)
		return savefile_version

	return MODULAR_SAVEFILE_UP_TO_DATE


/// Loads the modular customizations of a character from the savefile
/datum/preferences/proc/load_character_nova(list/save_data)
	if(!save_data)
		save_data = list()

	load_augments(SANITIZE_LIST(save_data["augments"]))

	augment_limb_styles = SANITIZE_LIST(save_data["augment_limb_styles"])
	for(var/key in augment_limb_styles)
		if(!GLOB.robotic_styles_list[augment_limb_styles[key]])
			augment_limb_styles -= key

	features = SANITIZE_LIST(save_data["features"])
	mutant_bodyparts = SANITIZE_LIST(save_data["mutant_bodyparts"])
	body_markings = update_markings(SANITIZE_LIST(save_data["body_markings"]))
	mismatched_customization = save_data["mismatched_customization"]
	allow_advanced_colors = save_data["allow_advanced_colors"]

	alt_job_titles = save_data["alt_job_titles"]

	general_record = sanitize_text(general_record)
	security_record = sanitize_text(security_record)
	medical_record = sanitize_text(medical_record)
	background_info = sanitize_text(background_info)
	exploitable_info = sanitize_text(exploitable_info)

	var/list/save_languages = SANITIZE_LIST(save_data["languages"])
	for(var/language in save_languages)
		var/value = save_languages[language]
		save_languages -= language

		if(istext(language))
			language = _text2path(language)
		save_languages[language] = value
	languages = save_languages

	tgui_prefs_migration = save_data["tgui_prefs_migration"]
	if(!tgui_prefs_migration && save_data.len) // If save_data is empty, this is definitely a new character
		to_chat(parent, boxed_message(span_redtext("PREFERENCE MIGRATION BEGINNING.\
		\nDO NOT INTERACT WITH YOUR PREFERENCES UNTIL THIS PROCESS HAS BEEN COMPLETED.\
		\nDO NOT DISCONNECT UNTIL THIS PROCESS HAS BEEN COMPLETED.\
		")))
		migrate_nova(save_data)
		addtimer(CALLBACK(src, PROC_REF(check_migration)), 10 SECONDS)


	food_preferences = SANITIZE_LIST(save_data["food_preferences"])

	var/needs_nova_update = savefile_needs_update_nova(save_data)
	if(needs_nova_update >= 0)
		update_character_nova(needs_nova_update, save_data) // needs_nova_update == savefile_version if we need an update (positive integer)


/// Brings a savefile up to date with modular preferences. Called if savefile_needs_update_nova() returned a value higher than 0
/datum/preferences/proc/update_character_nova(current_version, list/save_data)
	if(current_version < VERSION_GENITAL_TOGGLES)
		// removed genital toggles, with the new choiced prefs paths as assoc
		var/static/list/old_toggles
		if(!old_toggles)
			old_toggles = list(
				"penis_toggle" = /datum/preference/choiced/genital/penis,
				"testicles_toggle" = /datum/preference/choiced/genital/testicles,
				"vagina_toggle" = /datum/preference/choiced/genital/vagina,
				"womb_toggle" = /datum/preference/choiced/genital/womb,
				"breasts_toggle" = /datum/preference/choiced/genital/breasts,
				"anus_toggle" = /datum/preference/choiced/genital/anus,
			)

		for(var/toggle in old_toggles)
			var/has_genital = save_data[toggle]
			if(!has_genital) // The toggle was off, so we make sure they have it set to the default "None" in the dropdown pref.
				var/datum/preference/genital = GLOB.preference_entries[old_toggles[toggle]]
				write_preference(genital, genital.create_default_value())

		if(save_data["skin_tone_toggle"])
			for(var/pref_type in subtypesof(/datum/preference/toggle/genital_skin_tone))
				write_preference(GLOB.preference_entries[pref_type], TRUE)

	if(current_version < VERSION_BREAST_SIZE_CHANGE)
		var/list/old_breast_prefs
		old_breast_prefs = save_data["breasts_size"]
		if(isnum(old_breast_prefs)) // Can't be too careful
			// You weren't meant to be able to pick sizes over this anyways.
			write_preference(GLOB.preference_entries[/datum/preference/choiced/breasts_size], GLOB.breast_size_translation["[min(old_breast_prefs, 10)]"])

	if(current_version < VERSION_SYNTH_REFACTOR)
		var/old_species = save_data["species"]
		if(istext(old_species) && (old_species in list("synthhuman", "synthliz", "synthmammal", "ipc")))

			var/list/new_color

			if(old_species == "synthhuman")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/synth_chassis], "Human Chassis")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/synth_head], "Human Head")
				// Get human skintone instead of mutant color
				new_color = save_data["skin_tone"]
				new_color = skintone2hex(new_color)
			else if(old_species == "synthliz")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/synth_chassis], "Lizard Chassis")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/synth_head], "Lizard Head")
			if(old_species == "synthmammal")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/synth_chassis], "Mammal Chassis")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/synth_head], "Mammal Head")

			// Sorry, but honestly, you folk might like to browse the IPC screens now they've got previews.
			write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/ipc_screen], "None")
			// Unfortunately, you will get a human last name applied due to load behaviours. Nothing I can do about it.
			write_preference(GLOB.preference_entries[/datum/preference/choiced/species], "synth")

			// If human code hasn't kicked in, grab mutant colour.
			if(!new_color)
				new_color = save_data["mutant_colors_color"]
				if(islist(new_color) && new_color.len > 0)
					new_color = sanitize_hexcolor(new_color[1])
				// Just let validation pick its own value.

			if(new_color)
				write_preference(GLOB.preference_entries[/datum/preference/color/mutant/synth_chassis], new_color)
				write_preference(GLOB.preference_entries[/datum/preference/color/mutant/synth_head], new_color)

	if(current_version < VERSION_UNDERSHIRT_BRA_SPLIT)
		var/static/list/underwear_to_underwear_bra = list(
			"Bikini" = list("Panties - Slim", "Bra"),
			"Lace Bikini" = list("Panties - Thin", "Bra - Thin"),
			"Bralette w/ Boyshorts" = list("Boyshorts (Alt)", "Bra, Sports"),
			"Sports Bra w/ Boyshorts" = list("Boyshorts", "Bra, Sports - Alt"),
			"Strapless Bikini" = list("Panties - Slim", "Strapless Swimsuit Top (Alt)"),
			"Babydoll" = list("Thong - Alt", null), // Got moved to an undershirt, actual underwear part is now a thong.
			"Two-Piece Swimsuit" = list("Panties - Swimsuit", "Swimsuit Top"),
			"Strapless Two-Piece Swimsuit" = list("Panties - Swimsuit", "Strapless Swimsuit Top"),
			"Halter Swimsuit" = list("Panties - Basic", "Bra - Halterneck - (Alt)"),
			"Neko Bikini (White)" = list("Panties - Neko", "Bra - Neko"),
			"Neko Bikini (Black)" = list("Panties - Neko", "Bra - Neko"),
			"UK Biniki" = list("Panties - UK", "Bra - UK"),
		)

		var/current_underwear = save_data["underwear"]
		var/migrated_underwear_bra = underwear_to_underwear_bra[current_underwear]

		if(migrated_underwear_bra)
			var/migrated_color = save_data["underwear_color"]
			var/migrated_underwear = migrated_underwear_bra[INDEX_UNDERWEAR]
			var/migrated_bra = migrated_underwear_bra[INDEX_BRA]

			if(migrated_underwear)
				write_preference(GLOB.preference_entries[/datum/preference/choiced/underwear], migrated_underwear)

			if(migrated_bra)
				write_preference(GLOB.preference_entries[/datum/preference/choiced/bra], migrated_bra)
				write_preference(GLOB.preference_entries[/datum/preference/color/bra_color], migrated_color)

		var/current_undershirt = save_data["undershirt"]

		// This one has a different treatment because it's an underwear that has been moved mainly to an undershirt,
		// ending up as a thong for the underwear part itself. We only want to override the undershirt if there's none,
		// though.
		if(current_underwear == "Babydoll" && current_undershirt == "Nude")
			var/migrated_color = save_data["underwear_color"]

			write_preference(GLOB.preference_entries[/datum/preference/choiced/undershirt], "Babydoll")
			write_preference(GLOB.preference_entries[/datum/preference/color/undershirt_color], migrated_color)

		var/static/list/undershirt_to_bra = list(
			"Bra, Sports" = "Bra, Sports",
			"Sports Bra (Alt)" = "Sports Bra (Alt)",
			"Bra" = "Bra",
			"Bra - Alt" = "Bra - Alt",
			"Bra - Thin" = "Bra - Thin",
			"Bra - Kinky Black" = "Bra - Kinky Black",
			"Bra - Freedom" = "Bra - Freedom",
			"Bra - Commie" = "Bra - Commie",
			"Bra - Bee-kini" = "Bra - Bee-kini",
			"Bra - UK" = "Bra - UK",
			"Bra - Neko" = "Bra - Neko",
			"Bra - Halterneck" = "Bra - Halterneck",
			"Bra - Sports - Alt" = "Bra - Sports - Alt",
			"Bra - Strapless" = "Bra - Strapless",
			"Bra - Latex" = "Bra - Latex",
			"Bra - Striped" = "Bra - Striped",
			"Bra - Sarashi" = "Bra - Sarashi",
			"Fishnet - Sleeved" = "Fishnet - Sleeved",
			"Fishnet - Sleeved (Greyscaled)" = "Fishnet - Sleeved (Greyscaled)",
			"Fishnet - Sleeveless" = "Fishnet - Sleeveless",
			"Fishnet - Sleeveless (Greyscaled)" = "Fishnet - Sleeveless (Greyscaled)",
			"Swimsuit Top" = "Bra - Halterneck - (Alt)",
			"Chastity Bra" = "Chastity Bra",
			"Pasties" = "Pasties",
			"Pasties - Alt" = "Pasties - Alt",
			"Shibari" = "Shibari",
			"Shibari Sleeves" = "Shibari Sleeves",
			"Binder" = "Binder",
			"Binder - Strapless" = "Binder - Strapless",
			"Safekini" = "Safekini",
		)

		var/migrated_bra_from_undershirt = undershirt_to_bra[current_undershirt]

		if(migrated_bra_from_undershirt)
			var/migrated_color = save_data["undershirt_color"]

			write_preference(GLOB.preference_entries[/datum/preference/choiced/bra], migrated_bra_from_undershirt)
			write_preference(GLOB.preference_entries[/datum/preference/color/bra_color], migrated_color)
			write_preference(GLOB.preference_entries[/datum/preference/choiced/undershirt], "Nude")

	// Resets Chronological Age field to default.
	if(current_version < VERSION_CHRONOLOGICAL_AGE)
		write_preference(GLOB.preference_entries[/datum/preference/numeric/chronological_age], read_preference(/datum/preference/numeric/age))

	if(current_version < VERSION_TG_LOADOUT)
		var/list/save_loadout = SANITIZE_LIST(save_data["loadout_list"])
		for(var/loadout in save_loadout)
			var/entry = save_loadout[loadout]
			save_loadout -= loadout

			if(istext(loadout))
				loadout = _text2path(loadout)
			save_loadout[loadout] = entry
		var/loadout_list = sanitize_loadout_list(save_loadout)

		if (length(loadout_list)) // We only want to write these changes down if we're certain that there was anything in that.
			write_preference(GLOB.preference_entries[/datum/preference/loadout], loadout_list)

	if(current_version < VERSION_INTERNAL_EXTERNAL_ORGANS)
		var/list/save_augments = SANITIZE_LIST(save_data["augments"])
		var/prefix_length = length("/obj/item/organ") // Shouldn't be any external augments, but if there are, it's the same length
		for(var/augment_name in save_augments)
			var/augment_path_string = save_augments[augment_name]
			if(!(findtext(augment_path_string, "/obj/item/organ") || findtext(augment_path_string, "/obj/item/organ/external")))
				continue // Make sure we don't strip something that isn't there
			var/augment_path_string_stripped = copytext(save_augments[augment_name], prefix_length + 1)
			save_augments[augment_name] = "/obj/item/organ[augment_path_string_stripped]"
		load_augments(save_augments)

	if(current_version < VERSION_SKRELL_HAIR_NAME_UPDATE)
		var/list/mutant_bodyparts = SANITIZE_LIST(save_data["mutant_bodyparts"])

		if("skrell_hair" in mutant_bodyparts)
			var/current_skrell_hair = mutant_bodyparts["skrell_hair"][MUTANT_INDEX_NAME]

			if(current_skrell_hair == "Male")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/skrell_hair], "Short")
			else if(current_skrell_hair == "Female")
				write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/skrell_hair], "Long")

		// Sets old insect laugh to the merged moth/insect in case character uses it.
	if (current_version < VERSION_TG_EMOTE_SOUNDS)
		var/current_laugh = save_data["character_laugh"]
		var/current_scream = save_data["character_scream"]
		if(current_laugh == "Moth Laugh" || current_laugh == "Insect Laugh")
			write_preference(GLOB.preference_entries[/datum/preference/choiced/laugh], "Insect Laugh (Moth)")
		if(current_scream == "Moth Scream 2")
			write_preference(GLOB.preference_entries[/datum/preference/choiced/scream], "Lizard Scream")

	if (current_version < VERSION_CAT_EARS_DUPES)
		var/current_ears = save_data["feature_ears"]
		if(current_ears == "Cat, Big")
			write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/ears], "Cat (Colorable Inner, Behind Hair)")
		else if(current_ears == "Cat, normal")
			write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/ears], "Cat, Alert")
		else if(current_ears == "Cat, Big (Alt)")
			write_preference(GLOB.preference_entries[/datum/preference/choiced/mutant_choice/ears], "Cat (Colorable Inner)")

	if(current_version < VERSION_LOADOUT_PRESETS)
		write_preference(GLOB.preference_entries[/datum/preference/loadout], list("Default" = save_data["loadout_list"]))

	if(current_version < VERSION_EMO_LONG_REMOVAL)
		var/current_hair = save_data["hairstyle_name"]
		if(current_hair == "Emo Long")
			write_preference(GLOB.preference_entries[/datum/preference/choiced/hairstyle], "Long Emo")
	if(current_version < VERSION_TOOLKIT_IMPLANTS)
		migrate_toolset_implants(save_data)

	if(current_version < VERSION_VOCAL_BARKS)
		var/current_tts_voice = save_data["tts_voice"]
		if(current_tts_voice != TTS_VOICE_NONE && current_tts_voice != "invalid") // make sure we don't turn off TTS for people who have it on
			write_preference(GLOB.preference_entries[/datum/preference/choiced/vocals/voice_type], "Text-to-speech")

/datum/preferences/proc/check_migration()
	if(!tgui_prefs_migration)
		to_chat(parent, boxed_message(span_redtext("CRITICAL FAILURE IN PREFERENCE MIGRATION, REPORT THIS IMMEDIATELY.")))
		message_admins("PREFERENCE MIGRATION: [ADMIN_LOOKUPFLW(parent)] has failed the process for migrating PREFERENCES. Check runtimes.")


/// Saves the modular customizations of a character on the savefile
/datum/preferences/proc/save_character_nova(list/save_data)
	save_data["augments"] = augments
	save_data["augment_limb_styles"] = augment_limb_styles
	save_data["features"] = features
	save_data["mutant_bodyparts"] = mutant_bodyparts
	save_data["body_markings"] = body_markings
	save_data["mismatched_customization"] = mismatched_customization
	save_data["allow_advanced_colors"] = allow_advanced_colors
	save_data["alt_job_titles"] = alt_job_titles
	save_data["languages"] = languages
	save_data["modular_version"] = MODULAR_SAVEFILE_VERSION_MAX
	save_data["food_preferences"] = food_preferences


/datum/preferences/proc/update_mutant_bodyparts(datum/preference/preference)
	if (!preference.relevant_mutant_bodypart)
		return
	var/part = preference.relevant_mutant_bodypart
	var/value = read_preference(preference.type)
	if (isnull(value))
		return
	if (istype(preference, /datum/preference/toggle))
		if (!value)
			if (part in mutant_bodyparts)
				mutant_bodyparts -= part
		else
			var/datum/preference/choiced/name = GLOB.preference_entries_by_key["feature_[part]"]
			var/datum/preference/tri_color/color = GLOB.preference_entries_by_key["[part]_color"]
			if (isnull(name) || isnull(color))
				return
			mutant_bodyparts[part] = list()
			mutant_bodyparts[part][MUTANT_INDEX_NAME] = read_preference(name.type)
			mutant_bodyparts[part][MUTANT_INDEX_COLOR_LIST] = read_preference(color.type)
	if (istype(preference, /datum/preference/choiced))
		if (part in mutant_bodyparts)
			mutant_bodyparts[part][MUTANT_INDEX_NAME] = value
	if (istype(preference, /datum/preference/tri_color))
		if (part in mutant_bodyparts)
			mutant_bodyparts[part][MUTANT_INDEX_COLOR_LIST] = value


/datum/preferences/proc/update_markings(list/markings)
	if (islist(markings))
		for (var/marking in markings)
			for (var/title in markings[marking])
				if (!islist(markings[marking][title]))
					markings[marking][title] = list(sanitize_hexcolor(markings[marking][title]), FALSE)
	return markings

/datum/preferences/proc/load_augments(list/augments_prefs)
	var/list/augments_sanitized = list()
	for(var/aug_slot in augments_prefs)
		var/aug_entry = augments_prefs[aug_slot]

		if(istext(aug_entry))
			aug_entry = _text2path(aug_entry)

		var/datum/augment_item/aug = GLOB.augment_items[aug_entry]
		if(aug)
			augments_sanitized[aug_slot] = aug_entry
	augments = augments_sanitized

/// Migration for loadout augments, replaces augments with /toolkit versions if the original doesn't exist
/datum/preferences/proc/migrate_toolset_implants(list/save_data)
	var/list/save_augments = SANITIZE_LIST(save_data["augments"])
	if(!length(save_augments))
		return
	for(var/augment_name in save_augments)
		var/augment_path_string = save_augments[augment_name]
		var/augment_path = GLOB.augment_items[_text2path(augment_path_string)]
		if(augment_path) // The augment already exists, neat!
			continue
		// Saved augment doesn't exist, try the toolkit version
		augment_path_string = replacetext(augment_path_string, "/cyberimp/arm/", "/cyberimp/arm/toolkit/")
		augment_path = GLOB.augment_items[_text2path(augment_path_string)]
		if(augment_path) // Toolkit version exists, save that instead
			save_augments[augment_name] = augment_path_string
			continue
		stack_trace("Attempt to migrate augment item [save_augments[augment_name]] failed!")
		save_augments -= augment_name

	load_augments(save_augments)

#undef MODULAR_SAVEFILE_VERSION_MAX
#undef MODULAR_SAVEFILE_UP_TO_DATE

#undef VERSION_GENITAL_TOGGLES
#undef VERSION_BREAST_SIZE_CHANGE
#undef VERSION_SYNTH_REFACTOR
#undef VERSION_UNDERSHIRT_BRA_SPLIT
#undef VERSION_CHRONOLOGICAL_AGE
#undef VERSION_TG_LOADOUT
#undef VERSION_INTERNAL_EXTERNAL_ORGANS
#undef VERSION_SKRELL_HAIR_NAME_UPDATE
#undef VERSION_TG_EMOTE_SOUNDS
#undef VERSION_CAT_EARS_DUPES
#undef VERSION_LOADOUT_PRESETS
#undef VERSION_EMO_LONG_REMOVAL
#undef VERSION_TOOLKIT_IMPLANTS
#undef VERSION_VOCAL_BARKS
