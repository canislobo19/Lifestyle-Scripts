#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Creates a message to Stop whatever you're doing. Doesn't have a trigger yet.

Gui,  +AlwaysOnTop -SysMenu +Owner 

Gui, font, s120, Verdana 

Gui, Add, Text, +Wrap w1200, Stop It

Gui -Caption

Gui, Show, x0 y0 h800 w1600

Esc::ExitApp