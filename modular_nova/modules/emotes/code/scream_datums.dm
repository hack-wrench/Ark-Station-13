GLOBAL_LIST_EMPTY(scream_types)

/datum/scream_type
	var/name
	var/list/male_screamsounds
	var/list/female_screamsounds

/datum/scream_type/none //Why would you want this?
	name = "No Scream"
	male_screamsounds = null
	female_screamsounds = null

// ARK STATION REMOVAL BEGIN
/*
/datum/scream_type/human
	name = "Human Scream"
	male_screamsounds = list(
		'sound/mobs/humanoids/human/scream/malescream_1.ogg',
		'sound/mobs/humanoids/human/scream/malescream_2.ogg',
		'sound/mobs/humanoids/human/scream/malescream_3.ogg',
		'sound/mobs/humanoids/human/scream/malescream_4.ogg',
		'sound/mobs/humanoids/human/scream/malescream_5.ogg',
		'sound/mobs/humanoids/human/scream/malescream_6.ogg',
	)
	female_screamsounds = list(
		'modular_nova/modules/emotes/sound/voice/scream_f1.ogg',
		'modular_nova/modules/emotes/sound/voice/scream_f2.ogg',
		'modular_nova/modules/emotes/sound/voice/scream_f3.ogg',
	)
*/
// ARK STATION REMOVAL END

/datum/scream_type/human_two
	name = "Human Scream 2"
	male_screamsounds = list(
		'sound/mobs/humanoids/human/scream/malescream_1.ogg',
		'sound/mobs/humanoids/human/scream/malescream_2.ogg',
		'sound/mobs/humanoids/human/scream/malescream_3.ogg',
		'sound/mobs/humanoids/human/scream/malescream_4.ogg',
		'sound/mobs/humanoids/human/scream/malescream_5.ogg',
		'sound/mobs/humanoids/human/scream/malescream_6.ogg',
	)
	female_screamsounds = list(
		'sound/mobs/humanoids/human/scream/femalescream_1.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_2.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_3.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_4.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_5.ogg',
	)

/datum/scream_type/robotic
	name = "Robotic Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_silicon.ogg')
	female_screamsounds = null

/datum/scream_type/lizard
	name = "Lizard Scream"
	male_screamsounds = list(
		'sound/mobs/humanoids/lizard/lizard_scream_1.ogg',
		'sound/mobs/humanoids/lizard/lizard_scream_2.ogg',
		'sound/mobs/humanoids/lizard/lizard_scream_3.ogg',
	)
	female_screamsounds = null

/datum/scream_type/lizard2
	name = "Lizard Scream 2"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_lizard.ogg')
	female_screamsounds = null

/datum/scream_type/cat
	name = "Cat Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_cat.ogg')
	female_screamsounds = null

/datum/scream_type/moth
	name = "Moth Scream"
	male_screamsounds = list('sound/mobs/humanoids/moth/scream_moth.ogg')
	female_screamsounds = null

/datum/scream_type/jelly
	name = "Jelly Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/jelly_scream.ogg')
	female_screamsounds = null

/datum/scream_type/vox
	name = "Vox Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/voxscream.ogg')
	female_screamsounds = null

/datum/scream_type/xeno
	name = "Xeno Scream"
	male_screamsounds = list('sound/mobs/non-humanoids/hiss/hiss6.ogg')
	female_screamsounds = null

/datum/scream_type/raptor //This is the Teshari scream ported from CitRP which was a cockatoo scream edited by BlackMajor.
	name = "Raptor Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/raptorscream.ogg')
	female_screamsounds = null

/datum/scream_type/rodent //Ported from Polaris/Virgo.
	name = "Rodent Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/rodentscream.ogg')
	female_screamsounds = null

/datum/scream_type/ethereal
	name = "Ethereal Scream"
	male_screamsounds = list(
		'sound/mobs/humanoids/ethereal/ethereal_scream_1.ogg',
		'sound/mobs/humanoids/ethereal/ethereal_scream_2.ogg',
		'sound/mobs/humanoids/ethereal/ethereal_scream_3.ogg')
	female_screamsounds = null

/datum/scream_type/slugcat
	name = "Slugcat Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scugscream_1.ogg')
	female_screamsounds = null

//DONATOR SCREAMS
/datum/scream_type/zombie
	name = "Zombie Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/zombie_scream.ogg')
	female_screamsounds = null

/datum/scream_type/monkey
	name = "Monkey Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_monkey.ogg')
	female_screamsounds = null

/datum/scream_type/gorilla
	name = "Gorilla Scream"
	male_screamsounds = list('sound/mobs/non-humanoids/gorilla/gorilla.ogg')
	female_screamsounds = null

/datum/scream_type/skeleton
	name = "Skeleton Scream"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_skeleton.ogg')
	female_screamsounds = null

/datum/scream_type/plasmaman
	name = "Plasmaman Scream"
	male_screamsounds = list(
		'sound/mobs/humanoids/plasmaman/plasmeme_scream_1.ogg',
		'sound/mobs/humanoids/plasmaman/plasmeme_scream_2.ogg',
		'sound/mobs/humanoids/plasmaman/plasmeme_scream_3.ogg')
	female_screamsounds = null
