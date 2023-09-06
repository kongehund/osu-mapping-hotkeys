#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; FOR GREEN LINES TO WORK:
; Go to osu! options
; Under Editor set "Add inheriting Section" to A (or change AddLine())
; Set "Remove Section" to M
; If you don't like A and M to do this, you'll have to find 
;two other keys that aren't conflicting with anything else and 
;edit this script accordingly

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
if (scriptOn = "True")
{			
; Enter rotate menu
Send {Ctrl down}
Sleep 10
Send {Shift down}
Sleep 10
Send {r down}
Sleep 10
Send {r up}
Send {Shift up}
Send {Ctrl up}
Sleep 20
; Rotate around selection center
Send, `t
Sleep 10
Send, `t
Sleep 10
Send, `t
Sleep 10
Send, `t
Sleep 10
Send, {Down}
Sleep 10
; Go to angle field
Send, `t
Sleep 10
Send, `t
Sleep 10
; Enter angle
Send %angle%
Sleep 10
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
; GREEN LINES
; ---------------------------------------------------

EnterF6()
{
Send {F6 down}
Sleep 1
Send {F6 up}
Sleep 200
return
}


ClickTiming()
{
MouseMove, 40, 40
Sleep 1
Send {Click}
Sleep 10
return
}


GotoCustomSVField()
{
MouseMove, 40, 265
Sleep 1
Send {Click}
Sleep 1
Send, {Right}
Sleep 1
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
Send, {a down}
Sleep 1
Send, {a up}
Sleep 200
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
if (scriptOn = "True")
{
Send, {m down}
Sleep 1
Send, {m up}
Sleep 50
}
return
}


~NumpadSub::DeleteLine()


Greenline(SV)
; Adds a green line with a given SV
{
global scriptOn
if (scriptOn = "True")
{
AddCustomSV()
Send, %SV%
Sleep 1
Send, {NumpadEnter}
}
return
}


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
Sleep 1
Send {Shift down}
Sleep 1
Send {s down}
Sleep 1
Send {s up}
Send {Shift up}
Send {Ctrl up}
Sleep 10
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
Sleep 1
Send {Click}
Sleep 1
Send, {Right}
Sleep 1
Send, {Up}
Sleep 1
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
Sleep 1
Send {Click}
Sleep 1
Send, {Right}
Sleep 1
Send, {Up}
Sleep 1
Send, {Up}
Sleep 1
Send, {Up}
Sleep 1
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
Sleep 1
Send {Click}
Sleep 1
Send, {Right}
Sleep 1
Send, {Down}
Sleep 1
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
Sleep 1
Send {Click}
Sleep 1
Send, {Right}
Sleep 1
Send, {Down}
Sleep 1
Send, {Down}
Sleep 1
Send, {Down}
Sleep 1
Send, {NumpadEnter}
}
return


; Mute slider end via half-grid
~b::
if (scriptOn = "True")
{
Send {b up}
Sleep 1
; Half beat snap divisor
Send {Ctrl down}
Sleep 1
Send {WheelUp}
Sleep 1
Send {Ctrl up}
Sleep 1
; Next gridline
Send {WheelDown}
Sleep 1
; Normal beat snap divisor
Send {Ctrl down}
Sleep 1
Send {WheelDown}
Sleep 1
Send {Ctrl up}
Sleep 1
; Green line
Send, {a down}
Sleep 1
Send, {a up}
Sleep 1
Send, {NumpadEnter}
Sleep 1
; Go back to previous gridline
Send {WheelUp}
Sleep 200
Send, {a down}
Sleep 200
Send, {a up}
Sleep 10
MouseMove, 190, 230
Sleep 100
sendinput,{click}{click}
Send {5}
Send, {NumpadEnter}
}
return

; Mute slider end normally
~n::
if (scriptOn = "True")
{
Send {Shift up}
Send {b up}
Send {WheelDown} ; Next gridline
Sleep 1
NewLine() ; Normal volume here
Sleep 10
; Go back to previous gridline
Send {WheelUp}
Sleep 200
Send, {a down}
Sleep 200
Send, {a up}
Sleep 10
MouseMove, 190, 230
Sleep 100
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
Sleep 1
Send, {a down}
Sleep 200
Send, {a up}
Sleep 10
MouseMove, 190, 230
Sleep 100
sendinput,{click}{click}
Send {5}
Send, {NumpadEnter}
}
return



~s::
if (scriptOn = "True")
{
snapCounter := 0
}
return

~+a::
if (scriptOn = "True")
{
currentSV := 0.1
GreenLine("0,1")
snapCounter := 0
}
return

~+s::
if (scriptOn = "True")
{
currentSV := 0.4
GreenLine("0,4")
snapCounter := 0
}
return

~WheelDown::snapCounter++
~WheelUp::snapCounter--

SetSliderLength(length)
{
global scriptOn
global currentSV
global snapCounter
if (scriptOn = "True")
{
; Calculations
multiplier := snapCounter / length
SV := currentSV * multiplier
SV_string_dot := "" SV
StringReplace, SV_string_comma, SV_string_dot, ., `,
; Go back to slider start
Loop, %snapCounter% ; Go back to slider head
{
Send, {WheelUp}
Sleep 1
}
snapCounter := 0
; Set desired SV
EnterF6()
ClickTiming()
GotoCustomSVField()
ClearField()
Sleep 1
Send, %SV_string_comma%
Sleep 1
Send, {NumpadEnter}
;DeleteLine()
;GreenLine(SV_string_comma)
}
return
}

~Tab & 1::SetSliderLength(1)
~Tab & 2::SetSliderLength(2)
~Tab & 3::SetSliderLength(3)
~Tab & 4::SetSliderLength(4)
~Tab & 5::SetSliderLength(1.5)

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
Sleep 10
; We now have the SV highlighted - now copy it
Send {Ctrl Down}c{Ctrl Up}
Sleep 10
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
Sleep 10 ; We now have the SV highlighted
Send {Ctrl Down}c{Ctrl Up} ; Save SV to clipboard
Sleep 10
copiedSV := clipboard ; Save SV to value
Send, {Esc} ; Exit F6
Sleep 100
; Save object to clipboard
Send {Ctrl down}
Sleep 1
Send {c down}
Sleep 1
Send {c up}
Sleep 1
Send {Ctrl up}
Sleep 1
}
return

~+v::
if (scriptOn = "True")
{
Send {Ctrl down}
Sleep 1
Send {v down}
Sleep 1
Send {v up}
Sleep 1
Send {Ctrl up}
Sleep 10
GreenLine(copiedSV)
}
return


^!k::
if (scriptOn = "True")
{
MouseMove, 25, 10
Sleep 100
Sendinput, {click}
Sleep 1
MouseMove, 100, 100
Sendinput, {click}
Sleep 200
Send, HT Test
Sleep 1
Send, {NumpadEnter}
Sleep 200
Send, {Right}
Sleep 1
Send, {NumpadEnter}
Sleep 200
MouseMove, 1012, 100
Send, {Click down}
Sleep 1
MouseMove, 324 ,1400
Sleep 1
Sendinput, {Click Right}
Sleep 1
Send, {Click up}
Sleep 1
MouseMove, 1280, 720
Sleep 500
Send, {Click Right}
Sleep 10
; Save map
Send {Ctrl down}
Sleep 1
Send {s down}
Sleep 1
Send {s up}
Sleep 1
Send {Ctrl up}
Sleep 1
; Go back to main menu
Send {Esc down}
Sleep 1
Send {Esc up}
Sleep 500
Send {Esc down}
Sleep 1
Send {Esc up}
Sleep 400
; Go into solo
MouseMove, 1280, 720
Sleep 1
Sendinput, {click}
Sleep 10
Sendinput, {click}
Sleep 10
Sendinput, {click}
Sleep 300
; Select HT mod
Send, {F1 down}
Sleep 1
Send, {F1 up}
Sleep 50
Send {E down}
Sleep 1
Send {E up}
Sleep 10
Send {2 down}
Sleep 1
Send {2 up}
Sleep 300
; Ensure we have right diff selected
MouseMove, 2400, 90
Sleep 1
Sendinput, {click}
Sleep 100
MouseMove, 2400, 430
Sleep 1
Sendinput, {click}
Sleep 500
Send {Up down}
Sleep 1
Send {Up up}
Sleep 50
; Play
MouseMove, 2400, 1300
Sleep 1
Sendinput, {click}
Sleep 1
SoundPlay, scriptOffSound.wav
scriptOn := "False"
}
return
