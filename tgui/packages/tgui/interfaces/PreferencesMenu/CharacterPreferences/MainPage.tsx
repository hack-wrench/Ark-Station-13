import { filter, map, sortBy } from 'common/collections';
import { ReactNode, useState } from 'react';
import { sendAct, useBackend } from 'tgui/backend';
import {
  Box,
  Button,
  Dropdown, // NOVA EDIT ADDITION
  Floating,
  Input,
  LabeledList,
  Section,
  Stack,
} from 'tgui-core/components';
import { exhaustiveCheck } from 'tgui-core/exhaustive';
import { classes } from 'tgui-core/react';
import { createSearch } from 'tgui-core/string';

import { CharacterPreview } from '../../common/CharacterPreview';
import { PageButton } from '../components/PageButton';
import { RandomizationButton } from '../components/RandomizationButton';
import { features } from '../preferences/features';
import {
  FeatureChoicedServerData,
  FeatureValueInput,
} from '../preferences/features/base';
import { Gender, GENDERS } from '../preferences/gender';
import {
  createSetPreference,
  PreferencesMenuData,
  RandomSetting,
  ServerData,
} from '../types';
import { useRandomToggleState } from '../useRandomToggleState';
import { useServerPrefs } from '../useServerPrefs';
import { DeleteCharacterPopup } from './DeleteCharacterPopup';
import { MultiNameInput, NameInput } from './names';
import { VocalsInput, VoiceInput } from './vocals'; // NOVA EDIT ADDITION

const CLOTHING_CELL_SIZE = 48;
const CLOTHING_SIDEBAR_ROWS = 13.4; // NOVA EDIT CHANGE - ORIGINAL:  9

const CLOTHING_SELECTION_CELL_SIZE = 48;
const CLOTHING_SELECTION_WIDTH = 5.4;
const CLOTHING_SELECTION_MULTIPLIER = 5.2;

type CharacterControlsProps = {
  handleRotate: () => void;
  handleOpenSpecies: () => void;
  handleFood: () => void; // NOVA EDIT ADDITION
  gender: Gender;
  setGender: (gender: Gender) => void;
  showGender: boolean;
  canDeleteCharacter: boolean;
  handleDeleteCharacter: () => void;
};

function CharacterControls(props: CharacterControlsProps) {
  return (
    <Stack>
      <Stack.Item>
        <Button
          onClick={props.handleRotate}
          fontSize="22px"
          icon="undo"
          tooltip="Rotate"
          tooltipPosition="top"
        />
      </Stack.Item>

      <Stack.Item>
        <Button
          onClick={props.handleOpenSpecies}
          fontSize="22px"
          icon="paw"
          tooltip="Species"
          tooltipPosition="top"
        />
      </Stack.Item>

      {props.showGender && (
        <Stack.Item>
          <GenderButton
            gender={props.gender}
            handleSetGender={props.setGender}
          />
        </Stack.Item>
      )}
      {/* NOVA EDIT ADDITION START */}
      <Stack.Item>
        <Button
          onClick={props.handleFood}
          fontSize="22px"
          icon="drumstick-bite"
          tooltip="Edit Food Preferences"
          tooltipPosition="top"
        />
        {/* NOVA EDIT ADDITION END */}
      </Stack.Item>
      <Stack.Item>
        <Button
          onClick={props.handleDeleteCharacter}
          fontSize="22px"
          icon="trash"
          color="red"
          tooltip="Delete Character"
          tooltipPosition="top"
          disabled={!props.canDeleteCharacter}
        />
      </Stack.Item>
    </Stack>
  );
}

type ChoicedSelectionProps = {
  name: string;
  catalog: FeatureChoicedServerData;
  selected: string;
  supplementalFeature?: string;
  supplementalValue?: unknown;
  onSelect: (value: string) => void;
};

function ChoicedSelection(props: ChoicedSelectionProps) {
  const { catalog, supplementalFeature, supplementalValue } = props;
  const [searchText, setSearchText] = useState('');

  if (!catalog.icons) {
    return <Box color="red">Provided catalog had no icons!</Box>;
  }

  return (
    <Box
      className="ChoicedSelection"
      style={{
        height: `${
          CLOTHING_SELECTION_CELL_SIZE * CLOTHING_SELECTION_MULTIPLIER
        }px`,
        width: `${CLOTHING_SELECTION_CELL_SIZE * CLOTHING_SELECTION_WIDTH}px`,
      }}
    >
      <Stack fill vertical g={0}>
        <Stack.Item>
          <Section
            fill
            title={`Select ${props.name.toLowerCase()}`}
            buttons={
              supplementalFeature && (
                <FeatureValueInput
                  shrink
                  feature={features[supplementalFeature]}
                  featureId={supplementalFeature}
                  value={supplementalValue}
                />
              )
            }
          >
            <Input
              autoFocus
              fluid
              placeholder="Search..."
              onChange={setSearchText}
            />
          </Section>
        </Stack.Item>
        <Stack.Item grow>
          <Section fill scrollable noTopPadding>
            <Stack wrap>
              {searchInCatalog(searchText, catalog.icons).map(
                ([name, image], index) => {
                  return (
                    <Button
                      key={index}
                      onClick={() => {
                        props.onSelect(name);
                      }}
                      selected={name === props.selected}
                      tooltip={name}
                      tooltipPosition="right"
                      style={{
                        height: `${CLOTHING_SELECTION_CELL_SIZE}px`,
                        width: `${CLOTHING_SELECTION_CELL_SIZE}px`,
                      }}
                    >
                      <Box
                        className={classes([
                          'preferences32x32',
                          image,
                          'centered-image',
                        ])}
                        style={{
                          transform:
                            'translateX(-50%) translateY(-50%) scale(0.8)',
                        }}
                      />
                    </Button>
                  );
                },
              )}
            </Stack>
          </Section>
        </Stack.Item>
      </Stack>
    </Box>
  );
}

function searchInCatalog(searchText = '', catalog: Record<string, string>) {
  let items = Object.entries(catalog);
  if (searchText) {
    items = filter(
      items,
      createSearch(searchText, ([name, _icon]) => name),
    );
  }
  return items;
}

type GenderButtonProps = {
  handleSetGender: (gender: Gender) => void;
  gender: Gender;
};

function GenderButton(props: GenderButtonProps) {
  return (
    <Floating
      placement="right"
      content={
        <Stack backgroundColor="white" p={0.3}>
          {[Gender.Male, Gender.Female, Gender.Other, Gender.Other2].map(
            (gender) => {
              return (
                <Stack.Item key={gender}>
                  <Button
                    selected={gender === props.gender}
                    onClick={() => {
                      props.handleSetGender(gender);
                    }}
                    fontSize="22px"
                    icon={GENDERS[gender].icon}
                    tooltip={GENDERS[gender].text}
                    tooltipPosition="top"
                  />
                </Stack.Item>
              );
            },
          )}
        </Stack>
      }
    >
      <div>
        <Button
          fontSize="22px"
          icon={GENDERS[props.gender].icon}
          tooltip="Gender"
          tooltipPosition="top"
        />
      </div>
    </Floating>
  );
}

type CatalogItem = {
  name: string;
  supplemental_feature?: string;
};

type MainFeatureProps = {
  catalog: FeatureChoicedServerData & CatalogItem;
  currentValue: string;
  handleSelect: (newClothing: string) => void;
  randomization?: RandomSetting;
  setRandomization: (newSetting: RandomSetting) => void;
};

function MainFeature(props: MainFeatureProps) {
  const { data } = useBackend<PreferencesMenuData>();
  const {
    catalog,
    currentValue,
    handleSelect,
    randomization,
    setRandomization,
  } = props;

  const supplementalFeature = catalog.supplemental_feature;

  return (
    <Floating
      stopChildPropagation
      placement="right-start"
      content={
        <ChoicedSelection
          name={catalog.name}
          catalog={catalog}
          selected={currentValue}
          supplementalFeature={supplementalFeature}
          supplementalValue={
            supplementalFeature &&
            data.character_preferences.supplemental_features[
              supplementalFeature
            ]
          }
          onSelect={handleSelect}
        />
      }
    >
      <Button
        style={{
          height: `${CLOTHING_CELL_SIZE}px`,
          width: `${CLOTHING_CELL_SIZE}px`,
        }}
        position="relative"
      >
        <Box
          className={classes([
            'preferences32x32',
            catalog.icons![currentValue],
            'centered-image',
          ])}
          style={{
            transform: randomization
              ? 'translateX(-70%) translateY(-70%) scale(1.1)'
              : 'translateX(-50%) translateY(-50%) scale(1.3)',
          }}
        />

        {randomization && (
          <RandomizationButton
            dropdownProps={{
              dropdownStyle: {
                bottom: 0,
                position: 'absolute',
                right: '1px',
              },

              onOpen: (event) => {
                // We're a button inside a button.
                // Did you know that's against the W3C standard? :)
                // FIXME: Button unclickable!
                event.cancelBubble = true;
                event.stopPropagation();
              },
            }}
            value={randomization}
            setValue={setRandomization}
          />
        )}
      </Button>
    </Floating>
  );
}

const createSetRandomization =
  (act: typeof sendAct, preference: string) => (newSetting: RandomSetting) => {
    act('set_random_preference', {
      preference,
      value: newSetting,
    });
  };

function sortPreferences(array: [string, unknown][]) {
  return sortBy(array, ([featureId, _]) => {
    const feature = features[featureId];
    return feature?.name;
  });
}

type PreferenceListProps = {
  preferences: Record<string, unknown>;
  randomizations: Record<string, RandomSetting>;
  maxHeight: string;
  children?: ReactNode;
};

export function PreferenceList(props: PreferenceListProps) {
  const { act } = useBackend<PreferencesMenuData>();
  const { preferences, randomizations, maxHeight, children } = props;

  return (
    <Stack.Item
      basis="50%"
      grow
      style={{
        background: 'rgba(0, 0, 0, 0.5)',
        padding: '4px',
      }}
      overflowX="hidden"
      overflowY="auto"
      maxHeight={maxHeight}
    >
      <LabeledList>
        {sortPreferences(Object.entries(preferences)).map(
          ([featureId, value]) => {
            const feature = features[featureId];
            const randomSetting = randomizations[featureId];

            if (feature === undefined) {
              return (
                <Stack.Item key={featureId}>
                  <b>Feature {featureId} is not recognized.</b>
                </Stack.Item>
              );
            }

            return (
              <LabeledList.Item
                key={featureId}
                // NOVA EDIT CHANGE - ORIGINAL: label={feature.name}
                label={<Box mt={0.5}>{feature.name}</Box>} // replicate middle align
                tooltip={feature.description}
                verticalAlign="top" // NOVA EDIT CHANGE - Original: middle
              >
                <Stack fill>
                  {randomSetting && (
                    <Stack.Item>
                      <RandomizationButton
                        setValue={createSetRandomization(act, featureId)}
                        value={randomSetting}
                      />
                    </Stack.Item>
                  )}

                  <Stack.Item grow>
                    <FeatureValueInput
                      feature={feature}
                      featureId={featureId}
                      value={value}
                    />
                  </Stack.Item>
                </Stack>
              </LabeledList.Item>
            );
          },
        )}
      </LabeledList>

      {children}
    </Stack.Item>
  );
}

export function getRandomization(
  preferences: Record<string, unknown>,
  serverData: ServerData | undefined,
  randomBodyEnabled: boolean,
): Record<string, RandomSetting> {
  if (!serverData) {
    return {};
  }

  const { data } = useBackend<PreferencesMenuData>();

  if (!randomBodyEnabled) {
    return {};
  }

  return Object.fromEntries(
    map(
      filter(Object.keys(preferences), (key) =>
        serverData.random.randomizable.includes(key),
      ),
      (key) => [
        key,
        data.character_preferences.randomization[key] || RandomSetting.Disabled,
      ],
    ),
  );
}

enum PreferencesPage {
  Appearance,
  Lore,
}

type MainPageProps = {
  openSpecies: () => void;
};

export function MainPage(props: MainPageProps) {
  const { act, data } = useBackend<PreferencesMenuData>();
  const [deleteCharacterPopupOpen, setDeleteCharacterPopupOpen] =
    useState(false);
  const [multiNameInputOpen, setMultiNameInputOpen] = useState(false);
  const [vocalsInputOpen, setVocalsInputOpen] = useState(false); // NOVA EDIT ADDITION
  const [randomToggleEnabled] = useRandomToggleState();

  const serverData = useServerPrefs();

  const currentSpeciesData =
    serverData && serverData.species[data.character_preferences.misc.species];

  const contextualPreferences =
    data.character_preferences.secondary_features || [];

  const mainFeatures = [
    ...Object.entries(data.character_preferences.clothing ?? {}),
    ...Object.entries(data.character_preferences.features ?? {}),
  ];

  const randomBodyEnabled =
    data.character_preferences.non_contextual.random_body !==
      RandomSetting.Disabled || randomToggleEnabled;

  const randomizationOfMainFeatures = getRandomization(
    Object.fromEntries(mainFeatures),
    serverData,
    randomBodyEnabled,
  );

  const nonContextualPreferences = {
    ...data.character_preferences.non_contextual,
  };

  if (randomBodyEnabled) {
    nonContextualPreferences['random_species'] =
      data.character_preferences.randomization['species'];
  } else {
    // We can't use random_name/is_accessible because the
    // server doesn't know whether the random toggle is on.
    delete nonContextualPreferences['random_name'];
  }

  // ARK STATION EDIT BEGIN
  const [currentPreferencesPage, setCurrentPreferencesPage] = useState(
    PreferencesPage.Appearance,
  );

  let preferencesPageContent: ReactNode;
  switch (currentPreferencesPage) {
    case PreferencesPage.Appearance:
      preferencesPageContent = (
        <PreferenceList
          randomizations={getRandomization(
            contextualPreferences,
            serverData,
            randomBodyEnabled,
          )}
          preferences={contextualPreferences}
          maxHeight="auto"
        />
      );
      break;
    case PreferencesPage.Lore:
      preferencesPageContent = (
        <PreferenceList
          randomizations={getRandomization(
            nonContextualPreferences,
            serverData,
            randomBodyEnabled,
          )}
          preferences={nonContextualPreferences}
          maxHeight="auto"
        />
      );
      break;
    default:
      exhaustiveCheck(currentPreferencesPage);
  }
  // ARK STATION EDIT END

  return (
    <>
      {multiNameInputOpen && (
        <MultiNameInput
          handleClose={() => setMultiNameInputOpen(false)}
          handleRandomizeName={(preference) =>
            act('randomize_name', {
              preference,
            })
          }
          handleUpdateName={(nameType, value) =>
            act('set_preference', {
              preference: nameType,
              value,
            })
          }
          names={data.character_preferences.names}
        />
      )}
      {/* NOVA EDIT ADDITION START */}
      {vocalsInputOpen && (
        <VocalsInput
          handleClose={() => setVocalsInputOpen(false)}
          vocals={data.character_preferences.vocals}
        />
      )}
      {/* NOVA EDIT ADDITION END */}

      {deleteCharacterPopupOpen && (
        <DeleteCharacterPopup
          close={() => setDeleteCharacterPopupOpen(false)}
        />
      )}

      <Stack height={`${CLOTHING_SIDEBAR_ROWS * CLOTHING_CELL_SIZE}px`}>
        <Stack.Item>
          <Stack vertical fill>
            <Stack.Item>
              <CharacterControls
                gender={data.character_preferences.misc.gender}
                handleOpenSpecies={props.openSpecies}
                handleRotate={() => {
                  act('rotate');
                }}
                setGender={createSetPreference(act, 'gender')}
                showGender={
                  currentSpeciesData ? !!currentSpeciesData.sexes : true
                }
                // NOVA EDIT ADDITION START
                handleFood={() => {
                  act('open_food');
                }}
                // NOVA EDIT ADDITION END
                canDeleteCharacter={
                  Object.values(data.character_profiles).filter(
                    (name) => !!name,
                  ).length > 1
                }
                handleDeleteCharacter={() => setDeleteCharacterPopupOpen(true)}
              />
            </Stack.Item>

            <Stack.Item grow>
              <CharacterPreview
                height="80%" // NOVA EDIT - ORIGINAL: height="100%"
                width="100%" // ARK STATION EDIT
                id={data.character_preview_view}
              />
            </Stack.Item>

            {/* NOVA EDIT ADDITION START */}
            <Stack.Item position="relative">
              <Dropdown
                width="100%"
                selected={data.preview_selection}
                options={data.preview_options}
                onSelected={(value) =>
                  act('update_preview', {
                    updated_preview: value,
                  })
                }
              />
            </Stack.Item>
            {/* NOVA EDIT ADDITION END */}
            <Stack.Item position="relative">
              <NameInput
                name={data.character_preferences.names[data.name_to_use]}
                handleUpdateName={createSetPreference(act, data.name_to_use)}
                openMultiNameInput={() => {
                  setMultiNameInputOpen(true);
                }}
              />
            </Stack.Item>
            {/* NOVA EDIT ADDITION START */}
            <Stack.Item position="relative">
              <VoiceInput
                openVocalsInput={() => {
                  setVocalsInputOpen(true);
                }}
              />
            </Stack.Item>
            {/* NOVA EDIT ADDITION END */}
          </Stack>
        </Stack.Item>

        <Stack.Item>
          <Stack fill vertical wrap>
            {mainFeatures.map(([clothingKey, clothing]) => {
              const catalog = serverData?.[
                clothingKey
              ] as FeatureChoicedServerData & {
                name: string;
              };

              return (
                <Stack.Item key={clothingKey}>
                  {!catalog ? (
                    // Skeleton button
                    <Button height={4} width={4} disabled />
                  ) : (
                    <MainFeature
                      catalog={catalog}
                      currentValue={clothing}
                      handleSelect={createSetPreference(act, clothingKey)}
                      randomization={randomizationOfMainFeatures[clothingKey]}
                      setRandomization={createSetRandomization(
                        act,
                        clothingKey,
                      )}
                    />
                  )}
                </Stack.Item>
              );
            })}
          </Stack>
        </Stack.Item>

        <Stack.Item grow basis={0}>
          {/* ARK STATION EDIT BEGIN */}
          {/*
          <Stack vertical fill>
            <PreferenceList
              randomizations={getRandomization(
                contextualPreferences,
                serverData,
                randomBodyEnabled,
              )}
              preferences={contextualPreferences}
              maxHeight="auto"
            />

            <PreferenceList
              randomizations={getRandomization(
                nonContextualPreferences,
                serverData,
                randomBodyEnabled,
              )}
              preferences={nonContextualPreferences}
              maxHeight="auto"
            />
          </Stack>
          */}
          <Stack vertical fill>
            <Stack.Item>
              <Stack>
                <Stack.Item grow>
                  <PageButton
                    currentPage={currentPreferencesPage}
                    page={PreferencesPage.Appearance}
                    setPage={setCurrentPreferencesPage}
                  >
                    Character Appearance
                  </PageButton>
                </Stack.Item>
                <Stack.Item grow>
                  <PageButton
                    currentPage={currentPreferencesPage}
                    page={PreferencesPage.Lore}
                    setPage={setCurrentPreferencesPage}
                  >
                    Character Lore
                  </PageButton>
                </Stack.Item>
              </Stack>
            </Stack.Item>
            <Stack.Divider />
            {preferencesPageContent}
          </Stack>
          {/* ARK STATION EDIT END */}
        </Stack.Item>
      </Stack>
    </>
  );
}
