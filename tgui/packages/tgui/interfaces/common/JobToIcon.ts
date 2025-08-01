export type AvailableJob = keyof typeof JOB2ICON;

/** Icon map of jobs to their fontawesome5 (free) counterpart. */
// NOVA EDIT START - ORIGINAL: export const JOB2ICONs = {
const BASEICONS = {
  // NOVA EDIT - END
  AI: 'eye',
  Assistant: 'toolbox',
  'Atmospheric Technician': 'fan',
  Bartender: 'cocktail',
  'Bit Avatar': 'code',
  Bitrunner: 'gamepad',
  Botanist: 'seedling',
  'Bridge Officer': 'mug-hot', // NOVA EDIT CHANGE - ORIGINAL:  'Bridge Assistant': 'building-shield',
  Captain: 'crown',
  'Cargo Gorilla': 'paw',
  'Cargo Technician': 'box',
  'CentCom Commander': 'star',
  'CentCom Head Intern': 'pen-fancy',
  'CentCom Intern': 'pen-alt',
  'CentCom Official': 'medal',
  Chaplain: 'cross',
  Chef: 'utensils',
  Chemist: 'prescription-bottle',
  'Chief Engineer': 'user-astronaut',
  'Chief Medical Officer': 'user-md',
  Clown: 'face-grin-tears',
  Cook: 'utensils',
  Coroner: 'skull',
  Curator: 'book',
  'Cyber Police': 'qrcode',
  Cyborg: 'robot',
  Detective: 'user-secret',
  Geneticist: 'dna',
  'Head of Personnel': 'dog',
  'Head of Security': 'user-shield',
  'Big Brother': 'eye',
  Janitor: 'soap',
  Lawyer: 'gavel',
  'Medical Doctor': 'staff-snake',
  Mime: 'comment-slash',
  Paramedic: 'truck-medical',
  'Personal AI': 'mobile-alt',
  Prisoner: 'lock',
  Psychologist: 'brain',
  Quartermaster: 'sack-dollar',
  'Research Director': 'user-graduate',
  Roboticist: 'battery-half',
  Scientist: 'flask',
  'Security Officer (Cargo)': 'shield-halved',
  'Security Officer (Engineering)': 'shield-halved',
  'Security Officer (Medical)': 'shield-halved',
  'Security Officer (Science)': 'shield-halved',
  'Security Officer': 'shield-halved',
  'Shaft Miner': 'digging',
  'Station Engineer': 'gears',
  'Syndicate Operative': 'dragon',
  'Veteran Security Advisor': 'ribbon',
  'Pun Pun': 'paw',
  Warden: 'handcuffs',
  // NOVA EDIT START - Nova-exclusive jobs have icons too
  'Telecomms Specialist': 'tower-cell',
  Virologist: 'virus',
  Barber: 'scissors',
  Blueshield: 'shield-dog',
  Bouncer: 'shield-heart',
  'Corrections Officer': 'hands-bound',
  'Customs Agent': 'shield-heart',
  'Engineering Guard': 'shield-heart',
  'Nanotrasen Consultant': 'clipboard-check',
  Orderly: 'shield-heart',
  'Science Guard': 'shield-heart',
  'Security Medic': 'heart-pulse',
  // NOVA EDIT END
  // ARK STATION EDIT START - Our Jobs
  Mechanic: 'space-shuttle',
  'Brig Pilot': 'space-shuttle',
  'Bridge Officer': 'paperclip',
  'Vanguard Operative': 'shopping-cart',
  Stowaway: 'question',
  Deacon: 'hands-praying',
  Fiscal: 'hand-fist',
  //
} as const;

// NOVA EDIT START - ALT TITLES
const ALTTITLES = {
  // AI - eye
  'Station Intelligence': BASEICONS['AI'],
  'Automated Overseer': BASEICONS['AI'],
  // Assistant - toolbox
  Civilian: BASEICONS['Assistant'],
  Tourist: BASEICONS['Assistant'],
  Businessman: BASEICONS['Assistant'],
  Businesswoman: BASEICONS['Assistant'],
  Trader: BASEICONS['Assistant'],
  Entertainer: BASEICONS['Assistant'],
  Freelancer: BASEICONS['Assistant'],
  Artist: BASEICONS['Assistant'],
  'Off-Duty Staff': BASEICONS['Assistant'],
  'Off-Duty Crew': BASEICONS['Assistant'],
  Visitor: BASEICONS['Assistant'],
  Traveler: BASEICONS['Assistant'],
  // Atmospheric Technician - fan
  'Life Support Technician': BASEICONS['Atmospheric Technician'],
  'Emergency Fire Technician': BASEICONS['Atmospheric Technician'],
  Firefighter: BASEICONS['Atmospheric Technician'],
  // Barber - scissors
  'Salon Manager': BASEICONS['Barber'],
  'Salon Technician': BASEICONS['Barber'],
  Stylist: BASEICONS['Barber'],
  Colorist: BASEICONS['Barber'],
  // Bartender - cocktail
  Mixologist: BASEICONS['Bartender'],
  Barkeeper: BASEICONS['Bartender'],
  Barista: BASEICONS['Bartender'],
  // Blueshield - shield-dog
  'Command Bodyguard': BASEICONS['Blueshield'],
  'Executive Protection Agent': BASEICONS['Blueshield'],
  // Botanist - seedling
  Hydroponicist: BASEICONS['Botanist'],
  Gardener: BASEICONS['Botanist'],
  'Botanical Researcher': BASEICONS['Botanist'],
  Herbalist: BASEICONS['Botanist'],
  Florist: BASEICONS['Botanist'],
  // Bouncer - shield-heart
  'Service Guard': BASEICONS['Bouncer'],
  // Captain - crown
  'Station Commander': BASEICONS['Captain'],
  'Commanding Officer': BASEICONS['Captain'],
  'Site Administrator': BASEICONS['Captain'],
  'Site Manager': BASEICONS['Captain'],
  'Site Overseer': BASEICONS['Captain'],
  'Site Director': BASEICONS['Captain'],
  // Cargo Technician - box
  'Warehouse Technician': BASEICONS['Cargo Technician'],
  'Deck Worker': BASEICONS['Cargo Technician'],
  Mailman: BASEICONS['Cargo Technician'],
  'Union Associate': BASEICONS['Cargo Technician'],
  'Inventory Associate': BASEICONS['Cargo Technician'],
  // Chaplain - cross
  Priest: BASEICONS['Chaplain'],
  Preacher: BASEICONS['Chaplain'],
  Reverend: BASEICONS['Chaplain'],
  Oracle: BASEICONS['Chaplain'],
  Pontifex: BASEICONS['Chaplain'],
  Magister: BASEICONS['Chaplain'],
  'High Priest': BASEICONS['Chaplain'],
  Imam: BASEICONS['Chaplain'],
  Rabbi: BASEICONS['Chaplain'],
  Monk: BASEICONS['Chaplain'],
  // Chemist - prescription-bottle
  Pharmacist: BASEICONS['Chemist'],
  Pharmacologist: BASEICONS['Chemist'],
  'Trainee Pharmacist': BASEICONS['Chemist'],
  // Chief Engineer - user-astronaut
  'Engineering Foreman': BASEICONS['Chief Engineer'],
  'Head of Engineering': BASEICONS['Chief Engineer'],
  // Chief Medical Officer - user-md
  'Medical Administrator': BASEICONS['Chief Medical Officer'],
  'Medical Director': BASEICONS['Chief Medical Officer'],
  'Head of Medical': BASEICONS['Chief Medical Officer'],
  'Chief Physician': BASEICONS['Chief Medical Officer'],
  'Head Physician': BASEICONS['Chief Medical Officer'],
  // Clown - face-grin-tears
  Jester: BASEICONS['Clown'],
  Joker: BASEICONS['Clown'],
  Comedian: BASEICONS['Clown'],
  // Cook/Chef - utensils
  Butcher: BASEICONS['Cook'],
  'Culinary Artist': BASEICONS['Cook'],
  'Sous-Chef': BASEICONS['Cook'],
  // Coroner - skull
  Mortician: BASEICONS['Coroner'],
  'Funeral Director': BASEICONS['Coroner'],
  // Curator - book
  Librarian: BASEICONS['Curator'],
  Journalist: BASEICONS['Curator'],
  Archivist: BASEICONS['Curator'],
  // Cyborg - robot
  Robot: BASEICONS['Cyborg'],
  Android: BASEICONS['Cyborg'],
  // Detective - user-secret
  'Forensic Technician': BASEICONS['Detective'],
  'Private Investigator': BASEICONS['Detective'],
  'Forensic Scientist': BASEICONS['Detective'],
  // Geneticist - dna
  'Mutation Researcher': BASEICONS['Geneticist'],
  // Head of Personnel - dog
  'Executive Officer': BASEICONS['Head of Personnel'],
  'Employment Officer': BASEICONS['Head of Personnel'],
  'Crew Supervisor': BASEICONS['Head of Personnel'],
  // Head of Security - user-shield
  'Security Commander': BASEICONS['Head of Security'],
  'Chief Constable': BASEICONS['Head of Security'],
  'Chief of Security': BASEICONS['Head of Security'],
  'Security Director': BASEICONS['Head of Security'],
  Sheriff: BASEICONS['Head of Security'],
  // Janitor - soap
  Custodian: BASEICONS['Janitor'],
  'Custodial Technician': BASEICONS['Janitor'],
  'Sanitation Technician': BASEICONS['Janitor'],
  'Maintenance Technician': BASEICONS['Janitor'],
  Concierge: BASEICONS['Janitor'],
  Maid: BASEICONS['Janitor'],
  // Lawyer - gavel
  'Internal Affairs Agent': BASEICONS['Lawyer'],
  'Human Resources Agent': BASEICONS['Lawyer'],
  'Defence Attorney': BASEICONS['Lawyer'],
  'Public Defender': BASEICONS['Lawyer'],
  Barrister: BASEICONS['Lawyer'],
  Prosecutor: BASEICONS['Lawyer'],
  'Legal Clerk': BASEICONS['Lawyer'],
  // Medical Doctor - staff-snake
  Surgeon: BASEICONS['Medical Doctor'],
  Nurse: BASEICONS['Medical Doctor'],
  'General Practitioner': BASEICONS['Medical Doctor'],
  'Medical Resident': BASEICONS['Medical Doctor'],
  Physician: BASEICONS['Medical Doctor'],
  'Registered Nurse': BASEICONS['Medical Doctor'],
  // Mime - comment-slash
  Pantomimist: BASEICONS['Mime'],
  // Nanotrasen Consultant - clipboard-check
  'Nanotrasen Diplomat': BASEICONS['Nanotrasen Consultant'],
  'Nanotrasen Advisor': BASEICONS['Nanotrasen Consultant'],
  // Paramedic - truck-medical
  'Emergency Medical Technician': BASEICONS['Paramedic'],
  'Search and Rescue Technician': BASEICONS['Paramedic'],
  'Emergency Medical Responder': BASEICONS['Paramedic'],
  // Prisoner - lock
  'Minimum Security Prisoner': BASEICONS['Prisoner'],
  'Maximum Security Prisoner': BASEICONS['Prisoner'],
  'SuperMax Security Prisoner': BASEICONS['Prisoner'],
  'Protective Custody Prisoner': BASEICONS['Prisoner'],
  Convict: BASEICONS['Prisoner'],
  Felon: BASEICONS['Prisoner'],
  Inmate: BASEICONS['Prisoner'],
  // Psychologist - brain
  Psychiatrist: BASEICONS['Psychologist'],
  Therapist: BASEICONS['Psychologist'],
  Counsellor: BASEICONS['Psychologist'],
  // Quartermaster - sack-dollar
  'Union Requisitions Officer': BASEICONS['Quartermaster'],
  'Deck Chief': BASEICONS['Quartermaster'],
  'Warehouse Supervisor': BASEICONS['Quartermaster'],
  'Supply Foreman': BASEICONS['Quartermaster'],
  'Head of Supply': BASEICONS['Quartermaster'],
  'Logistics Coordinator': BASEICONS['Quartermaster'],
  // Research Director - user-graduate
  'Silicon Administrator': BASEICONS['Research Director'],
  'Research Administrator': BASEICONS['Research Director'],
  'Lead Researcher': BASEICONS['Research Director'],
  'Biorobotics Director': BASEICONS['Research Director'],
  'Research Supervisor': BASEICONS['Research Director'],
  'Chief Science Officer': BASEICONS['Research Director'],
  'Director of Science': BASEICONS['Research Director'],
  // Roboticist - battery-half
  'Biomechanical Engineer': BASEICONS['Roboticist'],
  'Mechatronic Engineer': BASEICONS['Roboticist'],
  'Apprentice Roboticist': BASEICONS['Roboticist'],
  // Scientist - flask
  'Circuitry Designer': BASEICONS['Scientist'],
  Xenobiologist: BASEICONS['Scientist'],
  Cytologist: BASEICONS['Scientist'],
  'Plasma Researcher': BASEICONS['Scientist'],
  Anomalist: BASEICONS['Scientist'],
  'Lab Technician': BASEICONS['Scientist'],
  'Theoretical Physicist': BASEICONS['Scientist'],
  'Ordnance Technician': BASEICONS['Scientist'],
  Xenoarchaeologist: BASEICONS['Scientist'],
  'Research Assistant': BASEICONS['Scientist'],
  'Graduate Student': BASEICONS['Scientist'],
  // Security Medic - heart-pulse
  'Field Medic': BASEICONS['Security Medic'],
  'Security Corpsman': BASEICONS['Security Medic'],
  'Brig Physician': BASEICONS['Security Medic'],
  'Combat Medic': BASEICONS['Security Medic'],
  // Security Officer - shield-halved
  'Security Operative': BASEICONS['Security Officer'],
  Peacekeeper: BASEICONS['Security Officer'],
  'Security Cadet': BASEICONS['Security Officer'],
  'Security Specialist': BASEICONS['Security Officer'],
  // Shaft Miner - digging
  'Union Miner': BASEICONS['Shaft Miner'],
  Excavator: BASEICONS['Shaft Miner'],
  Spelunker: BASEICONS['Shaft Miner'],
  'Drill Technician': BASEICONS['Shaft Miner'],
  Prospector: BASEICONS['Shaft Miner'],
  // Station Engineer - gears
  'Emergency Damage Control Technician': BASEICONS['Station Engineer'],
  Electrician: BASEICONS['Station Engineer'],
  'Engine Technician': BASEICONS['Station Engineer'],
  'EVA Technician': BASEICONS['Station Engineer'],
  'Apprentice Engineer': BASEICONS['Station Engineer'],
  'Engineering Trainee': BASEICONS['Station Engineer'],
  'Nuclear Engineer': BASEICONS['Station Engineer'],
  // Telecomms Specialist - tower-cell
  'Network Engineer': BASEICONS['Telecomms Specialist'],
  'Wireless Operator': BASEICONS['Telecomms Specialist'],
  'Tram Technician': BASEICONS['Telecomms Specialist'],
  Sysadmin: BASEICONS['Telecomms Specialist'],
  // Virologist - virus
  Pathologist: BASEICONS['Virologist'],
  'Junior Pathologist': BASEICONS['Virologist'],
  // Warden - handcuffs
  'Brig Sergeant': BASEICONS['Warden'],
  'Dispatch Officer': BASEICONS['Warden'],
  'Brig Governor': BASEICONS['Warden'],
  Jailer: BASEICONS['Warden'],
  // ARK STATION JOBS START
  // Mechanic - space-shuttle
  'Pod Pilot': BASEICONS['Mechanic'],
  'Space Pods Builder': BASEICONS['Mechanic'],
  'Space Pods Maintainer': BASEICONS['Mechanic'],
  Coachman: BASEICONS['Mechanic'],
  // Priest - cross
  'Priest of Neo-Vatican': BASEICONS['Chaplain'],
  // Brig Pilot - space-shuttle
  'Security Pilot': BASEICONS['Brig Pilot'],
  'Space Guard': BASEICONS['Brig Pilot'],
  'Brig Pilot Recruit': BASEICONS['Brig Pilot'],
  'Security Mecha Pilot': BASEICONS['Brig Pilot'],
  // Bridge Officer - paperclip
  'Command Secretary': BASEICONS['Bridge Officer'],
  'Command Officer': BASEICONS['Bridge Officer'],
  'Bridge Secretary': BASEICONS['Bridge Officer'],
  Ensign: BASEICONS['Bridge Officer'],
  'Bridge Advisor': BASEICONS['Bridge Officer'],
  'Bridge Intern': BASEICONS['Bridge Officer'],
  // Vanguard Operative - shopping-cart
  'Expeditionary Trooper': BASEICONS['Vanguard Operative'],
  'Vanguard Pointman': BASEICONS['Vanguard Operative'],
  'Expeditionary Field Medic': BASEICONS['Vanguard Operative'],
  'Vanguard Marksman': BASEICONS['Vanguard Operative'],
  'Expeditionary Combat Technician': BASEICONS['Vanguard Operative'],
  // Stowaway - question
  Interloper: BASEICONS['Stowaway'],
  Hobo: BASEICONS['Stowaway'],
  Migrant: BASEICONS['Stowaway'],
  'Tunnel Warrior': BASEICONS['Stowaway'],
  Escapist: BASEICONS['Stowaway'],
  Savage: BASEICONS['Stowaway'],
  Outcast: BASEICONS['Stowaway'],
  // // RE-NAMING OTHER JOBS // //
  // Assistant
  Colonist: BASEICONS['Assistant'],
  // Captain
  'Ark Commander': BASEICONS['Captain'],
  // Blueshield
  'Solar Federation Shield': BASEICONS['Blueshield'],
  // NTR
  'Consul of the Solar Federation': BASEICONS['Nanotrasen Consultant'],
  // Security
  'Head of Red Hawk': BASEICONS['Head of Security'],
  'Red Hawk Private (Brown)': BASEICONS['Security Officer'],
  'Red Hawk Private (Orange)': BASEICONS['Security Officer'],
  'Red Hawk Private (Green)': BASEICONS['Security Officer'],
  'Red Hawk Private (Purple)': BASEICONS['Security Officer'],
  'Red Hawk Private': BASEICONS['Security Officer'],
  'Red Hawk Medic': BASEICONS['Security Medic'],
  'Red Hawk Pilot': BASEICONS['Brig Pilot'],
  'RHIB Agent': BASEICONS['Detective'],
  'Red Hawk Sergeant': BASEICONS['Warden'],
  // Cargo
  'Excavation Specialist': BASEICONS['Shaft Miner'],
  'Ruin Explorer': BASEICONS['Vanguard Operative'],
  // Engineering
  'Tech Overseer': BASEICONS['Chief Engineer'],
  'Engine Specialist': BASEICONS['Station Engineer'],
  // Medical
  'Medtech Curator': BASEICONS['Chief Medical Officer'],
  Necropsier: BASEICONS['Coroner'],
  'Synthetic Pharmacist': BASEICONS['Chemist'],
  'Viral Selectionist': BASEICONS['Virologist'],
  // RND
  'Scientific Director': BASEICONS['Research Director'],
  Researcher: BASEICONS['Scientist'],
  Bioaugmentator: BASEICONS['Geneticist'],
  // Service
  'Donk Co. Manager': BASEICONS['Head of Personnel'],
  'Donk Co. Guard': BASEICONS['Bouncer'],
  // Silicon
  'Synthetic Unit': BASEICONS['Cyborg'],
  'S.H.O.D.A.N.': BASEICONS['Big Brother'],
  // ARK STATION JOBS END
} as const;

// Combine the Base icons and ALt titles
export const JOB2ICON = { ...BASEICONS, ...ALTTITLES } as const;
// NOVA EDIT END
