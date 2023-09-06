# osu-mapping-hotkeys
An AutoHotKey tool to make osu!mapping easier.
This script provides some hotkeys to use in the osu! editor. Some or all of these may become obsolete when people switch over to the lazer editor.

WARNING: The script may be extremely unstable and/or buggy. It is not tested on any other system than my own.

# Installation
To install and use this script, install AutoHotKey and download the files into a folder of your choosing. Then run the .ahk file.

You can look up how to make AutoHotKey scripts run on startup, so you don't have to run the script every time you launch osu, you just press the hotkey to enable the script.
(Hint: Win+R -> shell:startup -> Add a shortcut to the script in here)

If you want to use any shortcuts that have to do with green lines, you need to do the following:

Go to osu! options

Under Editor set "Add inheriting Section" to A

Set "Remove Section" to M

If you don't like A and M to do this, you'll have to find two other keys that aren't conflicting with anything else and edit this script accordingly.

# Hotkey guide:

Press CTRL+ALT+. or CTRL+ALT+MOUSE5 to enable/disable the script - you should hear a sound when the script turns on and off.
The script normally disables automatically when you leave the editor in any way (i.e. pressing Esc, Win, Alt+Tab, F5, F8, F9, etc.)

MOUSE4/MOUSE5 - Rotate 90° from selection center (the default osu shortcuts rotate from Playfield center)

Z/X - Rotate 15°

D/F - Rotate 5°

C/V - Rotate 1°

B / N / Shift+N - Different ways to add a 5% volume green line on current position (B is recommended, but won't work on 1/12 and 1/16)

A - Add a green line where you can immediately type the SV

There's more hotkeys available, including experimental ones. If you want, you can try to decipher the script to find out what they are. 
(A fun experimentatal one is Ctrl+Alt+k, which will attempt to play the current position with half-time by creating a new difficulty. Doesn't always select the correct diff tho.)

# DEBUGGING:
If the script doesn't work, try to increase the number after "Sleep" commands. This makes the script wait longer between each action. The number is in milliseconds.

(There may be a lot of numbers to change. If I wasn't lazy, I'd turn it into variables edit at the top of the script, but yeah...)
