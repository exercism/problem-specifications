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

# Convert old to dict uuid => case
old = {c['uuid']: c for c in old}

fails = set()

for case in new:
    if case['uuid'] not in old.keys(): # case is a new test case
        continue
    
    for k in immutable_keys:
        if case[k] != old[case['uuid']][k]:
            fails.add(case['uuid'])

if len(fails) == 0:
    exit(0)

print('The following test cases have been illegally mutated:')
for f in fails:
    print(f" - {f} ({old[f]['description']})")
exit(1)
