#!/bin/bash
# Day 03 演習: Vim検索（/, n, N, *） × Bashのfor文・seq
#
# 進め方:
#   vim exercise.sh で開き、/Task で各タスクへ検索移動！
#   # YOUR CODE HERE の行を書き換えて完成させる
#   採点: bash test.sh

# -------------------------------------------------------
# Task 1: 1〜5 を順番に echo するループを書く
# -------------------------------------------------------
# 期待出力:
#   1
#   2
#   3
#   4
#   5
echo "=== Task 1 ==="
for i in $(seq 1 5); do
  # YOUR CODE HERE
  echo "PLACEHOLDER_1"
done

# -------------------------------------------------------
# Task 2: フルーツリストをループして "I like <fruit>" と表示する
# -------------------------------------------------------
# 期待出力:
#   I like apple
#   I like banana
#   I like cherry
echo "=== Task 2 ==="
fruits="apple banana cherry"
for fruit in $fruits; do
  # YOUR CODE HERE
  echo "PLACEHOLDER_2"
done

# -------------------------------------------------------
# Task 3: 0 から 10 まで 2 ずつ増やして表示する（seq のステップ指定）
# -------------------------------------------------------
# 期待出力:
#   0
#   2
#   4
#   6
#   8
#   10
echo "=== Task 3 ==="
for i in $(seq 0 2 10); do
  # YOUR CODE HERE
  echo "PLACEHOLDER_3"
done

# -------------------------------------------------------
# Task 4: 1〜3 のループで "Loop N: done" と表示する
# -------------------------------------------------------
# 期待出力:
#   Loop 1: done
#   Loop 2: done
#   Loop 3: done
echo "=== Task 4 ==="
for n in $(seq 1 3); do
  # YOUR CODE HERE
  echo "PLACEHOLDER_4"
done

# -------------------------------------------------------
# Task 5: ブレース展開 {1..4} を使って "Step N" と表示する
# -------------------------------------------------------
# 期待出力:
#   Step 1
#   Step 2
#   Step 3
#   Step 4
echo "=== Task 5 ==="
for step in {1..4}; do
  # YOUR CODE HERE
  echo "PLACEHOLDER_5"
done
