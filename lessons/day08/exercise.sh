#!/usr/bin/env bash
# Day 08: Vimマクロ（q, @） × Bashのgrep・正規表現
# Vimで開いて編集してください: vim lessons/day08/exercise.sh

# ===== Task 1: grep 基本 =====
# 下の fruits 配列から "an" を含む単語だけを grep で抽出し、
# 結果を result1.txt に保存してください。
# ヒント: printf "%s\n" "${fruits[@]}" | grep "an" > result1.txt

fruits=("apple" "banana" "mango" "orange" "grape" "melon")

# YOUR CODE HERE (1行で書く)
printf "%s\n" "${fruits[@]}" | grep "an" > result1.txt

# ===== Task 2: grep -v でコメント除外 =====
# この exercise.sh からコメント行（# で始まる行）を除いた行数を数えて
# 変数 non_comment_lines に代入してください。
# ヒント: non_comment_lines=$(grep -v "^#" exercise.sh | grep -v "^$" | wc -l)

# YOUR CODE HERE
non_comment_lines=$(grep -v "^#" exercise.sh | grep -v "^$" | wc -l)

# ===== Task 3: grep -n で行番号付き検索 =====
# この exercise.sh で "Task" という文字列が含まれる行を
# 行番号付きで result3.txt に保存してください。
# ヒント: grep -n "Task" exercise.sh > result3.txt

# YOUR CODE HERE
grep -n "Task" exercise.sh > result3.txt

# ===== Task 4: grep -E で複数パターン =====
# 下の words 配列から "cat" または "dog" を含む単語を抽出して
# result4.txt に保存してください。
# ヒント: printf "%s\n" "${words[@]}" | grep -E "cat|dog" > result4.txt

words=("catalog" "category" "dogma" "doctor" "catalog" "dodgeball" "catfish")

# YOUR CODE HERE
printf "%s\n" "${words[@]}" | grep -E "cat|dog" > result4.txt

# ===== Task 5: grep で正規表現 =====
# 下の data から数字3桁以上を含む行だけを抽出して
# result5.txt に保存してください。
# ヒント: echo "$data" | grep -E "[0-9]{3}" > result5.txt

data="apple: 5
banana: 120
cherry: 1500
date: 8
elderberry: 300"

# YOUR CODE HERE
echo "$data" | grep -E "[0-9]{3}" > result5.txt
