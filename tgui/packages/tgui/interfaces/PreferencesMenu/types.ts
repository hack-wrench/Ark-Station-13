import { BooleanLike } from 'tgui-core/react';

import { sendAct } from '../../backend';
import {
  LoadoutCategory,
  LoadoutList,
} from './CharacterPreferences/loadout/base';
import { Gender } from './preferences/gender';

export enum Food {
  Alcohol = 'ALCOHOL',
  Breakfast = 'BREAKFAST',
  Bugs = 'BUGS',
  Cloth = 'CLOTH',
  Dairy = 'DAIRY',
  Fried = 'FRIED',
  Fruit = 'FRUIT',
  Gore = 'GORE',
  Grain = 'GRAIN',
  Gross = 'GROSS',
  Junkfood = 'JUNKFOOD',
  Meat = 'MEAT',
  Nuts = 'NUTS',
  Oranges = 'ORANGES',
  Pineapple = 'PINEAPPLE',
  Raw = 'RAW',
  Seafood = 'SEAFOOD',
  Stone = 'STONE',
  Sugar = 'SUGAR',
  Toxic = 'TOXIC',
  Vegetables = 'VEGETABLES',
  Bloody = 'BLOODY', // SKYRAT EDIT ADDITION - Hemophage Food
}

export enum JobPriority {
  Low = 1,
  Medium = 2,
  High = 3,
}

export type Name = {
  can_randomize: BooleanLike;
  explanation: string;
  group: string;
};

export type Species = {
  name: string;
  desc: string;
  lore: string[];
  icon: string;

  use_skintones: BooleanLike;
  sexes: BooleanLike;

  enabled_features: string[];

  nova_stars_only: boolean; // NOVA EDIT - Nova star quirks

  perks: {
    positive: Perk[];
    negative: Perk[];
    neutral: Perk[];
  };

  diet?: {
    liked_food: Food[];
    disliked_food: Food[];
    toxic_food: Food[];
  };
};

export type Perk = {
  ui_icon: string;
  name: string;
  description: string;
};

export type Department = {
  head?: string;
};

export type Job = {
  description: string;
  department: string;
  // NOVA EDIT
  nova_star?: boolean;
  alt_titles?: string[];
  // SKYRAT EDIT END
};

export type Quirk = {
  description: string;
  icon: string;
  name: string;
  value: number;
  customizable: boolean;
  customization_options?: string[];
  nova_stars_only: boolean; // NOVA EDIT ADDITION - Nova star quirks
  erp_quirk: boolean; // NOVA EDIT ADDITION - Purple ERP quirks
};

// SKYRAT EDIT START
export type Language = {
  description: string;
  name: string;
  icon: string;
  speaking: boolean;
};

export type Marking = {
  name: string;
  color: string;
  marking_id: string;
};

export type MarkingData = {
  marking_choices: string[];
  markings_list: Marking[];
};

export type Limb = {
  slot: string;
  name: string;
  can_augment: boolean;
  chosen_aug: string;
  chosen_style: string;
  aug_choices: Record<string, string>;
  costs: Record<string, number>;
  markings: MarkingData;
};

export type Organ = {
  slot: string;
  name: string;
  chosen_organ: string;
  organ_choices: Record<string, string>;
  costs: Record<string, number>;
};

// SKYRAT EDIT END
export type QuirkInfo = {
  max_positive_quirks: number;
  quirk_info: Record<string, Quirk>;
  quirk_blacklist: string[][];
  points_enabled: boolean;
};

export enum RandomSetting {
  AntagOnly = 1,
  Disabled = 2,
  Enabled = 3,
}

export enum JoblessRole {
  BeOverflow = 1,
  BeRandomJob = 2,
  ReturnToLobby = 3,
}

export enum GamePreferencesSelectedPage {
  Settings,
  Keybindings,
}

export const createSetPreference =
  (act: typeof sendAct, preference: string) => (value: unknown) => {
    act('set_preference', {
      preference,
      value,
    });
  };

export enum PrefsWindow {
  Character = 0,
  Game = 1,
  Keybindings = 2,
}

export type PreferencesMenuData = {
  character_preview_view: string;
  character_profiles: (string | null)[];

  preview_options: string[]; // NOVA EDIT ADDITION
  preview_selection: string; // NOVA EDIT ADDITION

  is_nova_star: BooleanLike; // NOVA EDIT - Star status
  erp_pref: BooleanLike; // NOVA EDIT ADDITION

  character_preferences: {
    clothing: Record<string, string>;
    features: Record<string, string>;
    game_preferences: Record<string, unknown>;
    non_contextual: {
      random_body: RandomSetting;
      [otherKey: string]: unknown;
    };
    secondary_features: Record<string, unknown>;
    supplemental_features: Record<string, unknown>;
    manually_rendered_features: Record<string, string>;

    names: Record<string, string>;
    vocals: Record<string, string>; // NOVA EDIT ADDITION

    misc: {
      gender: Gender;
      joblessrole: JoblessRole;
      species: string;
      loadout_lists: LoadoutList; // NOVA EDIT CHANGE - Multiple loadout presets - ORIGINAL: loadout_list: LoadoutList;
      job_clothes: BooleanLike;
      loadout_index: string; // NOVA EDIT ADDITION: Multiple loadout presets
    };

    randomization: Record<string, RandomSetting>;
  };

  content_unlocked: BooleanLike;

  job_bans?: string[];
  job_days_left?: Record<string, number>;
  job_required_experience?: Record<
    string,
    {
      experience_type: string;
      required_playtime: number;
    }
  >;
  job_preferences: Record<string, JobPriority>;

  // SKYRAT EDIT
  job_alt_titles: Record<string, string>;

  robotic_styles: string[];
  limbs_data: Limb[];
  organs_data: Organ[];
  marking_presets: string[];

  selected_languages: Language[];
  unselected_languages: Language[];
  total_language_points: number;
  quirk_points_enabled: number;
  quirks_balance: number;
  positive_quirk_count: number;
  species_restricted_jobs?: string[];
  ckey: string;
  is_donator: BooleanLike;
  // NOVA EDIT END
  keybindings: Record<string, string[]>;
  overflow_role: string;
  selected_quirks: string[];
  species_disallowed_quirks: string[];

  antag_bans?: string[];
  antag_days_left?: Record<string, number>;
  selected_antags: string[];

  active_slot: number;
  name_to_use: string;

  window: PrefsWindow;
};

export type ServerData = {
  jobs: {
    departments: Record<string, Department>;
    jobs: Record<string, Job>;
  };
  names: {
    types: Record<string, Name>;
  };
  quirks: QuirkInfo;
  random: {
    randomizable: string[];
  };
  loadout: {
    loadout_tabs: LoadoutCategory[];
  };
  species: Record<string, Species>;
  [otherKey: string]: unknown;
};
