#!/usr/bin/env bash
# Day 21: 終了コードとエラーハンドリング
# Vim で開いて、# YOUR CODE HERE の箇所に答えを書いてください
# 保存後: bash test.sh で採点

# ============================
# Task 1: $? で終了コードを格納する
# ============================
# 存在しないパスに ls を実行して、終了コードを exit_code 変数に格納してください
# ヒント: ls /no_such_path_xyz 2>/dev/null の後、exit_code=$? と書く

# YOUR CODE HERE
ls /no_such_path_xyz 2>dev/null; exit_code=$?

# ============================
# Task 2: check_file 関数を定義する
# ============================
# 引数のファイルが存在すれば return 0、なければ return 1 を返す関数を定義してください
# ヒント: [ -f "$1" ] でファイルの存在を確認する

check_file() {
    # YOUR CODE HERE
    if [ -f "$1" ]; then
      return 0
    else
      return 1
    fi
}


# ============================
# Task 3: safe_mkdir 関数を定義する
# ============================
# 引数のディレクトリを作成し、失敗したら "作成失敗: $1" を出力して return 1 する関数を定義してください
# ヒント: mkdir "$1" 後に local code=$? で保存し、0 以外なら echo "作成失敗: $1" → return 1

safe_mkdir() {
    # YOUR CODE HERE
    mkdir "$1"; local code=$?
    [ $code -ne 0 ] && echo "作成失敗: $1" && return 1
}


# ============================
# Task 4: run_with_check 関数を定義する
# ============================
# 引数のコマンドを実行し、失敗したら "コマンド失敗 (終了コード: X)" を出力して return 1 する関数を定義してください
# ヒント: "$@" 実行後に local code=$? で保存し、0 以外なら echo "コマンド失敗 (終了コード: $code)" → return 1

run_with_check() {
    # YOUR CODE HERE
    "$@"
    local code=$?
    if [ $code -ne 0 ]; then
      echo "コマンド失敗 (終了コード: $code)" && return 1
    else
      return 0
    fi
}


# ============================
# Task 5: get_exit_code 関数を定義する
# ============================
# 引数のコマンドを実行し、その終了コードを echo で出力する関数を定義してください
# ヒント: "$@" を実行して local code=$? に保存し、echo "$code"

get_exit_code() {
    # YOUR CODE HERE
    "$@"
    local code=$?
    echo "$code"
}
