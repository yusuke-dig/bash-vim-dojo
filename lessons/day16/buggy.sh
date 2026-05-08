#!/bin/bash
# vimdiff 練習用 — バグのあるバージョン（関数定義のみ）
# vimdiff buggy.sh correct.sh で correct.sh と比較してみよう

# 関数1: 数値を2倍にする（バグあり）
double_num() {
  local n=$1
  echo $n * 2
}

# 関数2: リストの要素を処理する（バグあり）
process_list() {
  local items=("$@")
  for item in ${items[@]}; do
    echo "Item: $item"
  done
}

# 関数3: 合計を計算する（バグあり）
calc_sum() {
  local total=0
  for num in "$@"; do
    total=$total + $num
  done
  echo "Sum: $total"
}
