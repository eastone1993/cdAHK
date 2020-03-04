#Persistent
#SingleInstance, force 
#Include %A_WorkingDir%\lib\ixlsearch.ahk 
#IfWinNotExist, `%A_ScriptDir`%\auxillary\CopyMacros.ahk
{
	Run, %A_ScriptDir%\auxillary\CopyMacros.ahk  
}

OnExit("ExitFunc")

ExitFunc() {
	DetectHiddenWindows, On 
	WinClose, %A_ScriptDir%\auxillary\CopyMacros.ahk ahk_class AutoHotkey
	return 
}

:?*:xplus::<mathExpression>X {+} X</
:?*:xminus::<mathExpression>X - X</
:?*:xtimes::<mathExpression>X * X</
:?*:xdiv::<mathExpression>X {#}div X</
:?*:xfrac::<mathExpression>{#}frac{{}X{}}{{}X{}}</
:?*:xmfrac::<mathExpression>X {#}frac{{}X{}}{{}X{}}</
:?*:xroot::<mathExpression>{#}root{{}X{}}{{}X{}}</

^+a::
Send ^c 
sleep 250
string := Clipboard 
expression := "<mathExpression>" . string . "</mathExpression>"
Clipboard := expression
;Send ^v 
return 

;-----------------------------------EOH-------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-----------------------------------EOH-------------------------------------------------------------------------------------------------------------
;END_OF_HEADER

::xhello::
(
Hello Everyone!
)

