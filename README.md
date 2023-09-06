# osu-mapping-hotkeys
An AutoHotKey tool to make osu!mapping easier.

This script provides some hotkeys to use in the osu! editor. Some or all of these may become obsolete when people switch over to the lazer editor.

WARNING: The script may be extremely unstable and/or buggy. It is not tested on any other system than my own. If you dare to try out the script anyways, here's some info:

Press CTRL+ALT+. or CTRL+ALT+MOUSE5 to enable/disable the script - you should hear a sound when the script turns on and off.
The script normally disables automatically when you leave the editor in any way (i.e. pressing Esc, Win, Alt+Tab, F5, F, F9, etc.)

Hotkey guide:
Z/X - Rotate 15°
D/F - Rotate 5°
C/V - Rotate 1°
B and N - Add 5% volume green line on current position without silencing the following objects (B is recommended, but won't work on 1/12 and 1/16)
A - Add a green line where you can immediately type the SV

There's more hotkeys available, try to decipher the script to find out what they are.

DEBUGGING:
If the script doesn't work, try to increase the number after "Sleep" commands. This makes the script wait longer between each action. The number is in milliseconds.
(If I felt like it I'd turn the numbers into variables for you to edit at the top of the script, but I'm lazy.)
