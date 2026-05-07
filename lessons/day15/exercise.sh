#!/bin/bash
# Day 15: 折りたたみ（za, zc, zo） × 長いスクリプトの構造化
# 実行方法: bash exercise.sh
# 採点方法: bash test.sh
#
# Vimで開いたら: :set foldmethod=marker を実行すると折りたたみが使えます
# za: 開閉トグル  zc: 閉じる  zo: 開く  zM: すべて閉じる  zR: すべて開く

# {{{ Task 1: ヘッダー表示関数
# =============================================================
# show_section 関数を定義する
# 「=== SECTION_NAME ===」の形式で出力する
# 期待出力: === START ===
#
# ヒント: echo "=== $1 ===" を使う

echo "--- Task 1 ---"

show_section() {
    # YOUR CODE HERE
  echo "=== $1 ==="
}

show_section "START"
# }}}

# {{{ Task 2: 数値計算関数
# =============================================================
# sum_numbers 関数を完成させる
# 1から引数 N までの合計を計算して echo する
# 期待出力: 15 （sum_numbers 5 の場合）
#
# ヒント: for i in $(seq 1 $n); do total=$((total + i)); done を使う

echo "--- Task 2 ---"

sum_numbers() {
    local n=$1
    local total=0
    # YOUR CODE HERE
    for i in $(seq 1 $n); do
      total=$((total + i));
    done
    echo "$total"
}

sum_numbers 5
# }}}

# {{{ Task 3: ログ出力関数
# =============================================================
# log_message 関数を定義する
# 「[LEVEL] MESSAGE」の形式で出力する
# 期待出力: [INFO] 処理開始
#
# ヒント: echo "[$level] $msg" を使う

echo "--- Task 3 ---"

log_message() {
    local level=$1
    local msg=$2
    # YOUR CODE HERE
    echo "[$level] $msg"
}

log_message "INFO" "処理開始"
# }}}

# {{{ Task 4: ファイル存在チェック関数
# =============================================================
# check_file 関数を定義する
# ファイルが存在すれば "EXISTS: PATH"、存在しなければ "MISSING: PATH" を出力する
# 期待出力:
#   EXISTS: /tmp/day15_exists.txt
#   MISSING: /tmp/day15_nofile.txt
#
# ヒント: if [ -f "$path" ]; then echo "EXISTS: $path" else echo "MISSING: $path" fi を使う

echo "--- Task 4 ---"

check_file() {
    local path=$1
    # YOUR CODE HERE
    if [ -f "$path" ]; then
      echo "EXISTS: $path"
    else
      echo "MISSING: $path"
    fi
}

touch /tmp/day15_exists.txt
check_file "/tmp/day15_exists.txt"
check_file "/tmp/day15_nofile.txt"
rm -f /tmp/day15_exists.txt
# }}}

# {{{ Task 5: main 関数パターン
# =============================================================
# main 関数の中から process_items を呼び出す
# "alpha" "beta" "gamma" の3引数で呼び出してください
# 期待出力:
#   Processing: alpha
#   Processing: beta
#   Processing: gamma
#
# ヒント: process_items "alpha" "beta" "gamma" を main 関数の中に書く

echo "--- Task 5 ---"

process_items() {
    local items=("$@")
    for item in "${items[@]}"; do
        echo "Processing: $item"
    done
}

main() {
    # YOUR CODE HERE
    process_items "alpha" "beta" "gamma"
}

main
# }}}
