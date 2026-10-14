# paul

## novel-llm / 対話形式GUI（chat.html）

ローカルの Ollama（`novel-gemma`）と会話するための、HTMLファイル1枚でできたチャット画面です。インストールは要りません。

### 使い方
1. `novel-llm/chat.html` と `novel-llm/chat-gui.bat` を `%USERPROFILE%\novel-llm` にコピーする
2. `chat-gui.bat` をダブルクリックする
   - Ollama が動いていなければ `OLLAMA_ORIGINS=*` を付けて起動し、ブラウザで `chat.html` を開きます
   - Ollama を起動済みなら `chat.html` を直接開くだけでも使えます

### 機能
- 返答を1文字ずつ表示（ストリーミング）。「停止」ボタンか Esc で止められます
- 会話は複数保存でき、左の一覧から切り替えられます（ブラウザの localStorage に保存）
- **フォルダへの自動保存**（Chrome / Edge）：左下の「保存フォルダを選ぶ」でフォルダを指定すると、返答が終わるたび・編集するたびに会話を `タイトル_ID.json`（任意で `.txt` も）として自動で書き込みます。「フォルダから復元」で読み戻せます
- 各発言に「編集」「削除」「再生成」「続きを書く」「ここから再送」
- 会話ごとにシステムプロンプト（キャラクター・文体・世界観など）を設定できます
- temperature / top_p / top_k / repeat_penalty / num_ctx / num_predict を画面で変更できます（初期値は Modelfile と同じ）
- コンテキストの使用量を表示し、上限に近づくと警告します
- JSON での書き出し・読み込み、表示中の会話の TXT 保存
- Enter で送信と Ctrl+Enter で送信の切り替え（日本語の変換確定中の Enter では送信しません）
- ライト／ダークのテーマ
