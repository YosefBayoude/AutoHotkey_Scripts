#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Launhes the desktop switch 

Loop, 3 {
	SendInput ^#{Right}
	Sleep 75 ;Delay between each press, tweak if you are experiencing issues going back to the first Virtual Desktop
}
Sleep, 50
Loop, 3 {
	SendInput ^#{Left}
	Sleep 75 ;Delay between each press, tweak if you are experiencing issues going back to the first Virtual Desktop
}

Run, "Desktop Switch.ahk", %A_WorkingDir%
ExitApp, 0
