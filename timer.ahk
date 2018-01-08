#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon

;Following the advice of doctors to take a 2-minute break after 20 minutes of using a computer, this script
;counts down for 20 minutes while you work and then opens a screen that counts down from 2 minutes while you take a break.
;Repeats from the 20 minute countdown again.

WorkTime := 1200
BreakTime := 120

RightX := 0
FirstCall := True

Gui, +Owner -Caption +LastFound
Gui, Margin, 10, 10
Gui, Font, s50
Gui, Add, Text, cBlue vTime Center, % Format(" {:02}:{:02} ", WorkTime // 60, Mod(WorkTime, 60))
Gui, Show, Hide


T := A_TickCount
S := 0
W := WorkTime
SetTimer, Countdown, 100
Return

GuiSize:
If (FirstCall) {
   RightX := A_ScreenWidth - A_GuiWidth
   FirstCall := False
   Gui, Show, x%RightX% yCenter NA
   WinSet, Bottom
}
Return

Countdown:
   Secs := (A_TickCount - T) // 1000
   If (Secs = S)
      Return
   S := Secs
   If (S < W) {
      If (W = BreakTime)
         SoundPlay, *48
      GuiControl, , Time, % Format("{:02}:{:02}", (W - S) // 60, Mod(W - S, 60))
      Return
   }
   Gui, +LastFound
   S := 0
   T := A_TickCount
   If (W = WorkTime) {
      W := BreakTime
      GuiControl, +cRed, Time
      GuiControl, , Time, % Format("{:02}:{:02}", (W - S) // 60, Mod(W - S, 60))
      Gui, +AlwaysOnTop
      Gui, Show, xCenter yCenter NA
      SoundPlay, *48
   }
   Else {
      W := WorkTime
      GuiControl, +cBlue, Time
      GuiControl, , Time, % Format("{:02}:{:02}", (W - S) // 60, Mod(W - S, 60))
      Gui, -AlwaysOnTop
      Gui, Show, x%RightX% yCenter NA
      WinSet, Bottom
   }
Return

; Esc::ExitApp
