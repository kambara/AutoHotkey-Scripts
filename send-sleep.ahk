#Requires AutoHotkey v2.0

;;; キー押しっぱなし対策
;;; https://knowledge.sakura.ad.jp/25827/

SendSleep(key) {
    Send(key)
    Sleep(2)
    return
}
