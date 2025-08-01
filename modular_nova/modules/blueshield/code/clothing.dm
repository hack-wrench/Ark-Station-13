//Blueshield

//Uniform items are in command.dm

/obj/item/radio/headset/headset_bs
	name = "\proper the blueshield's headset"
	icon = 'modular_nova/modules/blueshield/icons/radio.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/ears.dmi'
	icon_state = "bshield_headset"
	worn_icon_state = "bshield_headset"
	keyslot = /obj/item/encryptionkey/heads/blueshield
	keyslot2 = /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_bs/alt
	icon_state = "bshield_headset_alt"
	worn_icon_state = "bshield_headset_alt"

/obj/item/radio/headset/headset_bs/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/clothing/head/helmet/space/plasmaman/blueshield
	name = "blueshield envirosuit helmet"
	desc = "A plasmaman containment helmet designed for certified blueshields, who's job guarding heads should not include self-combustion... most of the time."
	icon = 'modular_nova/master_files/icons/obj/clothing/head/plasmaman_hats.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/head/plasmaman_head.dmi'
	icon_state = "bs_envirohelm"

/obj/item/clothing/under/plasmaman/blueshield
	name = "blueshield envirosuit"
	desc = "A plasmaman containment suit designed for certified blueshields, offering a limited amount of extra protection."
	icon = 'modular_nova/master_files/icons/obj/clothing/under/plasmaman.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/under/plasmaman.dmi'
	icon_state = "bs_envirosuit"
	armor_type = /datum/armor/clothing_under/under_plasmaman_blueshield
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/datum/armor/clothing_under/under_plasmaman_blueshield
	melee = 10
	bio = 100
	fire = 95
	acid = 95

/obj/item/clothing/head/beret/blueshield
	name = "blueshield's beret"
	desc = "A blue beret made of durathread with a genuine golden badge, denoting its owner as a Blueshield Lieutenant. It seems to be padded with nano-kevlar, making it tougher than standard reinforced berets."
	icon_state = "/obj/item/clothing/head/beret/blueshield"
	post_init_icon_state = "beret_badge_police"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#3A4E7D#DEB63D"
	armor_type = /datum/armor/cosmetic_sec
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON

/obj/item/clothing/head/soft/blueshield
	name = "blueshield's cap"
	desc = "A navy-blue baseball cap made of durathread with a genuine golden badge, denoting its owner as a Blueshield Lieutenant. It seems to be padded with nano-kevlar, making it tougher than standard caps."
	icon_state = "blueshieldsoft"
	soft_type = "blueshield"
	inhand_icon_state = "greyscale_softcap"
	armor_type = /datum/armor/cosmetic_sec
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON

/obj/item/clothing/head/beret/blueshield/navy
	name = "navy blueshield's beret"
	desc = "A navy-blue beret made of durathread with a silver badge, denoting its owner as a Blueshield Lieutenant. It seems to be padded with nano-kevlar, making it tougher than standard reinforced berets."
	icon_state = "/obj/item/clothing/head/beret/blueshield/navy"
	greyscale_colors = "#3C485A#BBBBBB"

/obj/item/storage/backpack/blueshield
	name = "blueshield backpack"
	desc = "A robust backpack issued to Nanotrasen's finest."
	icon = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_nova/master_files/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_nova/master_files/icons/mob/inhands/clothing/backpack_righthand.dmi'
	icon_state = "backpack_blueshield"
	inhand_icon_state = "backpack_blueshield"

/obj/item/storage/backpack/satchel/blueshield
	name = "blueshield satchel"
	desc = "A robust satchel issued to Nanotrasen's finest."
	icon = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_nova/master_files/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_nova/master_files/icons/mob/inhands/clothing/backpack_righthand.dmi'
	icon_state = "satchel_blueshield"
	inhand_icon_state = "satchel_blueshield"

/obj/item/storage/backpack/duffelbag/blueshield
	name = "blueshield duffelbag"
	desc = "A robust duffelbag issued to Nanotrasen's finest."
	icon = 'modular_nova/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_nova/master_files/icons/mob/inhands/clothing/backpack_lefthand.dmi'
	righthand_file = 'modular_nova/master_files/icons/mob/inhands/clothing/backpack_righthand.dmi'
	icon_state = "duffel_blueshield"
	inhand_icon_state = "duffel_blueshield"

//blueshield armor
/obj/item/clothing/suit/armor/vest/blueshield
	icon = 'modular_nova/master_files/icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/suits/armor.dmi'
	name = "blueshield's armor"
	desc = "A tight-fitting kevlar-lined vest with a blue badge on the chest of it."
	icon_state = "blueshieldarmor"
	body_parts_covered = CHEST
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Slim" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "blueshieldarmor",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "blueshieldarmor",
		),
		"Marine" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "bs_marine",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "bs_marine",
		),
		"Bulky" = list(
			RESKIN_ICON = 'modular_nova/master_files/icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "vest_black",
			RESKIN_WORN_ICON = 'modular_nova/master_files/icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "vest_black",
		),
	)

/obj/item/clothing/suit/armor/vest/blueshield/jacket
	name = "blueshield's jacket"
	desc = "An expensive kevlar-lined jacket with a golden badge on the chest and \"NT\" emblazoned on the back. It weighs surprisingly little, despite how heavy it looks."
	icon_state = "blueshield"
	body_parts_covered = CHEST|ARMS
	unique_reskin = null

/obj/item/clothing/suit/armor/vest/blueshield/jacket/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon)

/obj/item/clothing/suit/hooded/wintercoat/nova/blueshield
	name = "blueshield's winter coat"
	icon_state = "coatblueshield"
	desc = "A comfy kevlar-lined coat with blue highlights, fit to keep the blueshield armored and warm."
	hoodtype = /obj/item/clothing/head/hooded/winterhood/nova/blueshield
	allowed = list(/obj/item/melee/baton/security/loaded)
	armor_type = /datum/armor/suit_armor

/obj/item/clothing/suit/hooded/wintercoat/nova/blueshield/Initialize(mapload)
	. = ..()
	allowed += GLOB.security_vest_allowed

/obj/item/clothing/head/hooded/winterhood/nova/blueshield
	icon_state = "hood_blueshield"
	desc = "A comfy kevlar-lined hood to go with the comfy kevlar-lined coat."
	armor_type = /datum/armor/suit_armor
