#!/bin/bash
# Day 09: :! でシェル実行 × Bashファイル操作（cp, mv, find）
#
# Vimで開いて編集する: vim lessons/day09/exercise.sh
# Vimの中で実行する:   :!bash exercise.sh
# 採点:                bash lessons/day09/test.sh

# ===== セットアップ =====
cd "$(dirname "$0")"
mkdir -p work
echo "hello" > work/original.txt

# Task 1: original.txt を backup.txt としてコピーする
# ヒント: cp を使う。例 → cp work/original.txt work/backup.txt
# YOUR CODE HERE
cp work/original.txt work/backup.txt

# Task 2: backup.txt を renamed.txt にリネーム（移動）する
# ヒント: mv を使う。例 → mv work/backup.txt work/renamed.txt
# YOUR CODE HERE
mv work/backup.txt work/renamed.txt

# Task 3: work/ ディレクトリ以下の .txt ファイルを検索して result_find.txt に保存する
# ヒント: find work -name "*.txt" > result_find.txt
# YOUR CODE HERE
find work -name "*.txt" > result_find.txt

# Task 4: work/ ディレクトリ以下の .txt ファイルの数を数えて result_count.txt に保存する
# ヒント: find work -name "*.txt" | wc -l > result_count.txt
# YOUR CODE HERE
find work -name "*.txt" | wc -l > result_count.txt

# Task 5: original.txt の内容（"hello"）を大文字に変換して result_upper.txt に保存する
# ヒント: tr a-z A-Z を使う。例 → cat work/original.txt | tr a-z A-Z > result_upper.txt
# YOUR CODE HERE
cat work/original.txt | tr a-z A-Z > result_upper.txt
