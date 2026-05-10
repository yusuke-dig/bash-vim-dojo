#!/bin/bash
# lint_target.sh — 意図的に警告を含むファイル
# このファイルに対して: shellcheck lint_target.sh

# SC2086: Double quote to prevent globbing and word splitting
show_greeting() {
  local msg="Hello World"
  echo $msg
}

# SC2006: Use $(...) notation instead of legacy backticks
get_hostname() {
  local host=`hostname`
  echo $host
}

# SC2068: Double quote array expansions to avoid re-splitting elements
list_items() {
  local items=("apple" "banana split" "cherry")
  for item in ${items[@]}; do
    echo "$item"
  done
}
