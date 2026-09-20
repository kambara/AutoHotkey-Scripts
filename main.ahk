#Requires AutoHotkey v2.0

#UseHook
InstallKeybdHook
InstallMouseHook

;;; キーの履歴を保存（必要に応じて有効化）
; KeyHistory

;;; Alt IME
#Include alt-ime.ahk

;;; Mac風ショートカット
#Include mac-like.ahk

;;; キー押しっぱなし対策用SendSleep関数
#Include send-sleep.ahk

; ------------------------------------------------------------------------------
; Ctrl+U：ファイル名やExcelのセルを編集
;

#HotIf WinActive("ahk_exe EXCEL.exe") ; Excel
|| WinActive("ahk_class Chrome_WidgetWin_1") ; Chrome, Edge
|| WinActive("ahk_exe explorer.exe") ; Explorer
|| WinActive("ahk_exe Files.exe") ; Files
^u:: SendSleep("{F2}")
#HotIf

; ------------------------------------------------------------------------------
; Ctrl+Alt+T：ChromeやEdgeで翻訳
;

#HotIf WinActive("ahk_exe chrome.exe")
|| WinActive("ahk_exe msedge.exe")
^!t:: {
    Send("+{F10}")
    Sleep(100)
    SendSleep("t{Esc}")
}
#HotIf

; ------------------------------------------------------------------------------
; マウスカーソルを画面左上に合わせるとウィンドウ一覧
;

CoordMode "Mouse", "Screen"
global executed := False
SetTimer CheckMousePosition, 100

CheckMousePosition() {
    global executed
    MouseGetPos(&MouseX, &MouseY)
    if (MouseX < 1 and MouseY < 1) {
        if not executed {
            Send("{LWin down}{Tab down}")
            Sleep(100)
            Send("{Tab up}{LWin up}")
            executed := True
        }
    } else {
        executed := False
    }
}

; ------------------------------------------------------------------------------
; Shift+ホイールで横スクロール
;

; OneNote
#HotIf WinActive("ahk_exe ONENOTE.exe")
+WheelDown:: Send("{WheelRight}")
+WheelUp:: Send("{WheelLeft}")
#HotIf

; Excel
#HotIf WinActive("ahk_exe EXCEL.exe")
+WheelDown:: Send("+^{WheelDown}")
+WheelUp:: Send("+^{WheelUp}")
#HotIf

; DaVinci Resolve
#HotIf WinActive("ahk_exe Resolve.exe")
+WheelDown:: Send("{Right}")
+WheelUp:: Send("{Left}")
^WheelDown:: Send("+{Right}")
^WheelUp:: Send("+{Left}")
#HotIf

; ------------------------------------------------------------------------------
; mpvホイール操作
;

#HotIf WinActive("ahk_exe mpv.exe")
XButton1 & WheelUp:: Send(",")
XButton1 & WheelDown:: Send(".")
#HotIf