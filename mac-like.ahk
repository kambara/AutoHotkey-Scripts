#Requires AutoHotkey v2.0

;;; Mac風ショートカットキー

#Include send-sleep.ahk

#HotIf !WinActive("ahk_class UnrealWindow")
&& !WinActive("ahk_exe blender.exe")
&& !WinActive("ahk_exe Resolve.exe")
&& !WinActive("ahk_exe mpv.exe")

; General
!x:: SendSleep("^x") ; Cut
!c:: SendSleep("^c") ; Copy
!v:: SendSleep("^v") ; Paste
!z:: SendSleep("^z") ; Undo
!y:: SendSleep("^y") ; Redo
!s:: SendSleep("^s") ; Save
!a:: SendSleep("^a") ; Select all
!f:: SendSleep("^f") ; Search
!p:: SendSleep("^p") ; Print
!n:: SendSleep("^n") ; New file

; Window
!m:: SendSleep("#{Down}") ; Minimize
!q:: SendSleep("!{F4}")   ; Close

; Text
!b:: SendSleep("^b") ; Bold

; Web browser
!w:: SendSleep("^w")   ; Close tab
!t:: SendSleep("^t")   ; New tab
+!t:: SendSleep("+^t") ; Reopen closed tabs
+!n:: SendSleep("+^n") ; New window in Incognito mode
!l:: SendSleep("^l")   ; Focus on address bar

; Delete text
^h:: SendSleep("{Backspace}")
^d:: SendSleep("{Delete}")
^k:: SendSleep("{Shift down}{End}{Shift up}{Delete}")

; Move cursor
^b:: SendSleep("{Left}")
^f:: SendSleep("{Right}")
^n:: SendSleep("{Down}")
^p:: SendSleep("{Up}")
^a:: SendSleep("{Home}")
^e:: SendSleep("{End}")

; Desktop switch
^Right:: SendSleep("#^{Right}")
^Left:: SendSleep("#^{Left}")

; Vim-like Esc
^[:: SendSleep "{Esc}"

#HotIf