#!/bin/bash
# lib.sh — 関数ライブラリ
# exercise.sh から source lib.sh で読み込まれる

# to_upper: 引数の文字列を大文字に変換して echo する
# 例: to_upper "bash" → "BASH"
# ヒント: echo "$1" | tr '[:lower:]' '[:upper:]' を使う
# YOUR CODE HERE

function to_upper() {
  echo "$1" | tr '[:lower:]' '[:upper:]'
}
