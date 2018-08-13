;Config
#NoEnv
SetWorkingDir %A_ScriptDir%
#SingleInstance force
#MaxHotkeysPerInterval 500
#UseHook
#InstallKeybdHook

;Keys
KEY_MOUSE_TOGGLE := "CapsLock"

CLICK_LEFT := "Space"
CLICK_MIDDLE := "RCtrl"
CLICK_RIGHT := "RAlt"

SCROLL_UP := "D"
SCROLL_DOWN := "S"
SCROLL_LEFT := "A"
SCROLL_RIGHT := "F"

POINTER_UP := "K"
POINTER_DOWN := "L"
POINTER_LEFT := "J"
POINTER_RIGHT := ";"

;Init
#If, GetKeyState(KEY_MOUSE_TOGGLE, "T")

;Mouse Click Support
HotKey, *%CLICK_LEFT%, ClickLeft
ClickLeft() {
    Click, Left
}
HotKey, *%CLICK_MIDDLE%, ClickMiddle
ClickMiddle() {
    Click, Middle
}
HotKey, *%CLICK_RIGHT%, ClickRight
ClickRight() {
    Click, Right
}

;Mouse Wheel Support
HotKey, *%SCROLL_UP%, ScrollUp
ScrollUp() {
    Click, WheelUp
}
HotKey, *%SCROLL_DOWN%, ScrollDown
ScrollDown() {
    Click, WheelDown
}
HotKey, *%SCROLL_LEFT%, ScrollLeft
ScrollLeft() {
    Click, WheelLeft
}
HotKey, *%SCROLL_RIGHT%, ScrollRight
ScrollRight() {
    Click, WheelRight
}

;Mouse Move Support
Hotkey, *%POINTER_UP%, MovePointer
Hotkey, *%POINTER_DOWN%, MovePointer
Hotkey, *%POINTER_LEFT%, MovePointer
Hotkey, *%POINTER_RIGHT%, MovePointer

Rate := 0
MovePointer() {
    Loop {
        X := Y := 0
        Rate := Min(25, Rate + 1)
        if (GetKeyState(POINTER_UP, "P")) {
            MsgBox, "MovePointer Up"
            Y -= Rate
        }
        if (GetKeyState(POINTER_DOWN, "P")) {
            MsgBox, "MovePointer Down"
            Y += Rate
        }
        if (GetKeyState(POINTER_LEFT, "P")) {
            MsgBox, "MovePointer Left"
            X -= Rate
        }
        if (GetKeyState(POINTER_RIGHT, "P")) {
            MsgBox, "MovePointer Right"
            X += Rate
        }
        ; if (X <> 0 and Y <> 0) {
        ;     X = Sin(X)
        ;     Y = Sin(Y)
        ; }
        MouseMove, X, Y, 0, R
    } Until !X and !Y
    Rate := 0
}