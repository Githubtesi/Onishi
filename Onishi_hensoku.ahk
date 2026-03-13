#Requires AutoHotkey v2.0
SendMode "Input"
SetWorkingDir(A_ScriptDir)

; ホットキーの多重実行を許可し、スタックを防ぐ
#MaxThreadsPerHotkey 2

global toggle := false
global modernGui := unset ; GUIを使い回すための変数

; -------------------------------------------------------------------
; 切り替え用メイン関数
; -------------------------------------------------------------------
ExecuteToggle() {
    global toggle
    toggle := !toggle
    
    if toggle {
        ShowModernMsg("大西配列")
    } else {
        ShowModernMsg("QWERTY配列")
    }
}

^!Space:: ExecuteToggle()

; -------------------------------------------------------------------
; q + w 同時押し (vkF3 = 半角/全角)
; -------------------------------------------------------------------
; $qをホットキーにするが、wのリマップ(w::l)と干渉しないよう注意
$q:: {
    ; wが物理的に押されるのを待つ (物理的な状態 "P" を指定するのが確実)
    if KeyWait("w", "D T0.075") {
        SendInput "{vkF3}"
        KeyWait("w") ; wが物理的に離されるのを待つ
        Send("{Backspace}")
    } else {
        Send("q")
    }
}

; ----------------------------------------
; モダン風ポップアップ表示 (改善版)
; ----------------------------------------
ShowModernMsg(text, icon := "") {
    global modernGui
    
    ; 既存のGUIがあれば即座に削除して作り直す（メモリ詰まり防止）
    if IsSet(modernGui) {
        modernGui.Destroy()
    }
    
    modernGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
    modernGui.BackColor := "202020"
    modernGui.SetFont("s12 cWhite", "Segoe UI") ; フォント指定で見やすく
    
    modernGui.Add("Text", "x20 y15", icon)
    modernGui.Add("Text", "x60 y15 w250", text)
    
    monitorW := A_ScreenWidth
    monitorH := A_ScreenHeight
    
    modernGui.Show("NoActivate x" monitorW - 320 " y" monitorH - 120 " AutoSize")
    
    ; 透明度のフェードイン
    Loop 5 {
        WinSetTransparent(50 * A_Index, "ahk_id " modernGui.Hwnd)
        Sleep 10
    }
    
    ; 1.5秒後に消去するタイマー
    SetTimer(() => (IsSet(modernGui) ? modernGui.Destroy() : ""), -1500)
}

; -------------------------------------------------------------------
; カスタム配列のリマッピング
; -------------------------------------------------------------------
; 修飾キーが押されていない時のみ有効化
#HotIf toggle && !GetKeyState("Ctrl", "P") && !GetKeyState("Alt", "P")

sc079 & Space:: Send("{Enter}")
sc07B & Space:: Send("{Backspace}")

sc079 & k:: Send("{Down}")
sc079 & i:: Send("{Up}")
sc079 & j:: Send("{Left}")
sc079 & l:: Send("{Right}")

-::/
w::l
e::u
r::,
t::.
y::f
a::e
u::w
i::r
o::y
s::i
d::a
f::o
g::f
h::k
j::t
k::n
l::s
sc027::h 
b::-
n::g
m::d
,::m
.::j
/::b

#HotIf