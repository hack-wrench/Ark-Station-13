/datum/uplink_item/device_tools/syndie_jaws_of_life_traitor
	name = "Syndicate Jaws of Life"
	desc = "Based on a Nanotrasen model, this powerful tool can be used as both a crowbar and a pair of wirecutters. \
	In its crowbar configuration, it can be used to force open airlocks. Very useful for entering the station or its departments."
	item = /obj/item/crowbar/power/syndicate
	cost = 3
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/device_tools/medkit_traitor
	name = "Syndicate Combat Medic Kit"
	desc = "This first aid kit is a suspicious black and red. Included is a number of atropine medipens \
			for rapid stabilization and detonation prevention, sutures and regenerative mesh for wound treatment, and patches \
			for faster healing on the field. Also comes with basic medical tools and sterlizer."
	item = /obj/item/storage/medkit/tactical
	cost = 4
	progression_minimum = 15 MINUTES
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/device_tools/guerillagloves_traitor
	name = "Guerilla Gloves"
	desc = "A pair of highly robust combat gripper gloves that excels at performing takedowns at close range, with an added lining of insulation. Careful not to hit a wall!"
	item = /obj/item/clothing/gloves/tackler/combat/insulated
	cost = 2
	uplink_item_flags = NONE

/datum/uplink_item/device_tools/ammo_pouch
	name = "Ammo Pouch"
	desc = "A small yet large enough pouch that can fit in your pocket, and has room for three magazines."
	item = /obj/item/storage/pouch/ammo
	cost = 1
	uplink_item_flags = NONE

/datum/uplink_item/device_tools/syndie_glue
	name = "Glue"
	desc = "A cheap bottle of one use syndicate brand super glue. \
			Use on any item to make it undroppable. \
			Be careful not to glue an item you're already holding!"
	item = /obj/item/syndie_glue
	cost = 3

/datum/uplink_item/device_tools/syndikush
	name = "Syndikush Green Crack cart"
	desc = "A cheap Chinese vape cart that contains a potent combination of THC and \
			stimulants. Not made with real crack."
	item = /obj/item/reagent_containers/vapecart/syndicate
	cost = 5
	surplus = 90
	progression_minimum = 20 MINUTES

/datum/uplink_item/device_tools/syndicateborg
	name = "Syndicate Cyborg Upgrade"
	desc = "A marvel of modern syndicate technology; a syndicate borg hijacker. Allowing for the use of extremely powerful repair nanites, building equipment and otherwise useful upgrades to the standard saboteur modules. Due to its relatively experimental nature, it will only work on cyborgs which have already been jailbroken by an electromagnetic sequencer."
	item = /obj/item/borg/upgrade/transform/syndicatejack
	cost = 5 //Support item and the fact that you need a emag to use it on a cyborg

/datum/uplink_item/device_tools/thermal
	cost = 6 // original cost: 4

/datum/uplink_item/device_tools/emag
	cost = 7 // original cost: 4

/datum/uplink_item/device_tools/doorjack
	cost = 6 // original cost: 3

/datum/uplink_item/device_tools/powersink
	cost = 18 // original cost: 11

/datum/uplink_item/device_tools/evil_module
	name = "Ammo Fabricator Advanced Lethal Authentication Module"
	desc = "A Gorlex Marauders-modified ammunition fabricator module, loaded with the authentication keys for causing lots and lots of problems."
	item = /obj/item/ammo_workbench_module/lethal_super/evil
	cost = 5
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/device_tools/durandal_reclaimer
	name = "Scarborough 'Reclaimer' Parts Kit"
	desc = "A Scarborough Arms parts kit for converting the Blueshield's NT20 into an rC-20, functionally identical to the venerable C-20r. \
		The only problem is actually getting your mitts on the Blueshield's NT20 without dying in the process."
	surplus = 10
	item = /obj/item/storage/toolbox/guncase/traitor/durandal_parts
	cost = 1
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

