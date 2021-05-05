#!/usr/bin/env zsh
# Shell script to lock the screen in MacOS Big Sur
# executes combination of keystrokes linked to the keyboard shortcut `CMD+Shift+Q`

osascript -e 'tell app "System Events" to key code 12 using {control down, command down}'
