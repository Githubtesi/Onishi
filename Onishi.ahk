SendMode Input
SetWorkingDir %A_ScriptDir%

; 移動関連-小さな移動
; 変換 + h⇒ ←
sc079 & h:: Send, {Left}
; 変換 + l⇒ →
sc079 & l:: Send, {Right}
; 変換 + j⇒ ↓
sc079 & j:: Send, {Down}
; 変換 + k⇒ ↑
sc079 & k:: Send, {Up}

; 移動関連-大きな移動
; 無変換 + k⇒PageUp
sc07B & j:: Send, {PgUp}
; 無変換 + j⇒PageDown
sc07B & k:: Send, {PgDn}
; 無変換 + h⇒Home
sc07B & h:: Send, {Home}
; 無変換 + l⇒End
sc07B & l:: Send, {End}

; コマンド関連
; 無変換 + d⇒Windows + d （全ウィンドウ最小化）
sc07B & d:: Send, #d
; 変換 + SPACE ⇒ Enter
sc079 & Space::Send, {Enter}


; 無変換 + 変換⇒半角/全角 （IME切り替え）
sc07B & sc079:: Send, {vkF3sc029}
; 無変換 + SPACE ⇒ Backspace
sc07B & Space::Send, {Backspace}



; 無変換 + o⇒Tab
; 無変換 + u⇒Shift + Tab
; 無変換 + >⇒Alt + Tab （タスクの切り替え）
; 無変換 + <⇒Shift + Alt + Tab （タスクの逆切り替え）
; 無変換 + @⇒Alt + F4 （アプリ終了）



; 大西キーボード

k::n
;k::n→alt
; k::
;     KeyWait, k, T0.2  ; 0.2秒待機して、押し続けられているか判定
;     if (ErrorLevel) {  ; 長押しの場合
;         SetTimer, HoldAlt, 0  ; タイマーを開始してAltを押し続ける
;         KeyWait, k  ; kキーが離されるまで待機
;         SetTimer, HoldAlt, Off  ; タイマーをオフにしてAltを放す
;         Send {Alt Up}
;     } else {  ; 短押しの場合
;         SendInput n  ; 短押しのときだけ n を1度送信
;     }
; return


d::a
; ;d::a→alt
; d::
;     KeyWait, d, T0.2  ; 0.2秒待機して、押し続けられているか判定
;     if (ErrorLevel) {  ; 長押しの場合
;         SetTimer, HoldAlt, 0  ; タイマーを開始してAltを押し続ける
;         KeyWait, d  ; dキーが離されるまで待機
;         SetTimer, HoldAlt, Off  ; タイマーをオフにしてAltを放す
;         Send {Alt Up}
;     } else {  ; 短押しの場合
;         SendInput a  ; 短押しのときだけ a を1度送信
;     }
; return

; HoldAlt:
;     Send {Alt Down}
; return

f::o
;f::o→Shift
; f::
;     KeyWait, f, T0.2  ; 0.2秒待機して、押し続けられているか判定
;     if (ErrorLevel) {  ; 長押しの場合
;         SetTimer, HoldShift, 0  ; タイマーを開始してShiftを押し続ける
;         KeyWait, f  ; fキーが離されるまで待機
;         SetTimer, HoldShift, Off  ; タイマーをオフにしてShiftを放す
;         Send {Shift Up}
;     } else {  ; 短押しの場合
;         SendInput o  ; 短押しのときだけ o を1度送信
;     }
; return

j::t
;j::t→Shift
; j::
;     KeyWait, j , T0.2  ; 0.2秒待機して、押し続けられているか判定
;     if (ErrorLevel) {  ; 長押しの場合
;         SetTimer, HoldShift, 0  ; タイマーを開始してShiftを押し続ける
;         KeyWait, j  ; jキーが離されるまで待機
;         SetTimer, HoldShift, Off  ; タイマーをオフにしてShiftを放す
;         Send {Shift Up}
;     } else {  ; 短押しの場合
;         SendInput t  ; 短押しのときだけ t を1度送信
;     }
; return

; HoldShift:
;     Send {Shift Down}
; return


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
g::-
h::k
l::s
sc027::h

b::sc027
n::g
m::d
,::m
.::j
/::b
