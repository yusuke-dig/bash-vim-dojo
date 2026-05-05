#!/bin/bash
# Day 13: タブ（:tabnew, gt） × awk基礎
#
# Vimで開いて編集する: vim lessons/day13/exercise.sh
# データファイルを別タブで開く: :tabnew lessons/day13/data.txt
# タブを切り替える: gt / gT
# Vimの中で実行する:   :!bash exercise.sh
# 採点:                bash lessons/day13/test.sh

cd "$(dirname "$0")"

# セットアップ: データファイルを作成
cat > data.txt << 'EOF'
Alice 85 Tokyo
Bob 62 Osaka
Carol 91 Tokyo
Dave 47 Nagoya
Eve 78 Osaka
EOF

# Task 1: awk で data.txt から名前（$1）だけを抽出して result_task1.txt に保存する
# ヒント: awk '{print $1}' data.txt > result_task1.txt
# YOUR CODE HERE

# Task 2: awk で点数（$2）が70以上の行全体を result_task2.txt に保存する
# ヒント: awk '$2 >= 70' data.txt > result_task2.txt
# YOUR CODE HERE

# Task 3: awk で点数（$2）の合計を result_task3.txt に保存する
# ヒント: awk '{sum += $2} END {print sum}' data.txt > result_task3.txt
# YOUR CODE HERE

# Task 4: awk で "名前: 点数" 形式に整形して result_task4.txt に保存する
# ヒント: awk '{print $1": "$2}' data.txt > result_task4.txt
# YOUR CODE HERE

# Task 5: awk で都市（$3）が "Tokyo" の行の名前（$1）を result_task5.txt に保存する
# ヒント: awk '$3 == "Tokyo" {print $1}' data.txt > result_task5.txt
# YOUR CODE HERE
