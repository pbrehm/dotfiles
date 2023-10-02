#Requires AutoHotkey v2.0-beta
; https://gist.github.com/volks73/1e889e01ad0a736159a5d56268a300a8?permalink_comment_id=4688167#gistcomment-4688167
; remap ctrl -> esc on press, ctrl on hold + other key
*CapsLock::
{
    Send "{LControl down}"
}

*CapsLock up::
{
    Send "{LControl Up}"

    if (A_PriorKey=="CapsLock"){
	if (A_TimeSincePriorHotkey < 1000)
		Suspend "1"
		Send "{Esc}"
		Suspend "0"
	}
}

; remap Left Ctrl to capslock
LCtrl::CapsLock

