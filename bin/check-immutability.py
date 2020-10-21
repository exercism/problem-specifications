#!/usr/bin/env python 

import json
import subprocess
import sys

oldf = sys.argv[1]
newf = sys.argv[2]

immutable_keys = ('property', 'input', 'expected')

# Use jq to flatten the test data, and parse it
old = json.loads(subprocess.run([f"jq -r '[.. | objects | select(.uuid != null)]' {oldf}"], stdout=subprocess.PIPE, shell=True).stdout.decode('utf-8'))
new = json.loads(subprocess.run([f"jq -r '[.. | objects | select(.uuid != null)]' {newf}"], stdout=subprocess.PIPE, shell=True).stdout.decode('utf-8'))

# Convert new to dict uuid => case
new = {case['uuid']: case for case in new}

fails = set()
deleted = set()

# Iterate through old cases as only those could potentially be mutated
for case in old:
    uuid = case['uuid']

    # Check if the case has been deleted
    if uuid not in new:
        deleted.add(uuid)
        continue

    # Check that scenarios are only updated additively
    if 'scenarios' in case and not set(case['scenarios']).issubset(set(new[uuid]['scenarios'])):
        fails.add(uuid)
        continue
    # Check for changes to immutable keys
    for key in immutable_keys:
        if case[key] != new[uuid][key]:
            fails.add(uuid)
            break

if len(fails) == 0 and len(deleted) == 0:
    sys.exit(0)

if len(fails) > 0:
    print('The following tests contain illegal mutations:')
    for failure in fails:
        print(f" - {failure} ({new[failure]['description']})")

if len(deleted) > 0:
    print('The following tests have been deleted illegally:')
    for deletion in deleted:
        print(f" - {deletion}")

sys.exit(1)
