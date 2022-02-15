#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

;FileBot preset
;{f}|D:/Series/{n}/Season {s.pad(2)}/ {n} - {s00e00.lower()} - {t.replaceAll(/[:|?]/, " - ")}.{ext}

;Requires "Move File With Native Progress Bar" available at (https://github.com/YosefBayoude/move-file-with-native-progress-bar/releases)
moveFileCommandPath := "MoveFileWithNativeProgressBar.exe" ;.exe is assumed to be in same directory as this script
scriptPath := "move_files.bat"



+#v::
	if WinExist("FileBot"){
		WinActivate
	} else  {
		return
	}


	Clipboard:=
	previousClipboard := ""

	;Clear file
	FileRead, MyContents, %scriptPath% ;this reads whatever text is in the text file we are working with
	file := FileOpen(scriptPath, "w") ;this wipes out all text in the file - does it overwrite it in this line as well? Either way, it works as planned
	file.close() ;this closes the file - at this stage, the text file is empty and overwritten (saved) to the hard drive

	fileappend, % "@echo off" . "`n", %scriptPath%, UTF-8 ;first call to fileappend creates the file, so we define the encoding
	fileappend, % "chcp 65001" . "`n", %scriptPath% ;allows for accents in name
	
	Loop {
		Send, {F2}
		Sleep, 200
		Send, ^a
		Sleep, 50
		Send, ^c
		Sleep, 50
		if (previousClipboard != clipboard) { ;allows for script to automatically stop
			fileappend, % getLine() . "`n", %scriptPath%
			previousClipboard := clipboard
		} else {
			Send, {Esc}
			break
		}
		Send, {Esc}
		Sleep, 200
		Send, {Down}
	}

	Sleep, 200
	checkMoveCommandExisist()
	Run, %scriptPath% && del %scriptPath%

return

getOldName() {
	needleLocation := StrLen(clipboard) - InStr(clipboard, "|") + 1 ;Trimming string start from the right, + 1 offset
	StringTrimRight, oldName, clipboard, needleLocation
	return oldName
}

getNewName() {
	needleLocation := InStr(clipboard, "|")
	StringTrimLeft, newName, clipboard, needleLocation
	return newName
}

getLine() {
	global moveFileCommandPath ;required to access declared global variable from inside a function
	line := ".\" . moveFileCommandPath . " """ . getOldName() . """ """ . getNewName() . """"
	return line
}

checkMoveCommandExisist() {
	global moveFileCommandPath
	global scriptPath
	if !FileExist(moveFileCommandPath) {

		if FileExist(scriptPath) {
			Run %comspec% /c del move_files.bat
		}

		MsgBox, 16, Error file missing, The file "%moveFileCommandPath%" was not found

		return
	}
}