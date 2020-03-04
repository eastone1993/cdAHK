#SingleInstance, force 
#NoTrayIcon
#Persistent
#include %A_ScriptDir%\lib\GUILibrary.ahk 


SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On
SetTitleMatchMode, 2

EnvSet, fpath, %A_WorkingDir% 


Gui, +Resize  
Gui, Add, Tab3, , General|List of Hotkeys 

Gui, Tab, 1
BuildButton("mainscript", "Main Script", 55, 75, 205, 60)
BuildTap("CustomAHK", "Custom AHK", 55, 150, 205, 60)
BuildTap("copyGUI", "Display Copy Macros", 55, 225, 205, 60)

Gui, Tab, 2
Gui, Add, Text,, xplus - <mathExpression>X + X</mathExpression>
Gui, Add, Text,, xminus - <mathExpression>X - X</mathExpression>
Gui, Add, Text,, xtimes - <mathExpression>X * X</mathExpression>
Gui, Add, Text,, xdiv - <mathExpression>X #div X</mathExpression>
Gui, Add, Text,, xfrac - <mathExpression>#frac{X}{X}</mathExpression>
Gui, Add, Text,, xmfrac - <mathExpression>X #frac{X}{X}</mathExpression>
Gui, Add, Text,, xroot - <mathExpression>#root{X}{X}</mathExpression>
Gui, Add, Text,, ctrl + shift + a - wraps text in <mathExpression>
Gui, Add, Text,, ctrl + Shift + 0-9 - copies and creates a macro to the `nspecified number key
Gui, Add, Text,, ctrl + alt + 0-9 - pastes the macro to the corresponding `nnumber key 

Gui, Tab 
Gui, Add, Button, x10  vReloadButton gRELOAD_ON, Reload ;450y
Gui, Add, Radio, vOnTop gTOP_ON, AHK window always displayed 
Gui, Add, Radio, Checked vOnBottom gTOP_OFF, AHK window not always displayed 


Gui, Show, , IXL AHK 


scriptArray := ["CustomAHK", "mainscript", "copyGUI"]

return 
;----------------------------------- GENERAL TAB -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- CUSTOM -------------------------------------------------------------------------------------------------------------
CustomAHKOn:
{
	Tap("CustomAHK", "\scripts")
	return
}
;----------------------------------- MAIN SCRIPT -------------------------------------------------------------------------------------------------------------
mainscriptOn:
{
	OnButton("mainscript", "\scripts")
	return
}
mainscriptOff:
{
	OffButton("mainscript", "\scripts")
	return 
}

;----------------------------------- COPY MACROS DISPLAY -------------------------------------------------------------------------------------------------------------
copyGUIOn:
{
	Tap("copyGUI", "\scripts")
	return
}

;----------------------------------- NO TAB -------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- RELOAD -------------------------------------------------------------------------------------------------------------
RELOAD_ON:
{
	ExitAllArray("\scripts", ".ahk", scriptArray)
    SubmitSettings()
	Reload 
	return 
}
;----------------------------------- WINDOW PRIORITY CONTROLS -------------------------------------------------------------------------------------------------------------
TOP_ON:
{
    Gui, +AlwaysOnTop
    return
}
TOP_OFF:
{
    WinSet, AlwaysOnTop, Off 
    return 
}
;------------------------------------------------------------------------------------------------------------------------------------------------
GuiClose:
SubmitSettings()
ExitAllArray("\scripts", ".ahk", scriptArray)
ExitApp
;----------------------------------- FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------------------------------------------
CheckForScript() {
	if WinExist("mainscript.ahk")
	{
		Tap("searchkey", "\scripts\auxillary")
		return 
	}
}

SubmitSettings() {
    Gui, Submit 
    IniWrite, %sr%, settings.ini, Settings, sendright 
    IniWrite, %new_window%, settings.ini, Settings, newwindow 
    IniWrite, %sm%, settings.ini, Settings, subman 
    IniWrite, %sf%, settings.ini, Settings, salesforce  
    IniWrite, %q%, settings.ini, Settings, quia  
    return 
}



