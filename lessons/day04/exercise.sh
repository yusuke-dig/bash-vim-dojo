#!/bin/bash
# Day 04 演習: Vim置換（:s/old/new/g） × Bashのwhile文・read
#
# 進め方:
#   vim exercise.sh で開き、/Task で各タスクへ検索移動！
#   # YOUR CODE HERE の行を書き換えて完成させる
#   採点: bash test.sh

# -------------------------------------------------------
# Task 1: while ループで 1〜5 を表示する
# -------------------------------------------------------
# 期待出力:
#   1
#   2
#   3
#   4
#   5
echo "=== Task 1 ==="
i=1
while [ $i -le 5 ]; do
  # YOUR CODE HERE (echo と i のインクリメントの2行)
  echo "$i"
  i=$((i + 1))
done

# -------------------------------------------------------
# Task 2: while ループで 10 からカウントダウンして 7 まで表示する
# -------------------------------------------------------
# 期待出力:
#   10
#   9
#   8
#   7
echo "=== Task 2 ==="
n=10
while [ $n -ge 7 ]; do
  # YOUR CODE HERE
  echo "$n"
  n=$((n - 1))
done

# -------------------------------------------------------
# Task 3: read で fruits リストを1行ずつ読み "fruit: <name>" と表示する
# -------------------------------------------------------
# 期待出力:
#   fruit: apple
#   fruit: banana
#   fruit: cherry
echo "=== Task 3 ==="
while read line; do
  # YOUR CODE HERE
  echo "fruit: $line"
done <<EOF
apple
banana
cherry
EOF

# -------------------------------------------------------
# Task 4: パイプで渡した3つの数字を読み、それぞれ2倍にして表示する
# -------------------------------------------------------
# 期待出力:
#   4
#   10
#   6
echo "=== Task 4 ==="
echo -e "2\n5\n3" | while read num; do
  # YOUR CODE HERE
  echo "$((num * 2))"
done

# -------------------------------------------------------
# Task 5: while ループで "Round N: start" (N=1〜3) と表示する
# -------------------------------------------------------
# 期待出力:
#   Round 1: start
#   Round 2: start
#   Round 3: start
echo "=== Task 5 ==="
r=1
while [ $r -le 3 ]; do
  # YOUR CODE HERE
  echo "Round $r: start"
  r=$((r + 1))
done

# -------------------------------------------------------
# Review 1: for の代わりに while で "1 2 3" を1行ずつ表示する
# -------------------------------------------------------
# 期待出力:
#   1
#   2
#   3
echo "=== Review 1 ==="
# YOUR CODE HERE (while ループを自分で書く)
i=1
while [ $i -le 3 ]; do
  echo "$i"
  i=$((i + 1))
done

# -------------------------------------------------------
# Review 2: read + while でリストを読み、各行の先頭に ">> " をつけて表示する
# -------------------------------------------------------
# 期待出力:
#   >> foo
#   >> bar
#   >> baz
echo "=== Review 2 ==="
while read line; do
  # YOUR CODE HERE
  echo ">> $line"
done <<EOF
foo
bar
baz
EOF

# -------------------------------------------------------
# Review 3: while + カウンタで 0 2 4 6 8 を表示する（seq は使わない）
# -------------------------------------------------------
# 期待出力:
#   0
#   2
#   4
#   6
#   8
echo "=== Review 3 ==="
# YOUR CODE HERE (while ループを自分で書く)
i=0
while [ $i -le 8 ]; do
  echo "$i"
  i=$((i + 2))
done
