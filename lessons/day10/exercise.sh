#!/bin/bash
# Day 10: 復習Day × Phase 1 総合演習
#
# Vimで開いて編集する: vim lessons/day10/exercise.sh
# Vimの中で実行する:   :!bash exercise.sh
# 採点:                bash lessons/day10/test.sh

cd "$(dirname "$0")"

# Task 1: 変数とechoの復習（Day 01）
# greeting という変数に "Hello, Phase1!" を代入して echo で表示し、result_task1.txt に保存する
# ヒント: greeting="..." && echo "$greeting" > result_task1.txt
# YOUR CODE HERE
greeting="Hello, Phase1!" && echo "$greeting" > result_task1.txt

# Task 2: for文とif文の組み合わせ（Day 02・03）
# 1から5をループし、偶数なら "even: N"、奇数なら "odd: N" と出力して result_task2.txt に保存する
# ヒント: for i in $(seq 1 5); do if [ $((i % 2)) -eq 0 ]; then echo "even: $i"; else echo "odd: $i"; fi; done
# YOUR CODE HERE
for i in $(seq 1 5); do if [ $((i % 2)) -eq 0 ]; then echo "even: $i" >> result_task2.txt; else echo "odd: $i" >> result_task2.txt; fi; done 

# Task 3: 関数と配列の組み合わせ（Day 05・06）
# names 配列に "Alice" "Bob" "Carol" を入れ、greet() 関数で "Hello, [名前]!" と出力して result_task3.txt に保存する
# ヒント: names=("Alice" "Bob" "Carol") && greet() { echo "Hello, $1!"; } && for n in "${names[@]}"; do greet "$n"; done
# YOUR CODE HERE
names=("Alice" "Bob" "Carol") && greet() { echo "Hello, $1!" >> result_task3.txt; } && for n in "${names[@]}"; do greet "$n"; done 

# Task 4: パイプとgrepの組み合わせ（Day 07・08）
# result_task2.txt から "even" を含む行だけ抽出して result_task4.txt に保存する
# ヒント: grep "even" result_task2.txt > result_task4.txt
# YOUR CODE HERE
grep "even" result_task2.txt > result_task4.txt

# Task 5: findとファイル操作の組み合わせ（Day 09）
# work/ ディレクトリを作り、touch で work/a.sh と work/b.sh を作成する
# その後 work/ 以下の .sh ファイルの数を数えて result_task5.txt に保存する
# ヒント: mkdir -p work && touch work/a.sh work/b.sh && find work -name "*.sh" | wc -l > result_task5.txt
# YOUR CODE HERE
mkdir -p work && touch work/a.sh work/b.sh && find work -name "*.sh" | wc -l > result_task5.txt
