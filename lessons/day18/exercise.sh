#!/bin/bash
# Day 18: quickfix・:make × シェルスクリプトのlint（shellcheck）
#
# このファイルをVimで開いて演習を進めよう。
# 採点: bash lessons/day18/test.sh

# ===================================================
# Task 1: shellcheck のバージョンを確認する
# ===================================================
# shellcheck --version の "version:" を含む行を出力する
# ヒント: shellcheck --version 2>/dev/null | grep version
echo "--- Task 1 ---"
# YOUR CODE HERE

# ===================================================
# Task 2: lint_target.sh の警告数を数える
# ===================================================
# shellcheck を実行して "^In " で始まる行の数を出力する
# ヒント: shellcheck lint_target.sh 2>&1 | grep -c "^In "
echo "--- Task 2 ---"
# YOUR CODE HERE

# ===================================================
# Task 3: SC2086 — 変数のクォートを修正する
# ===================================================
# task3_preserve はスペースを含む文字列をそのまま echo すべき。修正してください。
# 期待値: "  spaces   here  " （前後・中間のスペースをそのまま保持）
echo "--- Task 3 ---"
task3_preserve() {
  local data="  spaces   here  "
  echo $data
}
task3_preserve

# ===================================================
# Task 4: SC2006 — バッククォートを $() に変換する
# ===================================================
# task4_upper はバッククォートを使っている。$() 記法に修正してください。
# 期待値: "BASH"
echo "--- Task 4 ---"
task4_upper() {
  local result=`echo "bash" | tr '[:lower:]' '[:upper:]'`
  echo "$result"
}
task4_upper

# ===================================================
# Task 5: SC2068 — 配列展開のクォートを修正する
# ===================================================
# task5_count は配列の要素数を返すはずが、クォート漏れで誤動作する。修正してください。
# 期待値: 3（"hello world" はひとつの要素として数える）
echo "--- Task 5 ---"
task5_count() {
  local items=("hello world" "foo" "bar")
  local count=0
  for item in ${items[@]}; do
    count=$((count + 1))
  done
  echo "$count"
}
task5_count
