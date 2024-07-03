#!/usr/bin/env python3

from tasklib import TaskWarrior
import sys

tw = TaskWarrior('~/.local/share/task/')

# Parse appointments
apts = tw.tasks.filter('(status:pending or status:waiting or status:completed)', type='cal')
for apt in apts:
    start = apt['scheduled']
    if start is None:
        sys.stderr.write(f"Apt '{apt}' has no sched date!\n")
        continue

    summary = str(apt)

    if start.hour == 0 and start.minute == 0:
        start_fmt = start.strftime("%m/%d/%Y")
        print(f"{start_fmt} [1] {summary}")
    else:
        start_fmt = start.strftime("%m/%d/%Y @ %H:%M")

        if apt['due']:
            end_fmt = apt['due'].strftime("%m/%d/%Y @ %H:%M")
        else:
            end_fmt = strt_fmt

        print(f"{start_fmt} -> {end_fmt}|{summary}")

# Parse due dates for next actions and projects
tasks = tw.tasks.filter('(status:pending or status:waiting) and (type:next or type:objective or type:standby)')

for task in tasks:
    for date_type, label in [('due', "Slutdatum: "),
                             ('scheduled', "Startdatum: ")]:
        if not task[date_type]: # Skip tasks with no date
            continue
        start = task[date_type]

        proj = "Project: " if task['type'] == "objective" else ""

        summary = label + proj + str(task)

        if start.hour == 0 and start.minute == 0:
            start_fmt = start.strftime("%m/%d/%Y")
            print(f"{start_fmt} [1] {summary}")
        else:
            start_fmt = start.strftime("%m/%d/%Y @ %H:%M")
            end_fmt = start_fmt
            print(f"{start_fmt} -> {end_fmt}|{summary}")
