SendMode Input
SetWorkingDir %A_ScriptDir%



;k::n→shift
k::
    KeyWait, k, T0.2  ; 0.2秒待機して、押し続けられているか判定
    if (ErrorLevel) {  ; 長押しの場合
        SetTimer, HoldAlt, 0  ; タイマーを開始してAltを押し続ける
        KeyWait, k  ; kキーが離されるまで待機
        SetTimer, HoldAlt, Off  ; タイマーをオフにしてAltを放す
        Send {Alt Up}
    } else {  ; 短押しの場合
        SendInput n  ; 短押しのときだけ n を1度送信
    }
return




;d::a→alt
d::
    KeyWait, d, T0.2  ; 0.2秒待機して、押し続けられているか判定
    if (ErrorLevel) {  ; 長押しの場合
        SetTimer, HoldAlt, 0  ; タイマーを開始してAltを押し続ける
        KeyWait, d  ; dキーが離されるまで待機
        SetTimer, HoldAlt, Off  ; タイマーをオフにしてAltを放す
        Send {Alt Up}
    } else {  ; 短押しの場合
        SendInput a  ; 短押しのときだけ a を1度送信
    }
return

;f::o→Shift
f::
    KeyWait, f, T0.2  ; 0.2秒待機して、押し続けられているか判定
    if (ErrorLevel) {  ; 長押しの場合
        SetTimer, HoldShift, 0  ; タイマーを開始してShiftを押し続ける
        KeyWait, f  ; fキーが離されるまで待機
        SetTimer, HoldShift, Off  ; タイマーをオフにしてShiftを放す
        Send {Shift Up}
    } else {  ; 短押しの場合
        SendInput o  ; 短押しのときだけ o を1度送信
    }
return


;j::t
j::
    KeyWait, t, T0.2  ; 0.2秒待機して、押し続けられているか判定
    if (ErrorLevel) {  ; 長押しの場合
        SetTimer, HoldShift, 0  ; タイマーを開始してShiftを押し続ける
        KeyWait, j  ; jキーが離されるまで待機
        SetTimer, HoldShift, Off  ; タイマーをオフにしてShiftを放す
        Send {Shift Up}
    } else {  ; 短押しの場合
        SendInput t  ; 短押しのときだけ t を1度送信
    }
return



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
sc027::h

b::sc027
n::g
m::d
,::m
.::j
/::b



HoldShift:
    Send {Shift Down}
return

HoldAlt:
    Send {Alt Down}
return

;Keybordmanagerで設定
;スペースをエンター
;Space::Enter
;無変換をバックスペース
;IEMNonConvert::Backspace
;変換をスペース
;Convert::Space
;CapllockをCtrl