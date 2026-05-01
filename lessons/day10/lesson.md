# Day 10: 復習Day × Phase 1 総合演習

## 今日のゴール（15分で達成）

Day 01〜09 で学んだ Vim と Bash を1つの流れで使いこなす。
「あのコマンドどう書くんだっけ？」をこの1ファイルで解決する。

---

## Phase 1 Vim 総復習チートシート

| Day | コマンド | 動作 |
|-----|---------|------|
| 01 | `hjkl` / `w` / `b` / `0` / `$` | 移動 |
| 02 | `i` / `a` / `x` / `dd` | 挿入・削除 |
| 03 | `/パターン` / `n` / `N` / `*` | 検索 |
| 04 | `:s/old/new/g` | 行内置換（`%s` で全体） |
| 05 | `yy` / `p` / `dd` | ヤンク・ペースト・カット |
| 06 | `v` / `V` / `Ctrl-v` | ビジュアルモード |
| 07 | `:sp` / `:vsp` / `Ctrl-w w` | ウィンドウ分割 |
| 08 | `qa` / `q` / `@a` / `@@` | マクロの記録・再生 |
| 09 | `:!コマンド` / `:r !コマンド` | シェルコマンド実行 |

### よく使う組み合わせパターン

```
# スクリプトを書きながら実行
:!bash exercise.sh

# 変数名をファイル全体で一括置換
:%s/old_var/new_var/g

# マクロで5行に同じ編集を適用
qa  → 編集 → q → 4@a

# 分割画面でスクリプトと出力を並べる
:vsp result.txt
```

---

## Phase 1 Bash 総復習チートシート

| Day | 構文 | 例 |
|-----|-----|----|
| 01 | `name="value"` / `echo "$name"` | 変数・表示 |
| 02 | `if [ 条件 ]; then ... fi` | 条件分岐 |
| 03 | `for i in $(seq 1 5); do ... done` | ループ |
| 04 | `while read line; do ... done < file` | while・read |
| 05 | `function greet() { echo "Hi $1"; }` | 関数定義 |
| 06 | `arr=("a" "b" "c")` / `${arr[@]}` | 配列 |
| 07 | `cmd1 \| cmd2` / `cmd > file` | パイプ・リダイレクト |
| 08 | `grep -E "パターン" file` | grep・正規表現 |
| 09 | `cp src dst` / `mv src dst` / `find . -name "*.sh"` | ファイル操作 |

### コード例（そのまま使える）

```bash
# 変数とif
name="Alice"
if [ "$name" = "Alice" ]; then
    echo "Hello, Alice!"
fi

# for + 配列
fruits=("apple" "banana" "cherry")
for f in "${fruits[@]}"; do
    echo "$f"
done

# 関数 + パイプ
count_lines() {
    cat "$1" | wc -l
}
count_lines exercise.sh

# grep + リダイレクト
grep -E "^[0-9]+" data.txt > numbers.txt

# find + cp
find . -name "*.txt" | xargs cp -t backup/
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

復習Dayの今日は「Vimで書いて、Bashで確かめる」という流れ自体を体で覚える日。

```
# 実際の作業フロー例
vim exercise.sh          # Vimで演習ファイルを開く
  → i でコードを書く
  → :!bash exercise.sh  # 保存せずに実行して確認
  → :%s/old/new/g       # 変数名を修正
  → :w                  # 保存
bash test.sh             # 採点
```

「書く → 実行 → 修正」のサイクルを Vim の中だけで完結させるのが Phase 1 の最終目標。

---

## 演習の進め方

1. `vim lessons/day10/exercise.sh` で演習ファイルを開く
2. 各 Task を読んで `# YOUR CODE HERE` の部分を埋める
3. `:!bash exercise.sh` で動作確認
4. `bash lessons/day10/test.sh` で採点
