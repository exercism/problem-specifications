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

# Iterate through old cases as only those could potentially be mutated
for case in old:
    for k in immutable_keys:
        if case[k] != new[case['uuid']][k]:
            fails.add(case['uuid'])
            break

if len(fails) == 0:
    exit(0)

print('The following test contain illegal mutations:')
for f in fails:
    print(f" - {f} ({new[f]['description']})")
exit(1)
