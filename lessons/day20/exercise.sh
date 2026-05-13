#!/bin/bash
# Day 20: 復習Day × Phase 2 総合演習
#
# Vimで開いて編集する: vim lessons/day20/exercise.sh
# Vimの中で実行する:   :!bash exercise.sh
# 採点:                bash lessons/day20/test.sh

cd "$(dirname "$0")"

# Task 1: sed（Day 11）
# echo "Hello world" を sed で "world" を "Bash" に置換し、result_task1.txt に保存する
# ヒント: echo "Hello world" | sed 's/world/Bash/' > result_task1.txt
# YOUR CODE HERE

# Task 2: awk（Day 13）
# echo "Alice 90 Math" を awk で "Alice: 90" という形式に変換し、result_task2.txt に保存する
# ヒント: echo "Alice 90 Math" | awk '{print $1 ": " $2}' > result_task2.txt
# YOUR CODE HERE

# Task 3: xargs（Day 14）
# printf "foo\nbar\nbaz\n" をパイプして xargs -I{} で "item: {}" という形式で出力し、result_task3.txt に保存する
# ヒント: printf "foo\nbar\nbaz\n" | xargs -I{} echo "item: {}" > result_task3.txt
# YOUR CODE HERE

# Task 4: リダイレクト（Day 19）
# { echo "ok"; cat no_such_file.txt; } を実行し、エラーを 2>/dev/null で捨てて標準出力だけ result_task4.txt に保存する
# ヒント: { echo "ok"; cat no_such_file.txt; } 2>/dev/null > result_task4.txt
# YOUR CODE HERE

# Task 5: 関数（Day 17）
# to_upper() 関数を定義して引数を大文字に変換し、to_upper "hello" の結果を result_task5.txt に保存する
# ヒント: to_upper() { echo "$1" | tr '[:lower:]' '[:upper:]'; } && to_upper "hello" > result_task5.txt
# YOUR CODE HERE
