#!/bin/bash
# Day 16: Vimdiff × スクリプトのデバッグ
#
# このファイルをVimで開いて演習を進めよう。
# 採点: bash lessons/day16/test.sh

# ===================================================
# Task 1: bash -n でシンタックスチェック
# ===================================================
# correct.sh のシンタックスに問題がないことを確認し、"SYNTAX OK" と出力する
# ヒント: bash -n ファイル名 2>/dev/null && echo "SYNTAX OK"
echo "--- Task 1 ---"
# YOUR CODE HERE
bash -n correct.sh && echo "SYNTAX OK"

# ===================================================
# Task 2: source して関数を呼び出す
# ===================================================
# correct.sh を source して double_num 7 を呼び出し、結果を出力する
# ヒント: source correct.sh; double_num 7
echo "--- Task 2 ---"
# YOUR CODE HERE
source correct.sh; double_num 7

# ===================================================
# Task 3: 算術演算のバグを修正する
# ===================================================
# triple_num は引数の3倍を返すはずが、バグがある。修正してください。
# 期待値: triple_num 4 → 12
echo "--- Task 3 ---"
triple_num() {
  local n=$1
  echo $((n * 3))
}
triple_num 4

# ===================================================
# Task 4: クォート漏れのバグを修正する
# ===================================================
# file_check はファイル存在を確認する関数。バグを修正してください。
# 期待値: FOUND: /tmp/day16_check.txt
echo "--- Task 4 ---"
file_check() {
  local f=$1
  if [ -f "$f" ]; then
    echo "FOUND: $f"
  else
    echo "NOT_FOUND: $f"
  fi
}
touch /tmp/day16_check.txt
file_check "/tmp/day16_check.txt"
rm -f /tmp/day16_check.txt

# ===================================================
# Task 5: 累積代入のバグを修正する
# ===================================================
# sum_to_n は 1 から N までの合計を返すはずが、バグがある。修正してください。
# 期待値: sum_to_n 5 → 15
echo "--- Task 5 ---"
sum_to_n() {
  local max=$1
  local total=0
  for i in $(seq 1 "$max"); do
    total=$((total + i))
  done
  echo "$total"
}
sum_to_n 5
