/*!
	Load WattMann profile AMD Radeon Adrenalin driver
	Usage:
	Radeon-Profile.(ahk|exe) [profile.xml] [RadeonSettings.exe] [delay]

	Optional command line parameters:
	1: profile file path (.xml)
	2: RadeonSettings.exe path
	3: Delay in ms between Radeon Settings menu interactions
*/

#Include <Acc>

; Defaults
profile := "%userprofile%\AppData\Local\AMD\CN\WattmanProfiles\WattMann-profile.xml"
exe := "C:\Program Files\AMD\CNext\CNext\RadeonSoftware.exe"
delay := 200
endDelay := 1000

; Handle command line parameters
if A_Args.Length() > 0 {
	profile := A_Args[1]
	if A_Args.Length() > 1
		exe := A_Args[2]
	if A_Args.Length() > 2
		delay := A_Args[3]
}

;~ RADEON EINSTELLUNGEN
;~ ahk_class Qt5QWindowOwnDCIcon

hWnd := WinExist("ahk_exe " exe)
if not hWnd {
	Run, %exe%
	WinWait, ahk_exe %exe%,, 10
	hWnd := WinExist()
}
If not hWnd
	Exit


; Accessible path-codes from AccViewer
Acc_TryAction("4.11", Acc_ObjectFromWindow(hWnd, 0), "Performance")  ; Click, 50 50
Sleep, delay
Acc_TryAction("4.1.1.2.2",,"Tuning")  ; Click, 50 100
Sleep, delay*2
Acc_TryAction("4.1.1.1.1.3",, "GPU 1")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}


Acc_TryAction("4.1.1.1.1.4",, "GPU 2")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

Acc_TryAction("4.1.1.1.1.5",, "GPU 3")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

Acc_TryAction("4.1.1.1.1.6",, "GPU 4")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

Acc_TryAction("4.1.1.1.1.7",, "GPU 5")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

Acc_TryAction("4.1.1.1.1.8",, "GPU 6")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

Acc_TryAction("4.1.1.1.1.9",, "GPU 7")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

Acc_TryAction("4.1.1.1.1.10",, "GPU 8")  ; Click, 500 100
Sleep, delay
Acc_TryAction("4.1.1.2.5",, "Menu")  ; Click, 500 500
Sleep, delay
Acc_TryAction("4.19.1",, "Load Profile")  ; Click, 750 125

; Open file dialog
WinWait, ahk_class #32770,, 2
if not errorlevel {
	Sleep, delay
	SetControlDelay -1
	ControlSetText, Edit1, %profile%
	Sleep, delay
	ControlClick, Button1
	WinWaitClose
	Sleep, endDelay
}

; See Acc_DoAction
; name is for the message
Acc_TryAction(hildPath, oAccWin:="", name:="") {
	Loop {
		Acc_DoAction(hildPath, oAccWin)
		if not errorlevel
			return
		MsgBox, 0x116, %A_ScriptName%, %errorlevel%`n"%name%"
		IfMsgBox Cancel
			Exit
		else IfMsgBox Continue
			return
	}
}

; Do the default action for an acc element.
; Saves the last used oAccWin
; Use oAccWin := Acc_ObjectFromWindow(hWnd, 0)
Acc_DoAction(ChildPath, oAccWin:="") {
	static oLastAccWin
	oAccWin := oAccWin ? oAccWin : oLastAccWin
	Acc_Get("DoAction", ChildPath, 0, oAccWin)
	oLastAccWin := oAccWin
	return errorlevel
}