#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

F14::
	if (!WinExist("ahk_exe vivaldi.exe")) { ;program needs to be open
		MsgBox, test, msg, , 
		return
	}

	WinGet, isAlwaysOnTop, ExStyle, ahk_exe vivaldi.exe, , , 
	if (isAlwaysOnTop & 0x8) {
		checkIfMinimized()
		removeAlwaysOnTop()
	} else {
		setAlwaysOnTop()
	}
	return
	

setAlwaysOnTop() {
	WinActivate, ahk_exe vivaldi.exe
	WinSet, Alwaysontop, ON, ahk_exe vivaldi.exe
	WinSet, Transparent, 225, ahk_exe vivaldi.exe
}

removeAlwaysOnTop() {
	WinMinimize, ahk_exe vivaldi.exe, , , 
	WinSet, Alwaysontop, OFF, ahk_exe vivaldi.exe
	WinSet, Transparent, OFF, ahk_exe vivaldi.exe
}

checkIfMinimized() { ;Window might be set to always on top but is minimized, in this case, simply pull up the program
	WinGet, isMinimized, MinMax, ahk_exe vivaldi.exe
	if (isMinimized = -1) {
		WinActivate, ahk_exe vivaldi.exe
		Exit ;terminate script
	}
}