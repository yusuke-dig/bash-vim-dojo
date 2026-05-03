#!/bin/bash
# Day 12: 複数ファイル操作（:e, :bn, :bp） × 複数ファイル処理
#
# Vimで開いて編集する: vim lessons/day12/exercise.sh
# Vimの中で実行する:   :!bash exercise.sh
# 採点:                bash lessons/day12/test.sh

cd "$(dirname "$0")"

# セットアップ: 3つの素材ファイルを作成
printf "apple\nbanana\ncherry\n" > source_a.txt
printf "dog\ncat\nbird\n"        > source_b.txt
printf "red\nblue\ngreen\n"      > source_c.txt

# Task 1: source_a.txt, source_b.txt, source_c.txt を cat で結合して result_task1.txt に保存する
# ヒント: cat source_a.txt source_b.txt source_c.txt > result_task1.txt
# YOUR CODE HERE
cat source_a.txt source_b.txt source_c.txt > result_task1.txt

# Task 2: for ループで source_*.txt の先頭行を result_task2.txt に追記する
# ヒント: for f in source_*.txt; do head -1 "$f" >> result_task2.txt; done
# YOUR CODE HERE
for f in source_*.txt; do
  head -1 "$f" >> result_task2.txt;
done

# Task 3: source_*.txt から "e" を含む行を grep -h で result_task3.txt に保存する
# ヒント: grep -h "e" source_*.txt > result_task3.txt
# YOUR CODE HERE
grep -h "e" source_*.txt > result_task3.txt

# Task 4: for ループで source_*.txt の行数を "ファイル名: N lines" 形式で result_task4.txt に書き出す
# ヒント: for f in source_*.txt; do count=$(wc -l < "$f" | xargs); echo "$f: $count lines"; done > result_task4.txt
# YOUR CODE HERE
for f in source_*.txt; do
  count=$(wc -l < "$f" | xargs);
  echo "$f: $count lines";
done > result_task4.txt

# Task 5: for ループで source_*.txt の末尾行を result_task5.txt に追記する
# ヒント: for f in source_*.txt; do tail -1 "$f" >> result_task5.txt; done
# YOUR CODE HERE
for f in source_*.txt; do
  tail -1 "$f" >> result_task5.txt;
done
