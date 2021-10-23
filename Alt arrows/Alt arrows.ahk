#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

(#IfWinActive ahk_exe studio64.exe) || (#IfWinActive ahk_exe idea64.exe)
{
	Alt up:: ;disable alt key being released by itself
		return
	Alt & down:: ;however, when it is pressed it should still be considered
		Send, {Alt}
		return
    !Space::
		return
    !i::
        Send, {Up}
		return
    !j::
        Send, {Left}
		return
    !l::
        Send, {Right}
		return
    !k::
        Send, {Down}
		return
    !o::
        Send, ^{Right}
		return
    !u::
        Send, ^{Left}
		return
    !m::
        Send, {End}
		return
    !h::
        Send, {Home}
		return
	!,::
		Send, {BackSpace}
		return
	!n::
		Send, ^{BackSpace}
		return
	!;::
		Send, {Delete}
		return
	!r::
		Send, !{Right}
		return
	!z::
		Send, !{Left}
		return
	!e::
		Send, {PgUp}
		return
	!d::
		Send, {PgDn}
		return
	!f::
		Send, #{Right}
		Return
	!s::
		Send, #{Left}
		Return
}