; Hide completely task bar
; Paste this line to your autohotkey then press <Windows> + H to toggle your taskbar
; Credit to the original author in autohotkey forum :)
LWin & t:: 
if toggle := !toggle
{
  WinHide ahk_class Shell_TrayWnd
  WinHide Start ahk_class Button
}
else
{
  WinShow ahk_class Shell_TrayWnd
  WinShow Start ahk_class Button
}
return