#!/bin/bash
# Day 06 演習: Vimビジュアルモード（v, V, Ctrl-v） × Bash配列
#
# 進め方:
#   vim exercise.sh で開き、/Task で各タスクへ検索移動！
#   V で行選択、Ctrl-v で矩形選択を試しながら編集しよう
#   # YOUR CODE HERE の行を書き換えて完成させる
#   採点: bash test.sh

# -------------------------------------------------------
# Task 1: colors 配列の 2番目の要素を表示する
# -------------------------------------------------------
# 期待出力: green
echo "=== Task 1 ==="
colors=(red green blue)
# YOUR CODE HERE
echo ${colors[1]}

# -------------------------------------------------------
# Task 2: fruits 配列の全要素を1行ずつ表示する
# -------------------------------------------------------
# 配列: (apple banana cherry)
# 期待出力:
#   apple
#   banana
#   cherry
echo "=== Task 2 ==="
fruits=(apple banana cherry)
# YOUR CODE HERE: for ループで回す
for fruit in "${fruits[@]}"; do
  echo "${fruit}"
done

# -------------------------------------------------------
# Task 3: nums 配列の要素数を表示する
# -------------------------------------------------------
# 配列: (10 20 30 40 50)
# 期待出力: 5
echo "=== Task 3 ==="
nums=(10 20 30 40 50)
# YOUR CODE HERE
echo "${#nums[@]}"

# -------------------------------------------------------
# Task 4: pets 配列に bird を追加して全要素をスペース区切りで表示する
# -------------------------------------------------------
# 初期配列: (cat dog)
# 期待出力: cat dog bird
echo "=== Task 4 ==="
pets=(cat dog)
# YOUR CODE HERE: pets+=(...) で追加してから echo "${pets[@]}"
pets+=("bird")
echo "${pets[@]}"

# -------------------------------------------------------
# Task 5: scores 配列から 70 以上の要素だけを1行ずつ表示する
# -------------------------------------------------------
# 配列: (85 42 90 60 78)
# 期待出力:
#   85
#   90
#   78
echo "=== Task 5 ==="
scores=(85 42 90 60 78)
# YOUR CODE HERE: for ループ + if で条件判定
for score in "${scores[@]}" ; do
  if [ ${score} -ge 70 ]; then
     echo "${score}"
  fi
done 
