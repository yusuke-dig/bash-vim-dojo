# Day 20: 復習Day × Phase 2 総合演習

## 今日のゴール（15分で達成）

Day 11〜19 で学んだ Vim と Bash を1つの流れで使いこなす。
sed・awk・xargs・リダイレクト・関数モジュール化をひとまとめに復習する。

---

## Phase 2 Vim 総復習チートシート

| Day | コマンド | 動作 |
|-----|---------|------|
| 11 | `ma` / `'a` / `` `a `` | マーク設定 / 行へジャンプ / 正確な位置へジャンプ |
| 12 | `:e ファイル名` / `:bn` / `:bp` / `:ls` | バッファ操作 |
| 13 | `:tabnew` / `gt` / `gT` / `:tabclose` | タブ操作 |
| 14 | `:g/パターン/コマンド` / `:g/^#/d` | グローバルコマンド |
| 15 | `za` / `zc` / `zo` / `zR` / `zM` | 折りたたみ |
| 16 | `vimdiff file1 file2` / `]c` / `[c` | Vimdiff・差分ジャンプ |
| 17 | `Ctrl-]` / `Ctrl-t` / `:ts` | ctagsジャンプ |
| 18 | `:make` / `:copen` / `:cn` / `:cp` | Makefileターゲット実行 |
| 19 | `:set ft=yaml` / `>>` / `<<` | ファイルタイプ設定・インデント |

### よく使う組み合わせパターン

```
# マークで作業箇所を管理
ma           # 現在位置を a にマーク
'a           # a のマーク行へ戻る

# グローバルコマンドで一括処理
:g/error/d   # "error" を含む行を全削除

# Makefileをターゲット指定で実行
:make test

# YAMLのインデントを揃える
gg=G         # ファイル全体を自動インデント
```

---

## Phase 2 Bash 総復習チートシート

| Day | 構文 | 例 |
|-----|-----|----|
| 11 | `sed 's/old/new/g'` | 文字列置換 |
| 13 | `awk '{print $2}'` | フィールド抽出 |
| 13 | `awk -F: '{print $1}'` | 区切り文字指定 |
| 14 | `xargs -I{} cmd {}` | 引数を展開してコマンド実行 |
| 17 | `source lib.sh` / 関数を別ファイルに分ける | モジュール化 |
| 19 | `2>/dev/null` / `&>file` / `2>&1` | リダイレクト完全形 |

### コード例（そのまま使える）

```bash
# sed: 置換
echo "Hello world" | sed 's/world/Bash/'
# → Hello Bash

# awk: フィールド抽出（スペース区切り）
echo "Alice 90 Math" | awk '{print $1 ": " $2}'
# → Alice: 90

# awk: 区切り文字指定
echo "Alice:90:Math" | awk -F: '{print $2}'
# → 90

# xargs: -I{} で引数展開
printf "foo\nbar\nbaz\n" | xargs -I{} echo "item: {}"
# → item: foo
# → item: bar
# → item: baz

# リダイレクト: エラーを捨てて正常出力だけ保存
{ echo "ok"; cat no_such_file.txt; } 2>/dev/null > result.txt

# 関数: 引数を大文字に変換
to_upper() { echo "$1" | tr '[:lower:]' '[:upper:]'; }
to_upper "hello"
# → HELLO
```

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

## 組み合わせポイント（なぜ一緒に学ぶか）

復習Dayの今日は「Vimで書いて、Bashで確かめる」サイクルを Phase 2 の道具でやりきる日。

```
# 実際の作業フロー例
vim lessons/day20/exercise.sh   # Vimで演習ファイルを開く
  → /Task 3<Enter>              # タスク3へ検索ジャンプ
  → i でコードを書く
  → :!bash exercise.sh          # その場で実行確認
  → :%s/result/output/g         # ファイル名を一括置換
  → :w                          # 保存
bash lessons/day20/test.sh      # 採点
```

Phase 2 の集大成として、sed / awk / xargs / リダイレクト / 関数を組み合わせて使う。

---

## 演習の進め方

1. `vim lessons/day20/exercise.sh` で演習ファイルを開く
2. 各 Task を読んで `# YOUR CODE HERE` の部分を埋める
3. `:!bash exercise.sh` で動作確認（エラーが出たら `/Task` で該当箇所へ移動）
4. `bash lessons/day20/test.sh` で採点
