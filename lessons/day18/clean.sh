#!/bin/bash
# clean.sh — shellcheck エラーなしのクリーンなファイル

greet() {
  local name="$1"
  echo "Hello, ${name}!"
}

greet "World"
