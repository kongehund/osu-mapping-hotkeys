; kongehund's osu mapping hotkeys
; See https://github.com/kongehund/osu-mapping-hotkeys for info and newest version.


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxHotkeysPerInterval 150

; ---------------------------------------------------
; SETUP
; ---------------------------------------------------

; FOR GREEN LINE RELATED HOTKEYS TO WORK:
; Go to osu! options, then keyboard bindings
; Under Editor set "Add inheriting Section" to A (or change AddLine())
; Set "Remove Section" to M
; If you don't like A and M to do this, you'll have to find 
; two other keys that aren't conflicting with anything else and 
; edit this script accordingly



; Below here are some variables that should be changed to fit your system.




; If you type 0,4 in F6 menu to get 0.4 SV slider, this should be "comma"
; If you type 0.4 in F6 menu to get 0.4 SV slider, this should be "dot" (If you're American, this is probably the correct one)

decimalMode := "comma"




; If some of the hotkeys aren't working properly, try increasing these delays.
; The one that is most likely to be too short is delayLong.

delay1 := 1		; Default 1
delay2 := 10		; Default 10
delayMedium := 100	; Default 100
delayLong := 200	; Default 200
delayVeryLong := 300	; Default 250



; ---------------------------------------------------
; SCRIPT TOGGLING AND ICON
; ---------------------------------------------------

I_Icon = hitcircle.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
;return

scriptOn := "False"

^!.:: ;Turn script on/off with ctrl+alt+.
if (scriptOn = "False")
{
	SoundPlay, scriptOnSound.wav
	;MsgBox, osu!mapping hotkeys === ON ===
	scriptOn := "True"
}
else if (scriptOn = "True")
{
	SoundPlay, scriptOffSound.wav
	;MsgBox, osu!mapping hotkeys === OFF ===
	scriptOn := "False"
}
return

^!XButton2:: ;Turn script on/off with ctrl+alt+mouse5
if (scriptOn = "False")
{
	SoundPlay, scriptOnSound.wav
	;MsgBox, osu!mapping hotkeys === ON ===
	scriptOn := "True"
}
else if (scriptOn = "True")
{
	SoundPlay, scriptOffSound.wav
	;MsgBox, osu!mapping hotkeys === OFF ===
	scriptOn := "False"
}
return

; Pressing Esc, Windows button, F5 or Alt+Tab will disable script.

; Esc might be used inside editor, i.e. exiting test play or switching to Select.
; Therefore, a MsgBox will appear to let user turn hotkeys on again, if it's done inadvertently
~Esc::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
scriptOn := "False"
}
return

; Put this inside above curly if you want the box
;warningMessage = 
;(
;osu!mapping hotkeys === OFF === 
;
;Turn hotkeys back on? 
;)
;MsgBox, 4, Warning - Timeout in 6 seconds, %warningMessage%, 6
;ifMsgBox Yes
;	scriptOn := "True"
;	SoundPlay, scriptOnSound.wav
;ifMsgBox No
;	scriptOn := "False"
;	SoundPlay, scriptOffSound.wav
;ifMsgBox Timeout
;	scriptOn := "False"
;	SoundPlay, scriptOffSound.wav
;

~Alt & ~Tab::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
}
scriptOn := "False"
return

~LWin::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
}
scriptOn := "False"
return

~RWin::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
}
scriptOn := "False"
return

~F5::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
}
scriptOn := "False"
return

~F8::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
}
scriptOn := "False"
return

~F9::
if (scriptOn = "True")
{
SoundPlay, scriptOffSound.wav
}
scriptOn := "False"
return
















; ---------------------------------------------------
; ROTATION
; ---------------------------------------------------

; Define the rotation function
Rotate(angle)				
{
global scriptOn
global delay2
global delay3		
if (scriptOn = "True")
{			
; Enter rotate menu
Send {Ctrl down}
Sleep delay2
Send {Shift down}
Sleep delay2
Send {r down}
Sleep delay2
Send {r up}
Send {Shift up}
Send {Ctrl up}
Sleep delay2
; Rotate around selection center
Send, `t
Sleep delay2
Send, `t
Sleep delay2
Send, `t
Sleep delay2
Send, `t
Sleep delay2
Send, {Down}
Sleep delay2
; Go to angle field
Send, `t
Sleep delay2
Send, `t
Sleep delay2
; Enter angle
Send %angle%
Sleep delay2
Send {Enter}
}
return
}


; Set rotation binds

~d:: 	;Rotate -5 degrees in the editor
if (scriptOn = "True")
{
Send {d up}
Rotate(355)
}
return



~f:: 	;Rotate 5 degrees in the editor
if (scriptOn = "True")
{
Send {f up}
Rotate(5)
}
return



~z:: 	;Rotate -15 degrees in the editor
if (scriptOn = "True")
{
Send {z up}
Rotate(345)
}
return



~x:: 	;Rotate 15 degrees in the editor
if (scriptOn = "True")
{
Send {x up}
Rotate(15)
}
return



~c:: 	;Rotate -1 degrees in the editor
if (scriptOn = "True")
{
Send {c up}
Rotate(359)
}
return



~v:: 	;Rotate 1 degrees in the editor
if (scriptOn = "True")
{
Send {v up}
Rotate(1)
}
return



~å:: 	;Rotate 60 degrees in the editor
if (scriptOn = "True")
{
Send {å up}
Rotate(60)
}
return



~XButton1::
if (scriptOn = "True")
{
Send {XButton1 up}
Rotate(-90)
}
return



~XButton2::
if (scriptOn = "True")
{
Send {XButton2 up}
Rotate(90)
}
return
















; ---------------------------------------------------
; GREEN LINE FUNCTIONS
; ---------------------------------------------------

EnterF6()
{
global delayLong
Send {F6 down}
Sleep 1
Send {F6 up}
Sleep delayLong
return
}


ClickTiming()
{
global delay1
global delay2
MouseMove, 40, 40
Sleep delay1
Send {Click}
Sleep delay2
return
}


GotoCustomSVField()
{
global delay1
global delay2
MouseMove, 40, 265
Sleep delay1
Send {Click}
Sleep delay1
Send, {Right}
Sleep delay1
return
}


ClearField()
{
; Go to end of field
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
; Now we must be at the end of the field. Start deleting.
Send, {Backspace}
Send, {Backspace}
Send, {Backspace}
Send, {Backspace}
Send, {Backspace}
}


AddLine()
{
global delayLong
Send, {a down}
Sleep 1
Send, {a up}
Sleep delayLong
return
}

; Create a Green line equal to the current one.
NewLine()
{
Addline()
Send, {NumpadEnter}
return
}


AddCustomSV()
; Add a single green line with custom SV
{
global scriptOn
if (scriptOn = "True")
{
AddLine()
ClickTiming()
GotoCustomSVField()
ClearField()
; User is ready to write an SV value
}
return
}

!a::		
if (scriptOn = "True")
{
AddCustomSV()
}
return


DeleteLine()
{
global scriptOn
global delay1
global delay2
if (scriptOn = "True")
{
Send, {m down}
Sleep delay1
Send, {m up}
Sleep delay2
}
return
}


Greenline(SV)
; Adds a green line with a given SV
{
global scriptOn
global decimalMode
global delay1
global delay2

if (scriptOn = "True")
{
AddCustomSV()
Sleep delay2

if (decimalMode = "dot"){
StringReplace, SV_new, SV, `, , .
Send, %SV_new%
}

else if (decimalMode = "comma"){
Send, %SV%
}

else
{
MsgBox, Error: decimalMode not identified
}

Sleep delay1
Send, {NumpadEnter}
}
return
}

; ---------------------------------------------------
; GREEN LINE BINDS
; ---------------------------------------------------

~NumpadSub::DeleteLine()

; Set binds for green lines.
; Holding down PgDn will add a new line
; Holding down End will delete the current one, then add a new one
~PgDn & ~Numpad0::GreenLine("1")
~End & ~Numpad0::DeleteLine(), GreenLine("1")
~PgDn & ~Numpad1::GreenLine("1,25")
~End & ~Numpad1::DeleteLine(), GreenLine("1,25")			
~PgDn & ~Numpad2::GreenLine("1,5")
~End & ~Numpad2::DeleteLine(), GreenLine("1,5")
~PgDn & ~Numpad3::GreenLine("2")
~End & ~Numpad3::DeleteLine(), GreenLine("2")
~PgDn & ~Numpad4::GreenLine("2,5")
~End & ~Numpad4::DeleteLine(), GreenLine("2,5")
~PgDn & ~Numpad5::GreenLine("3")
~End & ~Numpad5::DeleteLine(), GreenLine("3")
~PgDn & ~Numpad6::GreenLine("3,5")
~End & ~Numpad6::DeleteLine(), GreenLine("3,5")
~PgDn & ~Numpad7::GreenLine("4")
~End & ~Numpad7::DeleteLine(), GreenLine("4")
~PgDn & ~Numpad8::GreenLine("5")
~End & ~Numpad8::DeleteLine(), GreenLine("5")
~PgDn & ~Numpad9::GreenLine("6")
~End & ~Numpad9::DeleteLine(), GreenLine("6")


; Refresh slider
~PgUp::
if (scriptOn = "True")
{
Send {Ctrl down}
Sleep delay1
Send {Shift down}
Sleep delay1
Send {s down}
Sleep delay1
Send {s up}
Send {Shift up}
Send {Ctrl up}
Sleep delay2
Send {Enter}
}
return



; Increase SV by 0,1
;~End & Up::
^XButton2::
if (scriptOn = "True")
{
EnterF6()
MouseMove, 40, 265
Sleep delay1
Send {Click}
Sleep delay1
Send, {Right}
Sleep delay1
Send, {Up}
Sleep delay1
Send, {NumpadEnter}
}
return


; Increase SV by 0,3
;~Home & Up::
+XButton2::
if (scriptOn = "True")
{
EnterF6()
MouseMove, 40, 265
Sleep delay1
Send {Click}
Sleep delay1
Send, {Right}
Sleep delay1
Send, {Up}
Sleep delay1
Send, {Up}
Sleep delay1
Send, {Up}
Sleep delay1
Send, {NumpadEnter}
}
return


; Decrease SV by 0,1
;~End & Down::
^XButton1::
if (scriptOn = "True")
{
EnterF6()
MouseMove, 40, 265
Sleep delay1
Send {Click}
Sleep delay1
Send, {Right}
Sleep delay1
Send, {Down}
Sleep delay1
Send, {NumpadEnter}
}
return


; Decrease SV by 0,3
;~Home & Down::
+XButton1::
if (scriptOn = "True")
{
EnterF6()
MouseMove, 40, 265
Sleep delay1
Send {Click}
Sleep delay1
Send, {Right}
Sleep delay1
Send, {Down}
Sleep delay1
Send, {Down}
Sleep delay1
Send, {Down}
Sleep delay1
Send, {NumpadEnter}
}
return


; ---------------------------------------------------
; SLIDER END MUTES
; ---------------------------------------------------

; Mute slider end via half-grid
~b::
if (scriptOn = "True")
{
Send {b up}
Sleep delay1
; Half beat snap divisor
Send {Ctrl down}
Sleep delay1
Send {WheelUp}
Sleep delay1
Send {Ctrl up}
Sleep delay1
; Next gridline
Send {WheelDown}
Sleep delay1
; Green line
Send, {a down}
Sleep delay1
Send, {a up}
Sleep delay2
Send, {NumpadEnter}
Sleep delay1
; Go back to previous gridline
Send {WheelUp}
Sleep delayLong
Send, {a down}
Sleep delay1
Send, {a up}
Sleep delayLong
MouseMove, 190, 230
Sleep delay1
sendinput,{click}{click}
Send {5}
Send, {NumpadEnter}
Sleep delayLong
; Normal beat snap divisor
Send {Ctrl down}
Sleep delay1
Send {WheelDown}
Sleep delay1
Send {Ctrl up}
Sleep delay1
}
return

; Mute slider end normally
~n::
if (scriptOn = "True")
{
Send {Shift up}
Send {b up}
Send {WheelDown} ; Next gridline
Sleep delay1
NewLine() ; Normal volume here
Sleep delay2
; Go back to previous gridline
Send {WheelUp}
Sleep delayLong
Send, {a down}
Sleep delayLong
Send, {a up}
Sleep delay2
MouseMove, 190, 230
Sleep delay1
sendinput,{click}{click}
Send {5}
Send, {NumpadEnter}
}
return

; Mute slider end directly
~+n::
if (scriptOn = "True")
{
Send {Shift up}
Send {b up}
Sleep delay1
Send, {a down}
Sleep delayLong
Send, {a up}
Sleep delay2
MouseMove, 190, 230
Sleep delay1
sendinput,{click}{click}
Send {5}
Send, {NumpadEnter}
}
return


; ---------------------------------------------------
; CUSTOM-LENGTH SLIDERS
; ---------------------------------------------------

; Turn min:sec:ms into ms (i.e. 1:01:250 into 61250)
osuTimeToMs(osuTime)
{	
StringSplit, components, osuTime, :	
totalMilliseconds := (components1 * 60 * 1000) + (components2 * 1000) + components3
return totalMilliseconds
}

; Get current osu time
getOsuTime()
{
MouseMove, 40, 1400
Send {Click}
Sleep delayVeryLong
Send {Ctrl Down}c{Ctrl Up}
Sleep delay1
MouseMove, 40, 1300
Send {Click}
Sleep 1
Send {Click}
value := clipboard
;Sleep 1000
return value
}

~Tab & 1::
if (scriptOn = "True")
{
currentSV := 0.1
GreenLine("0,1")
Sleep delayVeryLong ; Give osu time to leave F6
sliderStartTime := osuTimeToMs(getOsuTime())
}
return

~Tab & 2::
if (scriptOn = "True")
{
currentSV := 0.4
GreenLine("0,4")
Sleep delayVeryLong ; Give osu time to leave F6
sliderStartTime := osuTimeToMs(getOsuTime())
}
return

~Tab & 3::
if (scriptOn = "True")
{
OsuTimeTest := getOsuTime()
sliderEndTimeBefore := osuTimeToMs(OsuTimeTest)
; Go back to beginning of slider
MouseMove, 40, 1400
Send {Click}
Sleep delayLong
Send %sliderStartTime%
Send {Enter}
}
return

~Tab & 4::
if (scriptOn = "True")
{
; Time Calculations
sliderEndTimeAfter := osuTimeToMs(getOsuTime())
sliderDurationBefore := sliderEndTimeBefore - sliderStartTime
sliderDurationAfter := sliderEndTimeAfter - sliderStartTime

;MsgBox sliderEndTimeBefore %sliderEndTimeBefore% , sliderEndTimeAfter %sliderEndTimeAfter%, sliderStartTime %sliderStartTime%,  

;Sleep 4000

;MsgBox Duration before and after: %sliderDurationBefore%, %sliderDurationAfter%


; SV Calculations
multiplier := sliderDurationBefore / sliderDurationAfter
SV := currentSV * multiplier
SV_string_dot := "" SV
StringReplace, SV_string_comma, SV_string_dot, ., `,

; Go to slider start
MouseMove, 40, 1400
Send {Click}
Sleep delayLong
Send %sliderStartTime%
Sleep delay1
Send {Enter}
Sleep delayMedium

; Set desired SV
;MsgBox Final SV: %SV_string_comma%
DeleteLine()
GreenLine(SV_string_comma)
}
return




; ---------------------------------------------------
; COPYING SLIDERS WITH SV
; ---------------------------------------------------

~+p:: ;~+c
if (scriptOn = "True")
{
EnterF6()
ClickTiming()
GotoCustomSVField()
Send, {Shift down}
; Go to end of field
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Shift up}
Sleep delay2
; We now have the SV highlighted - now copy it
Send {Ctrl Down}c{Ctrl Up}
Sleep delay2
copiedSV := clipboard
Send, {Esc}
}
return


~+o:: ;~+c
if (scriptOn = "True")
{
GreenLine(copiedSV)
}
return


~+c::
if (scriptOn = "True")
{
EnterF6()
ClickTiming()
GotoCustomSVField()
Send, {Shift down}
; Go to end of field
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Shift up}
Sleep delay2 ; We now have the SV highlighted
Send {Ctrl Down}c{Ctrl Up} ; Save SV to clipboard
Sleep delay2 
copiedSV := clipboard ; Save SV to value
Send, {Esc} ; Exit F6
Sleep delayMedium
; Save object to clipboard
Send {Ctrl down}
Sleep delay1
Send {c down}
Sleep delay1
Send {c up}
Sleep delay1
Send {Ctrl up}
Sleep delay1
}
return

~+v::
if (scriptOn = "True")
{
Send {Ctrl down}
Sleep delay1
Send {v down}
Sleep delay1
Send {v up}
Sleep delay1
Send {Ctrl up}
Sleep delay2
GreenLine(copiedSV)
}
return







; ---------------------------------------------------
; REALLY EXPERIMENTAL STUFF
; ---------------------------------------------------

^!k::
if (scriptOn = "True")
{
MouseMove, 25, 10
Sleep delayMedium
Sendinput, {click}
Sleep delay1
MouseMove, 100, 100
Sendinput, {click}
Sleep delayLong
Send, HT Test
Sleep delay1
Send, {NumpadEnter}
Sleep delayLong
Send, {Right}
Sleep delay1
Send, {NumpadEnter}
Sleep 200
MouseMove, 1012, 100
Send, {Click down}
Sleep delay1
MouseMove, 324 ,1400
Sleep delay1
Sendinput, {Click Right}
Sleep delay1
Send, {Click up}
Sleep delay1
MouseMove, 1280, 720
Sleep 500
Send, {Click Right}
Sleep delay2
; Save map
Send {Ctrl down}
Sleep delay1
Send {s down}
Sleep delay1
Send {s up}
Sleep delay1
Send {Ctrl up}
Sleep delay1
; Go back to main menu
Send {Esc down}
Sleep delay1
Send {Esc up}
Sleep 500
Send {Esc down}
Sleep delay1
Send {Esc up}
Sleep 400
; Go into solo
MouseMove, 1280, 720
Sleep delay1
Sendinput, {click}
Sleep delay2
Sendinput, {click}
Sleep delay2
Sendinput, {click}
Sleep 300
; Select HT mod
Send, {F1 down}
Sleep delay1
Send, {F1 up}
Sleep 50
Send {E down}
Sleep delay1
Send {E up}
Sleep delay2
Send {2 down}
Sleep delay1
Send {2 up}
Sleep 300
; Ensure we have right diff selected
MouseMove, 2400, 90
Sleep delay1
Sendinput, {click}
Sleep 100
MouseMove, 2400, 430
Sleep delay1
Sendinput, {click}
Sleep 500
Send {Up down}
Sleep delay1
Send {Up up}
Sleep 50
; Play
MouseMove, 2400, 1300
Sleep delay1
Sendinput, {click}
Sleep delay1
SoundPlay, scriptOffSound.wav
scriptOn := "False"
}
return
