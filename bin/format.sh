#!/usr/bin/env sh

DEFAULT_PATTERN='**/*.{md,json,yml}'
npx prettier@2.1.1 --write "${1:-$DEFAULT_PATTERN}"
