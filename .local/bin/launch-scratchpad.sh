#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Launch Scratchpad
# @raycast.mode silent

# Documentation:
# @raycast.author vagmcs
# @raycast.authorURL https://raycast.com/vagmcs

# GUI launchers do not source .zshrc, so fall back to the vault's default location
: "${OBSIDIAN_VAULT:=${HOME}/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes}"

open -na Ghostty --args \
  --title=scratchpad \
  --working-directory="${OBSIDIAN_VAULT}" \
  -e nvim -c 'Obsidian today' -c 'normal! G' -c 'startinsert!'
