#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_SLOTFULL 5
/// Job unavailable due to incompatibility with an antag role.
#define JOB_UNAVAILABLE_ANTAG_INCOMPAT 6
/// Checks for character age.
#define JOB_UNAVAILABLE_AGE 7

/// Used when the `get_job_unavailable_error_message` proc can't make sense of a given code.
#define GENERIC_JOB_UNAVAILABLE_ERROR "Error: Unknown job availability."

// Human authority settings
// If you want to add another setting, make sure to also add it to the if chain in /datum/job_config_type/human_authority/validate_value()
#define JOB_AUTHORITY_HUMANS_ONLY "HUMANS_ONLY"
#define JOB_AUTHORITY_NON_HUMANS_ALLOWED "NON_HUMANS_ALLOWED"

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"
#define DEFAULT_BIBLE "Default Bible Name"
#define DEFAULT_BIBLE_REPLACE(religion) "The Holy Book of [religion]"

#define JOB_DISPLAY_ORDER_DEFAULT 0

// Keys for jobconfig.toml
#define JOB_CONFIG_PLAYTIME_REQUIREMENTS "Playtime Requirements"
#define JOB_CONFIG_REQUIRED_ACCOUNT_AGE "Required Account Age"
#define JOB_CONFIG_REQUIRED_CHARACTER_AGE "Required Character Age"
#define JOB_CONFIG_SPAWN_POSITIONS "Spawn Positions"
#define JOB_CONFIG_TOTAL_POSITIONS "Total Positions"
#define JOB_CONFIG_HUMAN_AUTHORITY "Human Authority Whitelist Setting"

/**
 * =======================
 * WARNING WARNING WARNING
 * WARNING WARNING WARNING
 * WARNING WARNING WARNING
 * =======================
 * These names are used as keys in many locations in the database
 * you cannot change them trivially without breaking job bans and
 * role time tracking, if you do this and get it wrong you will die
 * and it will hurt the entire time
 */

//No department
#define JOB_ASSISTANT "Colonist" // ARK STATION EDIT || Assistant
#define JOB_PRISONER "Prisoner"
//Command
#define JOB_CAPTAIN "Ark Commander" // ARK STATION EDIT || Captain
#define JOB_HEAD_OF_PERSONNEL "Donk Co. Manager" // ARK STATION EDIT || Head of Personnel
#define JOB_HEAD_OF_SECURITY "Head of Red Hawk" // ARK STATION EDIT || Head of Security
#define JOB_RESEARCH_DIRECTOR "Scientific Director" // ARK STATION EDIT || Research Director
#define JOB_CHIEF_ENGINEER "Tech Overseer" // ARK STATION EDIT || Chief Engineer
#define JOB_CHIEF_MEDICAL_OFFICER "Medtech Curator" // ARK STATION EDIT || Chief Medical Officer
#define JOB_BRIDGE_ASSISTANT "Bridge Assistant"
#define JOB_VETERAN_ADVISOR "Veteran Security Advisor"
//Silicon
#define JOB_AI "AI"
#define JOB_CYBORG "Synthetic Unit" // ARK STATION EDIT || Cyborg
#define JOB_PERSONAL_AI "Personal AI"
#define JOB_HUMAN_AI "Big Brother"
//Security
#define JOB_WARDEN "Red Hawk Sergeant" // ARK STATION EDIT || Warden
#define JOB_DETECTIVE "RHIB Agent" // ARK STATION EDIT || Detective
#define JOB_SECURITY_OFFICER "Red Hawk Private" // ARK STATION EDIT || Security Officer
#define JOB_SECURITY_OFFICER_MEDICAL "Red Hawk Private (Green)" // ARK STATION EDIT || Security Officer (Medical)
#define JOB_SECURITY_OFFICER_ENGINEERING "Red Hawk Private (Orange)" // ARK STATION EDIT || Security Officer (Engineering)
#define JOB_SECURITY_OFFICER_SCIENCE "Red Hawk Private (Purple)" // ARK STATION EDIT || Security Officer (Science)
#define JOB_SECURITY_OFFICER_SUPPLY "Red Hawk Private (Brown)" // ARK STATION EDIT || Security Officer (Cargo)
#define JOB_CORRECTIONS_OFFICER "Corrections Officer" // NOVA EDIT ADDITION // ARK STATION REMOVED
//Engineering
#define JOB_STATION_ENGINEER "Engine Specialist" // ARK STATION EDIT || Station Engineer
#define JOB_ATMOSPHERIC_TECHNICIAN "Life Support Technician" // ARK STATION EDIT || Atmospheric Technician
#define JOB_TELECOMMS_SPECIALIST "Telecomms Specialist" // NOVA EDIT ADDITION
#define JOB_ENGINEERING_GUARD "Engineering Guard" // NOVA EDIT ADDITION // ARK STATION REMOVED
//Medical
#define JOB_CORONER "Necropsier" // ARK STATION EDIT || Coroner
#define JOB_MEDICAL_DOCTOR "Physician" // ARK STATION EDIT || Medical Doctor
#define JOB_PARAMEDIC "Emergency Medical Technician" // ARK STATION EDIT || Paramedic
#define JOB_CHEMIST "Synthetic Pharmacist" // ARK STATION EDIT || Chemist
#define JOB_VIROLOGIST "Viral Selectionist" // ARK STATION EDIT || Virologist
#define JOB_ORDERLY "Orderly" // NOVA EDIT ADDITION // ARK STATION REMOVED
//Science
#define JOB_SCIENTIST "Researcher" // ARK STATION EDIT || Scientist
#define JOB_ROBOTICIST "Biomechanical Engineer" // ARK STATION EDIT || Roboticist
#define JOB_GENETICIST "Bioaugmentator" // ARK STATION EDIT || Geneticist
#define JOB_SCIENCE_GUARD "Science Guard" // NOVA EDIT ADDITION // ARK STATION REMOVED
//Supply
#define JOB_QUARTERMASTER "Quartermaster"
#define JOB_CARGO_TECHNICIAN "Deck Worker" // ARK STATION EDIT || Cargo Technician
#define JOB_CARGO_GORILLA "Cargo Gorilla"
#define JOB_SHAFT_MINER "Excavation Specialist" // ARK STATION EDIT || Shaft Miner
#define JOB_BITRUNNER "Bitrunner"
#define JOB_CUSTOMS_AGENT "Customs Agent" // NOVA EDIT ADDITION // ARK STATION REMOVED
//Service
#define JOB_BARTENDER "Bartender"
#define JOB_BOTANIST "Botanist"
#define JOB_COOK "Cook"
#define JOB_CHEF "Chef" // Alternate cook title.
#define JOB_JANITOR "Janitor"
#define JOB_CLOWN "Clown"
#define JOB_MIME "Mime"
#define JOB_CURATOR "Curator"
#define JOB_LAWYER "Lawyer"
#define JOB_CHAPLAIN "Priest of Neo-Vatican" // ARK STATION EDIT || Chaplain
#define JOB_PSYCHOLOGIST "Psychologist"
#define JOB_PUN_PUN "Pun Pun"
#define JOB_BARBER "Barber" // NOVA EDIT ADDITION
#define JOB_BOUNCER "Donk Co. Guard" // NOVA EDIT ADDITION // ARK STATION EDIT || Service Guard
//ERTs
#define JOB_ERT_DEATHSQUAD "Death Commando"
#define JOB_ERT_COMMANDER "Emergency Response Team Commander"
#define JOB_ERT_OFFICER "Security Response Officer"
#define JOB_ERT_ENGINEER "Engineering Response Officer"
#define JOB_ERT_MEDICAL_DOCTOR "Medical Response Officer"
#define JOB_ERT_CHAPLAIN "Religious Response Officer"
#define JOB_ERT_JANITOR "Janitorial Response Officer"
#define JOB_ERT_CLOWN "Entertainment Response Officer"
//CentCom
#define JOB_CENTCOM "Central Command"
#define JOB_CENTCOM_OFFICIAL "CentCom Official"
#define JOB_CENTCOM_ADMIRAL "Admiral"
#define JOB_CENTCOM_COMMANDER "CentCom Commander"
#define JOB_CENTCOM_VIP "VIP Guest"
#define JOB_CENTCOM_BARTENDER "CentCom Bartender"
#define JOB_CENTCOM_CUSTODIAN "Custodian"
#define JOB_CENTCOM_THUNDERDOME_OVERSEER "Thunderdome Overseer"
#define JOB_CENTCOM_MEDICAL_DOCTOR "Medical Officer"
#define JOB_CENTCOM_RESEARCH_OFFICER "Research Officer"
#define JOB_CENTCOM_SPECIAL_OFFICER "Special Ops Officer"
#define JOB_CENTCOM_PRIVATE_SECURITY "Private Security Force"
// NOVA EDIT ADDITION START
#define JOB_BLUESHIELD "Solar Federation Shield" // ARK STATION EDIT || Blueshield
#define JOB_NT_REP "Consul of the Solar Federation" // ARK STATION EDIT || Nanotrasen Consultant
// Nanotrasen Naval Command jobs
#define JOB_NAVAL_ENSIGN "Ensign"
#define JOB_NAVAL_LIEUTENANT "Lieutenant"
#define JOB_NAVAL_LTCR "Lieutenant Commander"
#define JOB_NAVAL_COMMANDER "Commander"
#define JOB_NAVAL_CAPTAIN "Captain"
#define JOB_NAVAL_REAR_ADMIRAL "Rear Admiral"
#define JOB_NAVAL_ADMIRAL "Admiral"
#define JOB_NAVAL_FLEET_ADMIRAL "Fleet Admiral"
// Off-Station
#define JOB_SPACE_POLICE "SolFed Police Department" // ARK STATION EDIT || Space Police
#define JOB_SOLFED "SolFed"
#define JOB_SOLFED_LIASON "SolFed Liason"
// NOVA EDIT ADDITION END

//Lost crew
#define JOB_LOSTCREW_ENGINEER "Visiting Engineer"
#define JOB_LOSTCREW_MEDICAL "Visiting Doctor"
#define JOB_LOSTCREW_SECURITY "Visiting Officer"
#define JOB_LOSTCREW_SCIENCE "Visiting Scientist"
#define JOB_LOSTCREW_CARGO "Visiting Technician"
#define JOB_LOSTCREW_CIVILLIAN "Visiting Civillian"

#define JOB_GROUP_ENGINEERS list( \
	JOB_STATION_ENGINEER, \
	JOB_ATMOSPHERIC_TECHNICIAN, \
)


#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_BRIDGE_ASSISTANT 4
#define JOB_DISPLAY_ORDER_BARTENDER 5
#define JOB_DISPLAY_ORDER_BOTANIST 6
#define JOB_DISPLAY_ORDER_COOK 7
#define JOB_DISPLAY_ORDER_JANITOR 8
#define JOB_DISPLAY_ORDER_CLOWN 9
#define JOB_DISPLAY_ORDER_MIME 10
#define JOB_DISPLAY_ORDER_CURATOR 11
#define JOB_DISPLAY_ORDER_LAWYER 12
#define JOB_DISPLAY_ORDER_CHAPLAIN 13
#define JOB_DISPLAY_ORDER_PSYCHOLOGIST 14
#define JOB_DISPLAY_ORDER_PUN_PUN 15
#define JOB_DISPLAY_ORDER_AI 16
#define JOB_DISPLAY_ORDER_CYBORG 17
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 18
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 19
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 20
#define JOB_DISPLAY_ORDER_QUARTERMASTER 21
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 22
#define JOB_DISPLAY_ORDER_SHAFT_MINER 23
#define JOB_DISPLAY_ORDER_BITRUNNER 24
#define JOB_DISPLAY_ORDER_CARGO_GORILLA 25
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 26
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 27
#define JOB_DISPLAY_ORDER_PARAMEDIC 28
#define JOB_DISPLAY_ORDER_CHEMIST 29
#define JOB_DISPLAY_ORDER_CORONER 30
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 31
#define JOB_DISPLAY_ORDER_SCIENTIST 32
#define JOB_DISPLAY_ORDER_ROBOTICIST 33
#define JOB_DISPLAY_ORDER_GENETICIST 34
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 35
#define JOB_DISPLAY_ORDER_VETERAN_ADVISOR 36
#define JOB_DISPLAY_ORDER_WARDEN 37
#define JOB_DISPLAY_ORDER_DETECTIVE 38
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 39
#define JOB_DISPLAY_ORDER_PRISONER 40
#define JOB_DISPLAY_ORDER_VIROLOGIST 401 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_SECURITY_MEDIC 402 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_CORRECTIONS_OFFICER 403 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_NANOTRASEN_CONSULTANT 404 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_BLUESHIELD 405 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_ORDERLY 406 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_SCIENCE_GUARD 407 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_BOUNCER 408 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_ENGINEER_GUARD 409 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_CUSTOMS_AGENT 410 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_EXP_CORPS 411 //NOVA EDIT ADDITION
#define JOB_DISPLAY_ORDER_TELECOMMS_SPECIALIST 412 //NOVA EDIT ADDITION

#define JOB_DISPLAY_ORDER_STOWAWAY 52 // ARK STATION EDIT ADDITION
#define JOB_DISPLAY_ORDER_MECHANIC 53 // ARK STATION EDIT ADDITION
#define JOB_DISPLAY_ORDER_BRIG_PILOT 54 // ARK STATION EDIT ADDITION
#define JOB_DISPLAY_ORDER_DEACON 55 // ARK STATION EDIT ADDITION
#define JOB_DISPLAY_ORDER_FISCAL 56 // ARK STATION EDIT ADDITION
#define JOB_DISPLAY_ORDER_ADVISOR 57 // ARK STATION EDIT ADDITION

#define DEPARTMENT_UNASSIGNED "No Department"

#define DEPARTMENT_BITFLAG_SECURITY (1<<0)
#define DEPARTMENT_SECURITY "Red Hawk Security" // ARK STATION EDIT || Security
#define DEPARTMENT_BITFLAG_COMMAND (1<<1)
#define DEPARTMENT_COMMAND "Ark Command" // ARK STATION EDIT || Command
#define DEPARTMENT_BITFLAG_SERVICE (1<<2)
#define DEPARTMENT_SERVICE "Donk Corporation" // ARK STATION EDIT || Service
#define DEPARTMENT_BITFLAG_CARGO (1<<3)
#define DEPARTMENT_CARGO "Atlas and Nanotrasen" // ARK STATION EDIT || Cargo
#define DEPARTMENT_BITFLAG_ENGINEERING (1<<4)
#define DEPARTMENT_ENGINEERING "Global Solar Energy" // ARK STATION EDIT || Engineering
#define DEPARTMENT_BITFLAG_SCIENCE (1<<5)
#define DEPARTMENT_SCIENCE "Bishop Developments" // ARK STATION EDIT || Science
#define DEPARTMENT_BITFLAG_MEDICAL (1<<6)
#define DEPARTMENT_MEDICAL "De Forest" // ARK STATION EDIT || Medical
#define DEPARTMENT_BITFLAG_SILICON (1<<7)
#define DEPARTMENT_SILICON "Synthetics" // ARK STATION EDIT || Silicon
#define DEPARTMENT_BITFLAG_ASSISTANT (1<<8)
#define DEPARTMENT_ASSISTANT "Colonist" // ARK STATION EDIT || Assistant
#define DEPARTMENT_BITFLAG_CAPTAIN (1<<9)
#define DEPARTMENT_CAPTAIN "Ark Commander" // ARK STATION EDIT || Captain
#define DEPARTMENT_BITFLAG_CENTRAL_COMMAND (1<<10) //NOVA EDIT CHANGE
#define DEPARTMENT_CENTRAL_COMMAND "SolFed Workers" //NOVA EDIT CHANGE // ARK STATION EDIT || Command Support

#define DEPARTMENT_BITFLAG_CHURCH (1<<11) // ARK STATION EDIT ADDITION
#define DEPARTMENT_CHURCH "Neo-Vatican Church" // ARK STATION EDIT ADDITION

DEFINE_BITFIELD(departments_bitflags, list(
	"Red Hawk Security" = DEPARTMENT_BITFLAG_SECURITY, // ARK STATION EDIT
	"Ark Command" = DEPARTMENT_BITFLAG_COMMAND, // ARK STATION EDIT
	"Donk Corporation" = DEPARTMENT_BITFLAG_SERVICE, // ARK STATION EDIT
	"Atlas and Nanotrasen" = DEPARTMENT_BITFLAG_CARGO, // ARK STATION EDIT
	"Global Solar Energy" = DEPARTMENT_BITFLAG_ENGINEERING, // ARK STATION EDIT
	"Bishop Developments" = DEPARTMENT_BITFLAG_SCIENCE, // ARK STATION EDIT
	"De Forest" = DEPARTMENT_BITFLAG_MEDICAL, // ARK STATION EDIT
	"Synthetics" = DEPARTMENT_BITFLAG_SILICON, // ARK STATION EDIT
	"Colonist" = DEPARTMENT_BITFLAG_ASSISTANT, // ARK STATION EDIT
	"Ark Commander" = DEPARTMENT_BITFLAG_CAPTAIN, // ARK STATION EDIT
	"Neo-Vatican Church" = DEPARTMENT_BITFLAG_CHURCH, // ARK STATION ADDITION
))

/* Job datum job_flags */
/// Whether the mob is announced on arrival.
#define JOB_ANNOUNCE_ARRIVAL (1<<0)
/// Whether the mob is added to the crew manifest.
#define JOB_CREW_MANIFEST (1<<1)
/// Whether the mob is equipped through SSjob.equip_rank() on spawn.
#define JOB_EQUIP_RANK (1<<2)
/// Whether the job is considered a regular crew member of the station. Equipment such as AI and cyborgs not included.
#define JOB_CREW_MEMBER (1<<3)
/// Whether this job can be joined through the new_player menu.
#define JOB_NEW_PLAYER_JOINABLE (1<<4)
/// Whether this job appears in bold in the job menu.
#define JOB_BOLD_SELECT_TEXT (1<<5)
/// Reopens this position if we lose the player at roundstart.
#define JOB_REOPEN_ON_ROUNDSTART_LOSS (1<<6)
/// If the player with this job can have quirks assigned to him or not. Relevant for new player joinable jobs and roundstart antags.
#define JOB_ASSIGN_QUIRKS (1<<7)
/// Whether this job can be an intern.
#define JOB_CAN_BE_INTERN (1<<8)
/// This job cannot have more slots opened by the Head of Personnel (but admins or other random events can still do this).
#define JOB_CANNOT_OPEN_SLOTS (1<<9)
/// This job will not display on the job menu when there are no slots available, instead of appearing greyed out
#define JOB_HIDE_WHEN_EMPTY (1<<10)
/// This job cannot be signed up for at round start or recorded in your preferences
#define JOB_LATEJOIN_ONLY (1<<11)
/// This job is a head of staff.
#define JOB_HEAD_OF_STAFF (1<<12)

DEFINE_BITFIELD(job_flags, list(
	"JOB_ANNOUNCE_ARRIVAL" = JOB_ANNOUNCE_ARRIVAL,
	"JOB_CREW_MANIFEST" = JOB_CREW_MANIFEST,
	"JOB_EQUIP_RANK" = JOB_EQUIP_RANK,
	"JOB_CREW_MEMBER" = JOB_CREW_MEMBER,
	"JOB_NEW_PLAYER_JOINABLE" = JOB_NEW_PLAYER_JOINABLE,
	"JOB_BOLD_SELECT_TEXT" = JOB_BOLD_SELECT_TEXT,
	"JOB_REOPEN_ON_ROUNDSTART_LOSS" = JOB_REOPEN_ON_ROUNDSTART_LOSS,
	"JOB_ASSIGN_QUIRKS" = JOB_ASSIGN_QUIRKS,
	"JOB_CAN_BE_INTERN" = JOB_CAN_BE_INTERN,
	"JOB_CANNOT_OPEN_SLOTS" = JOB_CANNOT_OPEN_SLOTS,
	"JOB_HIDE_WHEN_EMPTY" = JOB_HIDE_WHEN_EMPTY,
	"JOB_LATEJOIN_ONLY" = JOB_LATEJOIN_ONLY,
	"JOB_HEAD_OF_STAFF" = JOB_HEAD_OF_STAFF,
))

/// Combination flag for jobs which are considered regular crew members of the station.
#define STATION_JOB_FLAGS (JOB_ANNOUNCE_ARRIVAL|JOB_CREW_MANIFEST|JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS|JOB_CAN_BE_INTERN)
/// Combination flag for jobs which are considered heads of staff.
#define HEAD_OF_STAFF_JOB_FLAGS (JOB_BOLD_SELECT_TEXT|JOB_CANNOT_OPEN_SLOTS|JOB_HEAD_OF_STAFF)
/// Combination flag for jobs which are enabled by station traits.
#define STATION_TRAIT_JOB_FLAGS (JOB_CANNOT_OPEN_SLOTS|JOB_HIDE_WHEN_EMPTY|JOB_LATEJOIN_ONLY&~JOB_REOPEN_ON_ROUNDSTART_LOSS)

#define FACTION_NONE "None"
#define FACTION_STATION "Station"

// Variable macros used to declare who is the supervisor for a given job, announced to the player when they join as any given job.
#define SUPERVISOR_CAPTAIN "the Ark Commander" // "the Captain" // ARK STATION EDIT
#define SUPERVISOR_CE "the Tech Overseer" // "the Chief Engineer" // ARK STATION EDIT
#define SUPERVISOR_CMO "the Medtech Curator" // "the Chief Medical Officer" // ARK STATION EDIT
#define SUPERVISOR_HOP "the Donk Co. Manager" // "the Head of Personnel" // ARK STATION EDIT
#define SUPERVISOR_HOS "the Head of Red Hawk" // "the Head of Security" // ARK STATION EDIT
#define SUPERVISOR_QM "the Quartermaster"
#define SUPERVISOR_RD "the Scientific Director" // "the Research Director" // ARK STATION EDIT

/// Mind traits that should be shared by every head of staff. has to be this way cause byond lists lol
#define HEAD_OF_STAFF_MIND_TRAITS TRAIT_FAST_TYING, TRAIT_HIGH_VALUE_RANSOM
