#Requires AutoHotkey v2.0

; ------------------------------------------------------------------------------
; Alt IME
;
; alt-ime-ahk-v2.ahk
; https://github.com/h1g0/alt-ime-ahk/tree/feature/ahk-v2
; Author: h1g0
;
; IMEv2.ahk
; https://github.com/k-ayaki/IMEv2.ahk
;

#Include IMEv2.ahk

; Razer Synapseなど、キーカスタマイズ系のツールを併用しているときのエラー対策
A_MaxHotkeysPerInterval := 350

; 主要なキーを HotKey に設定し、何もせずパススルーする
*~a::
*~b::
*~c::
*~d::
*~e::
*~f::
*~g::
*~h::
*~i::
*~j::
*~k::
*~l::
*~m::
*~n::
*~o::
*~p::
*~q::
*~r::
*~s::
*~t::
*~u::
*~v::
*~w::
*~x::
*~y::
*~z::
*~1::
*~2::
*~3::
*~4::
*~5::
*~6::
*~7::
*~8::
*~9::
*~0::
*~F1::
*~F2::
*~F3::
*~F4::
*~F5::
*~F6::
*~F7::
*~F8::
*~F9::
*~F10::
*~F11::
*~F12::
*~`::
*~~::
*~!::
*~@::
*~#::
*~$::
*~%::
*~^::
*~&::
*~*::
*~(::
*~)::
*~-::
*~_::
*~=::
*~+::
*~[::
*~{::
*~]::
*~}::
*~\::
*~|::
*~;::
*~'::
*~"::
*~,::
*~<::
*~.::
*~>::
*~/::
*~?::
*~Esc::
*~Tab::
*~Space::
*~Left::
*~Right::
*~Up::
*~Down::
*~Enter::
*~PrintScreen::
*~Delete::
*~Home::
*~End::
*~PgUp::
*~PgDn::
{
    Return
}

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send ("{Blind}{vk07}")
*~RAlt::Send ("{Blind}{vk07}")

; 左 Alt 空打ちで IME を OFF
LAlt up::
{
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return
}

; 右 Alt 空打ちで IME を ON
RAlt up::
{
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return
}

; ------------------------------------------------------------------------------
; Mac風
;

#UseHook
InstallKeybdHook

#HotIf !WinActive("ahk_class UnrealWindow")
&& !WinActive("ahk_exe blender.exe")
&& !WinActive("ahk_exe Resolve.exe")

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
!w::  SendSleep("^w")   ; Close tab
!t::  SendSleep("^t")   ; New tab
+!t:: SendSleep("+^t") ; Reopen closed tabs
+!n:: SendSleep("+^n") ; New window in Incognito mode
!l::  SendSleep("^l")   ; Focus on address bar

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
^Left::  SendSleep("#^{Left}")

; Vim-like Esc
^[:: SendSleep "{Esc}"

#HotIf

; ------------------------------------------------------------------------------
; Ctrl-Uでファイル名やExcelのセルを編集
;

#HotIf WinActive("ahk_exe EXCEL.exe") ; Excel
|| WinActive("ahk_class Chrome_WidgetWin_1") ; Chrome, Edge
|| WinActive("ahk_exe explorer.exe") ; Explorer
|| WinActive("ahk_exe Files.exe") ; Files

^u:: SendSleep("{F2}")

#HotIf

; ------------------------------------------------------------------------------
; ChromeでCtrl-Alt-Tキーで翻訳
;

#HotIf WinActive("ahk_exe chrome.exe")
^!t:: SendSleep("!er{Right}{Esc}")
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
+WheelUp::   Send("{WheelLeft}")
#HotIf

; Excel
#HotIf WinActive("ahk_exe EXCEL.exe")
+WheelDown:: Send("+^{WheelDown}")
+WheelUp::   Send("+^{WheelUp}")
#HotIf

; DaVinci Resolve
#HotIf WinActive("ahk_exe Resolve.exe")
+WheelDown:: Send("{Right}")
+WheelUp::   Send("{Left}")
^WheelDown:: Send("+{Right}")
^WheelUp::   Send("+{Left}")
#HotIf

; ------------------------------------------------------------------------------
; キー押しっぱなし対策
;

SendSleep(key) {
    Send(key)
    Sleep(2)
    return
}
