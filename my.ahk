#Requires AutoHotkey v2.0

; ------------------------------------------------------------------------------
; Alt IME
;
; alt-ime-ahk-v2.ahk
; https://github.com/h1g0/alt-ime-ahk/tree/feature/ahk-v2
; IMEv2.ahk
; https://github.com/k-ayaki/IMEv2.ahk
;

#Include alt-ime-ahk\alt-ime-ahk-v2.ahk

; ------------------------------------------------------------------------------
; Mac風
;

#UseHook
InstallKeybdHook

#HotIf !WinActive("ahk_class UnrealWindow")
&& !WinActive("ahk_exe blender.exe")
&& !WinActive("ahk_exe Resolve.exe")

SetKeyDelay(0)

; General
!x:: Send("^x") ; Cut
!c:: Send("^c") ; Copy
!v:: Send("^v") ; Paste
!z:: Send("^z") ; Undo
!y:: Send("^y") ; Redo
!s:: Send("^s") ; Save
!a:: Send("^a") ; Select all
!f:: Send("^f") ; Search
!p:: Send("^p") ; Print
!n:: Send("^n") ; New file

; Window
!m:: Send("#{Down}") ; Minimize
!q:: Send("!{F4}")   ; Close

; Text
!b:: Send("^b") ; Bold

; Web browser
!w:: Send("^w")   ; Close tab
!t:: Send("^t")   ; New tab
+!t:: Send("+^t") ; Reopen closed tabs
+!n:: Send("+^n") ; New window in Incognito mode
!l:: Send("^l")   ; Focus on address bar

; Delete text
^h:: Send("{Backspace}")
^d:: Send("{Delete}")
^k:: Send("{Shift down}{End}{Shift up}{Delete}")

; Move cursor
^b:: Send("{Left}")
^f:: Send("{Right}")
^n:: Send("{Down}")
^p:: Send("{Up}")
^a:: Send("{Home}")
^e:: Send("{End}")

; Desktop switch
^Right:: Send("#^{Right}")
^Left:: Send("#^{Left}")

; Esc
^[:: Send "{Esc}"

#HotIf

; ------------------------------------------------------------------------------
; Ctrl-Uでファイル名やExcelのセルを編集
;

#HotIf WinActive("ahk_exe EXCEL.exe") ; Excel
|| WinActive("ahk_class Chrome_WidgetWin_1") ; Chrome, Edge
|| WinActive("ahk_exe explorer.exe") ; Explorer
|| WinActive("ahk_exe Files.exe") ; Files

^u:: Send "{F2}"

#HotIf

; ------------------------------------------------------------------------------
; ChromeでCtrl-Alt-Tキーで翻訳
;

#HotIf WinActive("ahk_exe chrome.exe")
^!t:: Send("!er{Right}{Esc}")
#HotIf

; ------------------------------------------------------------------------------
; マウスカーソルを画面左上に合わせるとウィンドウ一覧
;

CoordMode "Mouse", "Screen"
global executed := False
SetTimer CheckMousePosition, 100

CheckMousePosition() {
    global executed
    MouseGetPos &MouseX, &MouseY
    if (MouseX < 1 and MouseY < 1) {
        if not executed {
            Send "{LWin down}{Tab down}"
            Sleep 100
            Send "{Tab up}{LWin up}"
            executed := True
        }
    } else {
        executed := False
    }
}

; ------------------------------------------------------------------------------
; Shift+ホイールで横スクロール
;

#HotIf WinActive("ahk_exe ONENOTE.exe")
+WheelDown:: Send("{WheelRight}")
+WheelUp:: Send("{WheelLeft}")
#HotIf

#HotIf WinActive("ahk_exe EXCEL.exe")
+WheelDown:: Send("+^{WheelDown}")
+WheelUp:: Send("+^{WheelUp}")
#HotIf