﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive ahk_exe Typora.exe
{
    ²::
        SendRaw, ``
        SendRaw, ``
        Send {BackSpace}
        return

    +²::
        SendRaw, ``
        SendRaw, ``
        SendRaw, ``
        SendRaw, c++
        Send {Enter}
        return

    ::->::→ ;clean arrow
}
