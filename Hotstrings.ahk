#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force

:*:todo::
    FormatTime, CurrentDateTime,, M/d/yy
    SendInput TODO [LMW %CurrentDateTime%] 
    return
