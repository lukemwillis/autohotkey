;Config
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
#MaxHotkeysPerInterval 500
#UseHook
#InstallKeybdHook

;Init
#If, GetKeyState("CapsLock", "T")

;Mouse Click Support
*Space::Click, Left
*RCtrl::Click, Right
*RAlt::Click, Middle

;Mouse Move Support
Rate := 0
*K::
*L::
*J::
*`;::
    Loop {
        X := Y := 0
        Rate := Min(25, Rate + 1)
        if GetKeyState("K", "P")
            Y -= Rate ; Up
        if GetKeyState("L", "P")
            Y += Rate ; Down
        if GetKeyState("J", "P")
            X -= Rate ; Left
        if GetKeyState(";", "P")
            X += Rate ; Right
        MouseMove, X, Y, 0, R
    } Until !X and !Y
    Rate := 0
    return

;Mouse Wheel Support
*D::Click, WheelUp
*S::Click, WheelDown
*A::Click, WheelLeft
*F::Click, WheelRight
