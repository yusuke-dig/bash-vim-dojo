# Day 18: quickfix・:make × シェルスクリプトのlint（shellcheck）

## 今日のゴール（15分で達成）

- `:make` に shellcheck を設定してVim内からlintを実行できる
- quickfixウィンドウでエラー一覧を管理し、`:cnext` でエラー箇所へジャンプできる
- shellcheck が指摘する代表的な3パターンのバグを修正できる

---

## Vim チートシート（今日覚える6コマンド）

| コマンド | 動作 |
|---------|------|
| `:set makeprg=shellcheck\ %` | makeプログラムをshellcheckに設定（`%`は現在ファイル） |
| `:make` | makeprg を実行してエラーをquickfixに収集 |
| `:copen` | quickfixウィンドウを開く |
| `:cclose` | quickfixウィンドウを閉じる |
| `:cnext` / `:cn` | 次のエラーへジャンプ |
| `:cprev` / `:cp` | 前のエラーへジャンプ |

### Vim での使い方（流れ）

```
1. vim lint_target.sh でファイルを開く
2. :set makeprg=shellcheck\ %   ← makeprg を設定
3. :make                         ← shellcheck を実行
4. :copen                        ← quickfixウィンドウを表示
5. Enter                         ← カーソル行のエラー箇所へジャンプ
6. エラーを修正して :w
7. :make で再チェック → エラーが減っていることを確認
```

quickfixウィンドウでは `Enter` を押すとエラー行へジャンプ、`:cclose` でウィンドウを閉じられる。

---

## Vim 基本操作リファレンス（毎日掲載）

| カテゴリ | コマンド | 動作 |
|---------|---------|------|
| 移動 | `gg` | ファイル先頭へ |
| 移動 | `G` | ファイル末尾へ |
| 移動 | `0` / `$` | 行頭 / 行末へ |
| 移動 | `w` / `b` | 次の単語 / 前の単語へ |
| 移動 | `Ctrl-u` / `Ctrl-d` | 半ページ上 / 下スクロール |
| 編集 | `u` | アンドゥ |
| 編集 | `Ctrl-r` | リドゥ |
| 編集 | `dd` | 行を切り取り |
| 編集 | `yy` | 行をヤンク（コピー） |
| 編集 | `p` | 貼り付け |
| 編集 | `x` | カーソル位置の文字を削除 |
| モード | `i` | カーソル前に挿入 |
| モード | `a` | カーソル後に挿入 |
| モード | `Esc` | ノーマルモードに戻る |
| 検索 | `/パターン` | 前方検索 |
| 検索 | `n` / `N` | 次 / 前の一致へ |
| ファイル | `:w` | 保存 |
| ファイル | `:q` | 終了（`:wq` で保存して終了） |
| ファイル | `:e ファイル名` | 別ファイルを開く |

---

## Bash チートシート（今日覚える4コマンド）

| コマンド | 動作 |
|---------|------|
| `shellcheck script.sh` | スクリプトをlintして警告を表示 |
| `shellcheck -S warning script.sh` | warning以上のみ表示 |
| `shellcheck -e SC2086 script.sh` | 特定のルールを除外 |
| `shellcheck --version` | バージョン確認 |

### shellcheck の代表的な警告

| コード | 内容 | 悪い例 | 良い例 |
|-------|------|-------|-------|
| SC2086 | 変数のクォート漏れ | `echo $var` | `echo "$var"` |
| SC2006 | バッククォートの使用 | `` `cmd` `` | `$(cmd)` |
| SC2068 | 配列展開のクォート漏れ | `${arr[@]}` | `"${arr[@]}"` |
| SC2155 | declare と assign の同一行 | `local x=$(cmd)` | `local x; x=$(cmd)` |

---

## 組み合わせポイント（なぜ一緒に学ぶか）

```
開発フロー:
  vim script.sh で編集
  :make でshellcheck実行（エラーを自動収集）
  :copen でエラー一覧を確認
  Enter でエラー行へジャンプ
  修正 → :w → :make で再チェック
```

IDEのlint機能をVim+shellcheckで再現するイメージ。エラーの行番号を手動で探す必要がなく、`:cnext` で次のエラーに自動で飛べる。

---

## 演習の進め方

1. `vim lessons/day18/exercise.sh` で演習ファイルを開く
2. `# YOUR CODE HERE` の箇所にコードを書く（Task 1〜2）
3. バグのある関数（Task 3〜5）を修正する
4. **Vim + shellcheck 練習**:
   ```
   vim lint_target.sh
   :set makeprg=shellcheck\ %
   :make
   :copen
   ```
   quickfixウィンドウで警告を確認し、`:cnext` で移動してみよう
5. `bash lessons/day18/test.sh` で採点

---

## 今日の3つの警告パターン

**SC2086 — 変数のクォート漏れ**
```bash
# NG: スペースや特殊文字で予期しない動作
echo $var

# OK
echo "$var"
```

**SC2006 — バッククォートは $() に統一**
```bash
# NG: 入れ子が難しく可読性が低い
result=`command`

# OK
result=$(command)
```

**SC2068 — 配列展開のクォート**
```bash
# NG: スペースを含む要素が分割される
for item in ${arr[@]}; do ...

# OK
for item in "${arr[@]}"; do ...
```
