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
new = {c['uuid']: c for c in new}

fails = set()
deleted = set()

# Iterate through old cases as only those could potentially be mutated
for case in old:
    uuid = case['uuid']

    # Check if the case has been deleted
    if uuid not in new:
        deleted.add(uuid)
        continue

    for k in immutable_keys:
        if case[k] != new[uuid][k]:
            fails.add(uuid)
            break

if len(fails) == 0 and len(deleted) == 0:
    exit(0)

if len(fails) > 0:
    print('The following tests contain illegal mutations:')
    for f in fails:
        print(f" - {f} ({new[f]['description']})")

if len(deleted) > 0:
    print('The following tests have been deleted illegally:')
    for d in deleted:
        print(f" - {d}")

exit(1)
