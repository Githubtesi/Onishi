⌨️ 大西配列 / QWERTY 配列 切り替え AutoHotkey マクロ

AutoHotkey を使って
大西配列（大西キー） と QWERTY 配列 を
Ctrl + Alt + Space でワンタッチ切り替えできる Windows 用マクロです。

👉 AutoHotkey v2.0.19 で動作確認済み

🚀 Features
配列切り替え（トグル）
Key	Action
Ctrl + Alt + Space	大西配列 ⇔ QWERTY 配列 切り替え
大西配列時のみ有効な拡張キー

※ 大西配列が有効な場合のみ 動作します。

Key	Result
変換 + Space	Enter
無変換 + Space	Backspace

QWERTY 配列時は Space キーは通常動作になります。

🖥️ Environment

OS: Windows 10 / 11

AutoHotkey: v2.0.19

❌ AutoHotkey v1.x 非対応

📦 Installation

AutoHotkey v2 をインストール
https://www.autohotkey.com/

本リポジトリを clone または zip ダウンロード

git clone https://github.com/yourname/onishi-qwerty-ahk.git


.ahk ファイルをダブルクリックして実行

起動するとタスクトレイに AutoHotkey のアイコンが表示されます。

🔁 Auto Start（任意）

Windows 起動時に自動実行したい場合：

.ahk ファイルのショートカットを作成

以下のフォルダに配置

C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

⚠️ Notes / Known Issues

IME の種類や設定によって
変換 / 無変換キー の認識が異なる場合があります

以下のツールと併用すると競合する可能性があります

PowerToys

Karabiner

その他キーマップ変更ツール

管理者権限アプリ・一部ゲームでは動作しない場合があります

🛠 Customization

以下はスクリプト内で調整可能です。

大西配列のキー割り当て変更

配列切り替えショートカット

変換 / 無変換 + Space オプションの有効 / 無効

詳細は .ahk ファイル内のコメントを参照してください。

📄 License

MIT License
（自由に改変・再配布・個人利用 / 商用利用可能）

🙏 Acknowledgements

AutoHotkey Community

大西配列ユーザーの皆さま
