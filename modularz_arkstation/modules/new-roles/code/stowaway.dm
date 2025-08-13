// Безбилетник

/datum/job/stowaway
	title = JOB_STOWAWAY
	description = "Survive avoiding security officers."
	department_head = list("No one")
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = "no one"
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_ZERO
	paycheck_department = null
	config_tag = "STOWAWAY"


	outfit = /datum/outfit/job/stowaway
	plasmaman_outfit = /datum/outfit/plasmaman

	display_order = JOB_DISPLAY_ORDER_STOWAWAY
	department_for_prefs = /datum/job_department/assistant

	exclusive_mail_goodies = FALSE

	family_heirlooms = list(/obj/item/clothing/gloves/color/yellow, /obj/item/storage/toolbox/mechanical/old/heirloom)
	rpg_title = "Hobo"

	job_flags = JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CANNOT_OPEN_SLOTS

	required_languages = null

	alt_titles = list(
		"Stowaway",
		"Hobo",
		"Fugitive",
	)

/datum/outfit/job/stowaway
	name = "Stowaway"
	jobtype = /datum/job/stowaway
	id = /obj/item/card/id/stowaway
	id_trim = /datum/id_trim/stowaway
	uniform = /obj/item/clothing/under/pants/jeans
	belt = /obj/item/storage/belt/utility/full
	ears = null
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/yellow
	r_pocket = /obj/item/radio
	head = /obj/item/clothing/head/beanie/black

/datum/outfit/job/stowaway/post_equip(mob/living/carbon/human/H, visuals_only = FALSE)
	..()
	var/obj/item/card/id/id_card = H.wear_id
	if(istype(id_card))
		id_card.assignment = ""
		id_card.update_label()

/obj/item/card/id/stowaway
	name = "Unknown ID Card"
	desc = "A strange-looking old ID card. Looks like there's some old bank account attached."
	registered_name = null
	assignment = null

/datum/id_trim/stowaway
	assignment = null
	trim_state = JOB_STOWAWAY
	department_color = COLOR_ASSISTANT_GRAY
	subdepartment_color = COLOR_ASSISTANT_GRAY
	sechud_icon_state = SECHUD_UNKNOWN
	access = list(
		ACCESS_MAINT_TUNNELS,
	)

/obj/effect/landmark/start/stowaway
	name = "Stowaway"
	icon_state = "Assistant"
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/stowaway/after_round_start()
	return

///datum/area_spawn/stowaway_landmark
	//target_areas = list(/area/station/maintenance)
	//desired_atom = /obj/effect/landmark/start/stowaway

