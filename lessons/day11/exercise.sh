#!/bin/bash
# Day 11: Vimマーク（m, ', `） × sed基礎
#
# Vimで開いて編集する: vim lessons/day11/exercise.sh
# Vimの中で実行する:   :!bash exercise.sh
# 採点:                bash lessons/day11/test.sh

cd "$(dirname "$0")"

# セットアップ
echo "apple" > data.txt
echo "banana" >> data.txt
echo "apple pie" >> data.txt
echo "# comment line" >> data.txt
echo "cherry" >> data.txt

# Task 1: data.txt の "apple" を "orange" に置換して result_task1.txt に保存する
# ヒント: sed 's/apple/orange/g' data.txt > result_task1.txt
# YOUR CODE HERE
sed 's/apple/orange/g' data.txt > result_task1.txt

# Task 2: data.txt から "#" で始まる行を除いて result_task2.txt に保存する
# ヒント: sed '/^#/d' data.txt > result_task2.txt
# YOUR CODE HERE
sed '/^#/d' data.txt > result_task2.txt

# Task 3: data.txt の1行目だけ抽出して result_task3.txt に保存する
# ヒント: sed -n '1p' data.txt > result_task3.txt
# YOUR CODE HERE
sed -n '1p' data.txt > result_task3.txt

# Task 4: data.txt の "apple" を "grape" に、"banana" を "melon" に連続置換して result_task4.txt に保存する
# ヒント: sed -e 's/apple/grape/g' -e 's/banana/melon/g' data.txt > result_task4.txt
# YOUR CODE HERE
sed -e 's/apple/grape/g' -e 's/banana/melon/g' data.txt > result_task4.txt

# Task 5: data.txt の2〜3行目だけ抽出して result_task5.txt に保存する
# ヒント: sed -n '2,3p' data.txt > result_task5.txt
# YOUR CODE HERE
sed -n '2,3p' data.txt > result_task5.txt
