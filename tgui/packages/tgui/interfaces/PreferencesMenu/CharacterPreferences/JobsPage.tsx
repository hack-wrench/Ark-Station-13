import { sortBy } from 'common/collections';
import { PropsWithChildren, ReactNode } from 'react';
import { useBackend } from 'tgui/backend';
import { Box, Button, Dropdown, Stack, Tooltip } from 'tgui-core/components';
import { classes } from 'tgui-core/react';

import {
  createSetPreference,
  Job,
  JoblessRole,
  JobPriority,
  PreferencesMenuData,
} from '../types';
import { useServerPrefs } from '../useServerPrefs';

function sortJobs(entries: [string, Job][], head?: string) {
  return sortBy(
    entries,
    ([key, _]) => (key === head ? -1 : 1),
    ([key, _]) => key,
  );
}

const PRIORITY_BUTTON_SIZE = '18px';

type PriorityButtonProps = {
  name: string;
  color: string;
  modifier?: string;
  enabled: boolean;
  onClick: () => void;
};

function PriorityButton(props: PriorityButtonProps) {
  const className = `PreferencesMenu__Jobs__departments__priority`;

  return (
    // SKYRAT EDIT START
    <Button
      className={classes([
        className,
        props.modifier && `${className}--${props.modifier}`,
      ])}
      color={props.enabled ? props.color : 'white'}
      circular
      onClick={props.onClick}
      tooltip={props.name}
      tooltipPosition="bottom"
      height={PRIORITY_BUTTON_SIZE}
      width={PRIORITY_BUTTON_SIZE}
    />
    // SKYRAT EDIT END
  );
}

type CreateSetPriority = (priority: JobPriority | null) => () => void;

const createSetPriorityCache: Record<string, CreateSetPriority> = {};

function createCreateSetPriorityFromName(jobName: string): CreateSetPriority {
  if (createSetPriorityCache[jobName] !== undefined) {
    return createSetPriorityCache[jobName];
  }

  const perPriorityCache: Map<JobPriority | null, () => void> = new Map();

  function createSetPriority(priority: JobPriority | null) {
    const existingCallback = perPriorityCache.get(priority);
    if (existingCallback !== undefined) {
      return existingCallback;
    }

    function setPriority() {
      const { act } = useBackend<PreferencesMenuData>();

      act('set_job_preference', {
        job: jobName,
        level: priority,
      });
    }

    perPriorityCache.set(priority, setPriority);
    return setPriority;
  }

  createSetPriorityCache[jobName] = createSetPriority;

  return createSetPriority;
}

function PriorityHeaders() {
  const className = 'PreferencesMenu__Jobs__PriorityHeader';

  return (
    <Stack>
      <Stack.Item grow />

      <Stack.Item className={className}>Off</Stack.Item>

      <Stack.Item className={className}>Low</Stack.Item>

      <Stack.Item className={className}>Medium</Stack.Item>

      <Stack.Item className={className}>High</Stack.Item>
    </Stack>
  );
}

type PriorityButtonsProps = {
  createSetPriority: CreateSetPriority;
  isOverflow: boolean;
  priority: JobPriority;
};

function PriorityButtons(props: PriorityButtonsProps) {
  const { createSetPriority, isOverflow, priority } = props;

  return (
    <Box // SKYRAT EDIT - Originally a stack
      style={{
        alignItems: 'center',
        height: '100%',
        justifyContent: 'flex-end',
        paddingLeft: '0.3em',
        paddingTop: '0.12em', // SKYRAT EDIT ADDITION - Add some vertical padding
        paddingBottom: '0.12em', // SKYRAT EDIT ADDITION - To make this look nicer
      }}
    >
      {isOverflow ? (
        <>
          <PriorityButton
            name="Off"
            modifier="off"
            color="light-grey"
            enabled={!priority}
            onClick={createSetPriority(null)}
          />

          <PriorityButton
            name="On"
            color="green"
            enabled={!!priority}
            onClick={createSetPriority(JobPriority.High)}
          />
        </>
      ) : (
        <>
          <PriorityButton
            name="Off"
            modifier="off"
            color="light-grey"
            enabled={!priority}
            onClick={createSetPriority(null)}
          />

          <PriorityButton
            name="Low"
            color="red"
            enabled={priority === JobPriority.Low}
            onClick={createSetPriority(JobPriority.Low)}
          />

          <PriorityButton
            name="Medium"
            color="yellow"
            enabled={priority === JobPriority.Medium}
            onClick={createSetPriority(JobPriority.Medium)}
          />

          <PriorityButton
            name="High"
            color="green"
            enabled={priority === JobPriority.High}
            onClick={createSetPriority(JobPriority.High)}
          />
        </>
      )}
    </Box> // SKYRAT EDIT - Originally a stack
  );
}

type JobRowProps = {
  className?: string;
  job: Job;
  name: string;
};

function JobRow(props: JobRowProps) {
  const { data, act } = useBackend<PreferencesMenuData>(); // NOVA EDIT CHANGE - Adds act param
  const { className, job, name } = props;

  const isOverflow = data.overflow_role === name;
  const priority = data.job_preferences[name];

  const createSetPriority = createCreateSetPriorityFromName(name);

  const experienceNeeded =
    data.job_required_experience && data.job_required_experience[name];
  const daysLeft = data.job_days_left ? data.job_days_left[name] : 0;

  // NOVA EDIT ADDITION START
  const alt_title_selected = data.job_alt_titles[name]
    ? data.job_alt_titles[name]
    : name;
  // NOVA EDIT ADDITION END

  let rightSide: ReactNode;

  if (experienceNeeded) {
    const { experience_type, required_playtime } = experienceNeeded;
    const hoursNeeded = Math.ceil(required_playtime / 60);

    rightSide = (
      <Stack align="center" height="100%" pr={1}>
        <Stack.Item grow textAlign="right">
          <b>{hoursNeeded}h</b> as {experience_type}
        </Stack.Item>
      </Stack>
    );
  } else if (daysLeft > 0) {
    rightSide = (
      <Stack align="center" height="100%" pr={1}>
        <Stack.Item grow textAlign="right">
          <b>{daysLeft}</b> day{daysLeft === 1 ? '' : 's'} left
        </Stack.Item>
      </Stack>
    );
  } else if (data.job_bans && data.job_bans.indexOf(name) !== -1) {
    rightSide = (
      <Stack align="center" height="100%" pr={1}>
        <Stack.Item grow textAlign="right">
          <b>Banned</b>
        </Stack.Item>
      </Stack>
    );
    // NOVA EDIT START
  } else if (job.nova_star && !data.is_nova_star) {
    rightSide = (
      <Stack align="center" height="100%" pr={1}>
        <Stack.Item grow textAlign="right">
          <b>Nova Stars Only</b>
        </Stack.Item>
      </Stack>
    );
  } else if (
    data.species_restricted_jobs &&
    data.species_restricted_jobs.indexOf(name) !== -1
  ) {
    rightSide = (
      <Stack align="center" height="100%" pr={1}>
        <Stack.Item grow textAlign="right">
          <b>Bad species</b>
        </Stack.Item>
      </Stack>
    );
    // SKYRAT EDIT END
  } else {
    rightSide = (
      <PriorityButtons
        createSetPriority={createSetPriority}
        isOverflow={isOverflow}
        priority={priority}
      />
    );
  }

  return (
    <Stack.Item className={className} height="100%" mt={0}>
      <Stack fill align="center">
        <Tooltip content={job.description} position="bottom-start">
          <Stack.Item
            className="job-name"
            width="50%"
            style={{
              paddingLeft: '0.3em',
            }}
          >
            {
              // SKYRAT EDIT CHANGE START - ORIGINAL: {name}
              !job.alt_titles ? (
                name
              ) : (
                <Dropdown
                  width="100%"
                  options={job.alt_titles}
                  selected={alt_title_selected}
                  onSelected={(value) =>
                    act('set_job_title', { job: name, new_title: value })
                  }
                />
              )
              // SKYRAT EDIT CHANGE END
            }
          </Stack.Item>
        </Tooltip>

        <Stack.Item grow className="options">
          {rightSide}
        </Stack.Item>
      </Stack>
    </Stack.Item>
  );
}

type DepartmentProps = {
  department: string;
} & PropsWithChildren;

function Department(props: DepartmentProps) {
  const { children, department: name } = props;
  // ARK STATION EDIT
  /*
  const className = `PreferencesMenu__Jobs__departments--${name}`;
  */
  const className = `PreferencesMenu__Jobs__departments--${name.replaceAll(' ', '_')}`;
  // ARK STATION EDIT END

  const data = useServerPrefs();
  if (!data) return;

  const { departments, jobs } = data.jobs;
  const department = departments[name];

  // This isn't necessarily a bug, it's like this
  // so that you can remove entire departments without
  // having to edit the UI.
  // This is used in events, for instance.
  if (!department) {
    return null;
  }

  const jobsForDepartment = sortJobs(
    Object.entries(jobs).filter(([_, job]) => job.department === name),
    department.head,
  );

  return (
    <Box>
      <Stack fill vertical g={0}>
        {jobsForDepartment.map(([name, job]) => {
          return (
            <JobRow
              className={classes([
                className,
                name === department.head && 'head',
              ])}
              key={name}
              job={job}
              name={name}
            />
          );
        })}
      </Stack>

      {children}
    </Box>
  );
}

function JoblessRoleDropdown(props) {
  const { act, data } = useBackend<PreferencesMenuData>();
  const selected = data.character_preferences.misc.joblessrole;

  const options = [
    {
      displayText: `Join as ${data.overflow_role} if unavailable`,
      value: JoblessRole.BeOverflow,
    },
    {
      displayText: `Join as a random job if unavailable`,
      value: JoblessRole.BeRandomJob,
    },
    {
      displayText: `Return to lobby if unavailable`,
      value: JoblessRole.ReturnToLobby,
    },
  ];

  const selection = options?.find(
    (option) => option.value === selected,
  )!.displayText;

  return (
    <Box position="absolute" right={0} width="30%">
      <Dropdown
        width="100%"
        selected={selection}
        onSelected={createSetPreference(act, 'joblessrole')}
        options={options}
      />
    </Box>
  );
}

export function JobsPage() {
  return (
    <>
      <JoblessRoleDropdown />
      <Stack vertical fill>
        <Stack.Item mt={15}>
          {/* ARK STATION EDIT BEGIN */}
          {/*
          <Stack fill g={1} className="PreferencesMenu__Jobs">
            <Stack.Item>
              <Stack vertical>
                <PriorityHeaders />
                <Department department="Engineering" />
                <Department department="Science" />
                <Department department="Silicon" />
                <Department department="Assistant" />
              </Stack>
            </Stack.Item>
            <Stack.Item mt={-5.9}>
              <Stack vertical>
                <PriorityHeaders />
                <Department department="Captain" />
                <Department department="Service" />
                <Department department="Cargo" />
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <Stack vertical>
                <PriorityHeaders />
                <Department department="Security" />
                <Department department="Medical" />
              </Stack>
            </Stack.Item>
          </Stack>
          */}
          <Stack fill className="PreferencesMenu__Jobs">
            <Stack.Item mr={1}>
              <Stack vertical>
                <PriorityHeaders />
                <Department department="Global Solar Energy" />
                <Department department="Red Hawk Security" />
                <Department department="Synthetics" />
                <Department department="Colonist" />
              </Stack>
            </Stack.Item>
            <Stack.Item mr={1}>
              <Stack vertical>
                <PriorityHeaders />
                <Department department="Ark Commander" />

                <Department department="Neo-Vatican Church" />
                <Department department="Bishop Developments" />
                <Department department="De Forest" />
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <Stack vertical>
                <PriorityHeaders />
                <Department department="Donk Corporation" />
                <Department department="Atlas and Nanotrasen" />
              </Stack>
            </Stack.Item>
          </Stack>
          {/* ARK STATION EDIT END */}
        </Stack.Item>
      </Stack>
    </>
  );
}
