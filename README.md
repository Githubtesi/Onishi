# ⌨️ 大西配列 / QWERTY 配列 切り替え AutoHotkey マクロ

AutoHotkey を使って  
**大西配列（大西キー）** と **QWERTY 配列** を  
`Ctrl + Alt + Space` でワンタッチ切り替えできる Windows 用マクロです。

👉 **AutoHotkey v2.0.19 で動作確認済み**

---

## 🚀 Features

### 配列切り替え（トグル）

| Key | Action |
|---|---|
| `Ctrl + Alt + Space` | 大西配列 ⇔ QWERTY 配列 切り替え |

---

### 大西配列時のみ有効な拡張キー

※ **大西配列が有効な場合のみ** 動作します。

| Key | Result |
|---|---|
| `変換 + Space` | Enter |
| `無変換 + Space` | Backspace |
| `無変換 + j` | ↓ |
| `無変換 + k` | ↑ |

QWERTY 配列時は Space キーは通常動作になります。

---

## 🖥️ Environment

- OS: Windows 10 / 11
- AutoHotkey: **v2.0.19**
  - ❌ AutoHotkey v1.x 非対応

---

## 📦 Installation

1. AutoHotkey v2 をインストール  
   https://www.autohotkey.com/

2. 本リポジトリを clone または zip ダウンロード

```bash
git clone https://github.com/yourname/onishi-qwerty-ahk.git
```

---

## 🔁 Auto Start（任意）

Windows 起動時に自動実行したい場合：

.ahk ファイルのショートカットを作成

以下のフォルダに配置
C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

---

## 📄 License

MIT License
（自由に改変・再配布・個人利用 / 商用利用可能）

---

## 🙏 Acknowledgements

AutoHotkey Community

大西配列ユーザーの皆さま
