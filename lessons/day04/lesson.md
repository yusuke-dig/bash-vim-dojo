# Day 04: Vim置換（:s/old/new/g） × Bashのwhile文・read

## 今日のゴール（15分で達成）

- Vimで `:s` コマンドを使って行・ファイル全体の文字列を置換できる
- Bashの `while` 文でループを書ける
- `read` で標準入力から1行ずつ受け取れる
- whileループのスクリプト内の変数名を `:s` で一括リネームできる

## Vim チートシート（今日覚える4コマンド）

| コマンド | 動作 |
|---------|------|
| `:s/old/new/` | 現在行の最初の `old` を `new` に置換 |
| `:s/old/new/g` | 現在行の `old` をすべて置換（`g` = global） |
| `:%s/old/new/g` | ファイル全体の `old` をすべて置換 |
| `:%s/old/new/gc` | ファイル全体を1件ずつ確認しながら置換（`c` = confirm） |

### 補足
- `:s` は「substitute（置換）」の略
- `%` は「ファイル全体」を意味する範囲指定
- `c` フラグで確認プロンプト: `y`=置換 / `n`=スキップ / `a`=全部 / `q`=中止
- 正規表現が使える: `:%s/foo\d/bar/g` で `foo1` `foo2` なども一括置換

### よくある操作パターン
```
# 変数名 "tmp" を "result" に一括変更 → :%s/tmp/result/g
# 変更前に確認したい           → :%s/tmp/result/gc
# 現在行だけ変える             → :s/old/new/g
```

## Bash チートシート（今日覚える3構文）

### while文の基本構造
```bash
while [ 条件 ]; do
  # 条件が真の間くり返す
done
```

### カウンタで回す
```bash
i=1
while [ $i -le 5 ]; do
  echo "$i"
  i=$((i + 1))
done
```

### read で標準入力を1行ずつ処理
```bash
# ヒアドキュメントから読む
while read line; do
  echo "行: $line"
done <<EOF
apple
banana
cherry
EOF
```

### パイプで渡す
```bash
echo -e "foo\nbar\nbaz" | while read line; do
  echo "got: $line"
done
```

### 注意点
- `while read line` のループは **入力が尽きたときに終了**する（EOF検出）
- カウンタを自分でインクリメントし忘れると無限ループになる（`Ctrl-C` で中断）
- `i=$((i + 1))` は算術展開。`i++` は Bash では `((i++))` と書く

## 組み合わせポイント（なぜ一緒に学ぶか）

whileループのスクリプトを書くとき、途中で変数名を変えたくなることがよくある。
`for` と違いカウンタ変数を自分で管理するので、同じ変数名が `while [ $i -le N ]` `i=$((i+1))` `echo $i` と散在する。

こういうときに `:%s/old/new/g` で一括置換すると：
- 変え忘れ・見落としがゼロ
- 検索して手動で書き直すより圧倒的に速い
- `gc` フラグで1件ずつ確認すれば、意図しない置換を防げる

「変数をリネームしたい → `:%s` を使う」がVim上でのリファクタリングの基本パターン。

## 演習の進め方

1. `vim exercise.sh` で演習ファイルを開く
2. `# Task N:` コメントへ `/Task` で検索ジャンプ（Day 03 の復習！）
3. `# YOUR CODE HERE` を書き換えて演習を完成させる
4. Review セクションは `# Review N:` で区切られている
5. 完了したら `bash test.sh` で採点する

## 振り返り演習

exercise.sh の後半（Review 1〜3）で以下を手を動かして確認する：

- **Review 1**: `while` + カウンタで `1 2 3` を出力（`for` との書き換え練習）
- **Review 2**: `read` + `while` でリストを処理し、各行に接頭辞をつける
- **Review 3**: カウンタを2ずつ増やして偶数列を出力（`seq` を使わずに）
