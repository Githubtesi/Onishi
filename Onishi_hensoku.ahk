; 入力モードと作業ディレクトリの設定
SendMode "Input"
SetWorkingDir(A_ScriptDir)

; 初期状態: リマッピングは無効 (半角+英語入力モードとみなす)
global toggle := false

; -------------------------------------------------------------------
; 切り替え用メイン関数（一箇所にまとめました）
; -------------------------------------------------------------------
ExecuteToggle() {
    global toggle
    toggle := !toggle

    if toggle {
        ShowModernMsg("大西配列", "🈶")
    } else {
        ShowModernMsg("QWERTY配列", "🔤")
    }
}

; Alt + Ctrl + Space 切替可能
^!Space:: ExecuteToggle()

; -------------------------------------------------------------------
; q + w の同時押し設定 (75ms 判定)
; -------------------------------------------------------------------
; $ 記号は無限ループ防止、~ は修飾キーとの競合回避に役立ちますが、
; 同時押しの場合は下記のように個別に定義するのが確実です。

$q:: {
    if KeyWait("w", "D T0.075") { ; 75ms以内にwが押されたか
        SendInput "{vkF3}"
        KeyWait("w") ; 重複防止のため、wが離されるのを待つ
        Send("{Backspace}")
    } else {
        Send("q")
    }
}


;----------------------------------------
; モダン風ポップアップ表示
;----------------------------------------
ShowModernMsg(text, icon := "") {
    local g, monitorW, monitorH
    monitorW := A_ScreenWidth
    monitorH := A_ScreenHeight
    g := Gui("+AlwaysOnTop -Caption +ToolWindow")
    g.BackColor := "202020"
    g.Add("Text", "x20 y15 cWhite", icon)
    g.Add("Text", "x60 y15 w250 cWhite", text)
    g.Show("NoActivate x" monitorW - 320 " y" monitorH - 120 " AutoSize")
    Loop 10 {
        WinSetTransparent(25 * A_Index, "ahk_id " g.Hwnd)
        Sleep 20
    }
    SetTimer(() => g.Destroy(), -1500)
}

; -------------------------------------------------------------------
; ここからカスタム配列のリマッピング
; -------------------------------------------------------------------
#HotIf toggle && !(GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P"))

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