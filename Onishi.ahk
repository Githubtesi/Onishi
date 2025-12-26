; 入力モードと作業ディレクトリの設定
SendMode "Input"
SetWorkingDir(A_ScriptDir)

; 初期状態: リマッピングは無効 (半角+英語入力モードとみなす)
global toggle := false


; Alt + Ctrl + Space で切替
^!Space:: {
    global toggle
    toggle := !toggle

    vcurrentwindow := WinGetID("A")
    vimestate := DllCall("user32.dll\SendMessageA"
        , "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow)
        , "UInt", 0x0283
        , "Int", 0x0005
        , "Int", 0)

    SendInput "{vkF3}"

    if toggle {
        if (vimestate = 1)
            SendInput "{vkF3}"
        ShowModernMsg("日本語入力 (大西配列)", "🈶")
    } else {
        if (vimestate = 0)
            SendInput "{vkF3}"
        ShowModernMsg("英語入力 (QWERTY配列)", "🔤")
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

    ; ✅ 修正ポイント: for i in 1..10 に変更
    Loop 10
    {
        WinSetTransparent(25 * A_Index, "ahk_id " g.Hwnd)
        Sleep 20
    }

    SetTimer(() => g.Destroy(), -1500)
}


; -------------------------------------------------------------------



; ここからカスタム配列のリマッピング
; toggleが有効であり、かつCtrlまたはAltが押されていない場合にカスタム配列を適用
#HotIf toggle && !(GetKeyState("Ctrl", "P") || GetKeyState("Alt", "P"))

; 入力時のショートカット
; ホットキー定義を v2 形式に修正 ({} で囲む)
; sc079 (変換) & Space ⇒ Enter
sc079 & Space:: {
    Send("{Enter}")
}
; sc07B (無変換) & Space ⇒ Backspace
sc07B & Space:: {
    Send("{Backspace}")
}

; sc079 (変換) & j ⇒ ↓
sc079 & j:: {
    Send("{Down}")
}
; sc079 (変換) & k ⇒ ↑
sc079 & k:: {
    Send("{Up}")
}


; カスタム配列: リマッピングするキーのマップ
-::/

w::l
e::u
r::,
t::.
y::f
u::w
i::r
o::y

a::e
s::i
d::a
f::o
g::-
h::k
j::t
k::n
l::s
sc027::h ; sc027はセミコロンキー

b::sc027 ; セミコロンキーを出力
n::g
m::d
,::m
.::j
/::b

#HotIf ; ここで条件付きホットキーのブロックを終了
