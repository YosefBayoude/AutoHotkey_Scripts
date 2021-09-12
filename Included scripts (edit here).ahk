#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Msgbox % list_files(A_ScriptDir)
tst := list_folder(A_ScriptDir)

i = 30;
length := get_length(tst)
vShipToBillingAddress := ""
loop, %length% {
	string = tst[i]
	Gui, Add, CheckBox, vShipToBillingAddress, Ship to billing address?
	i++
}
Gui, Add, Button,  x186 y230 w100 h30 , OK

Gui, Show, w319 h326, Untitled GUI
return

GuiClose:
ExitApp

ButtonOK:
gui, submit, nohide
MsgBox % "A: " tst.a[A] "`nB: " tst.b[B]  "`nC: " tst.c[C]

Return

list_files(Directory)
{
	files =
	Loop %Directory%\*.*
	{
		files = %files%`n%A_LoopFileName%
	}
	return files
}

list_folder(Directory) {
	array := []
	Loop Files, %Directory%\*.*, R  ; Recurse into subfolders.
	{
		if (A_LoopFileExt != "ahk") {
			Continue
		} else {
			array.Push(A_LoopFileName)
			;MsgBox, 4, , Filename = %A_LoopFileName%`n`nContinue?
			;IfMsgBox, No
			;break
		} 
	}
	return array
}

get_length(array) {
	count :=0
	for key, value in array
    	count++
	return count
}
