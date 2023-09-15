# osu-mapping-hotkeys
An AutoHotKey tool to make osu!mapping easier.
This script provides some hotkeys to use in the osu! editor. 

Some or all of these may become obsolete when people switch over to the lazer editor.

WARNING: The script may be unstable and/or buggy.

# Installation
To install and use this script, install AutoHotKey and download the files into a folder of your choosing. Then run the .ahk file.

You can look up how to make AutoHotKey scripts run on startup, so you don't have to run the script every time you launch osu, you just press the hotkey to enable the script.
(Hint: Win+R -> shell:startup -> Add a shortcut to the script in here)

If you want to use any shortcuts that have to do with green lines, you need to do the following:

Go to osu! options, then keyboard bindings

Under Editor set "Add inheriting Section" to A

Set "Remove Section" to M

If you don't like A and M to do this, you'll have to find two other keys that aren't conflicting with anything else and edit this script accordingly.

Also, you need to ensure the decimalMode variable is set correctly in the script's Setup section. Read the comments in the script to set it properly.

# Toggling the Script:

Press CTRL+ALT+. or CTRL+ALT+MOUSE5 to enable/disable the script - you should hear a sound when the script turns on and off.
The script normally disables automatically when you leave the editor in any way (i.e. pressing Esc, Win, Alt+Tab, F5, F8, F9)

# Rotation Hotkeys:

MOUSE4/MOUSE5 - Rotate 90° from selection center (whereas the default osu shortcuts rotate from Playfield center)

Z/X - Rotate 15°

D/F - Rotate 5°

C/V - Rotate 1°

# Mute Slider Ends:

B - Add 5% volume green line on current position AND a normal green line on next half grid tick in order not to mess up the following sliders. Recommended, but may be buggy on 1/12 and 1/16.

N - Add 5% volume green line on current position AND a normal green line on next full grid tick in order not to mess up the following sliders. Recommended if there's no objects after this one.

Shift+N - Add only a 5% volume green line on current position. This will also silence following objects unless they already have green lines to control their volume.

# Copy a Slider Including its SV:

SHIFT+C - When you have a slider selected, press this to copy both the slider and the SV

SHIFT+V - Paste the slider and add a green line on this position to include the SV

You can also use these just to copy a green line without copying a slider. These won't work for multiple green lines at once.

# Easy Slider Design:

This feature allows you to first design a slider, then set its length.
Useful for tech mapping.

SHIFT+A or SHIFT+S - Add a gren line with 0.1 or 0.4 SV. SHIFT+A is recommended in general, whereas SHIFT+S is good for longer sliders so you don't have to scroll as much in the upcoming part.

Now, design a slider. Once you've designed the slider, go to the slider head and press S. This will tell the script that your timeline cursor is on top of the slider head. 

Now, scroll to the slider tail and choose your slider length with this hotkey:

TAB+(1/2/3/4/5) - Make it (1/2/3/4/1.5) grid ticks long

(Tip: If none of the options are the length you want for your slider, consider changing the grid size. 
You can also create more shortcuts pretty easily by looking at how these hotkeys were made and add your own)

# Debugging and More:
There's more hotkeys available, including experimental ones. If you want, you can try to decipher the script to find out what they are. 

If the script doesn't work, try to increase the delay variables under the Setup section. This makes the script wait longer between each action. The number is in milliseconds.
