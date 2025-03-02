#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Empty Downloads and Desktop
# @raycast.mode inline
# @raycast.packageName System
#
# Optional parameters:
# @raycast.icon 🗑️

# Documentation:
# @raycast.description Move all files in ~/Downloads and ~/Desktop to the Trash.
# @raycast.author Gadzhimari Kachaev
# @raycast.authorURL https://github.com/gadzhimari

mv ~/Downloads/* ~/.Trash/
mv ~/Desktop/* ~/.Trash/

