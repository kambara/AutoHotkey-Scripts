#Requires AutoHotkey v2.0

;;; 参考：
;;; alt-ime-ahk-v2.ahk (Author: h1g0)
;;; https://github.com/h1g0/alt-ime-ahk/tree/feature/ahk-v2

;;; IMEv2.ahk
;;; https://github.com/k-ayaki/IMEv2.ahk
#Include IMEv2.ahk/IMEv2.ahk

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
    return
}

; 上部メニューがアクティブになるのを抑制
*~LAlt:: Send ("{Blind}{vk07}")
*~RAlt:: Send ("{Blind}{vk07}")

; 左 Alt 空打ちで IME を OFF
LAlt up::
{
    if (A_PriorHotkey == "*~LAlt") {
        IME_SET(0)
    }
    return
}

; 右 Alt 空打ちで IME を ON
RAlt up::
{
    if (A_PriorHotkey == "*~RAlt") {
        IME_SET(1)
    }
    return
}

; 左 Ctrl 空打ちで IME を ON
*~LCtrl:: return

LCtrl up::
{
    if (A_PriorHotkey == "*~LCtrl") {
        IME_SET(1)
    }
    return
}
