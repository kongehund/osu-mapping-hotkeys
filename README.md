# osu-mapping-hotkeys
An AutoHotKey tool to make osu!mapping easier.
This script provides some hotkeys to use in the osu! editor. Some or all of these may become obsolete when people switch over to the lazer editor.

WARNING: The script may be extremely unstable and/or buggy. It is not tested on any other system than my own.

# Installation
To install and use this script, install AutoHotKey and download the files into a folder of your choosing. Then run the .ahk file.

You can look up how to make AutoHotKey scripts run on startup, so you don't have to run the script every time you launch osu, you just press the hotkey to enable the script.
(Hint: Win+R -> shell:startup -> Add a shortcut to the script in here)

# Hotkey guide:

Press CTRL+ALT+. or CTRL+ALT+MOUSE5 to enable/disable the script - you should hear a sound when the script turns on and off.
The script normally disables automatically when you leave the editor in any way (i.e. pressing Esc, Win, Alt+Tab, F5, F8, F9, etc.)

MOUSE4/MOUSE5 - Rotate 90° from selection center (the default osu shortcuts rotate from Playfield center)

Z/X - Rotate 15°

D/F - Rotate 5°

C/V - Rotate 1°

B and N - Add 5% volume green line on current position without silencing the following objects (B is recommended, but won't work on 1/12 and 1/16)

A - Add a green line where you can immediately type the SV

There's more hotkeys available, try to decipher the script if you want to find out what they are.

# DEBUGGING:
If the script doesn't work, try to increase the number after "Sleep" commands. This makes the script wait longer between each action. The number is in milliseconds.

(There may be a lot of numbers to change. If I wasn't lazy, I'd turn it into variables edit at the top of the script, but yeah...)
