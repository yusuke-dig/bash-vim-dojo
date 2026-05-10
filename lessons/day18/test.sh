#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0

check() {
  local desc="$1"
  local expected="$2"
  local actual="$3"
  if [ "$actual" = "$expected" ]; then
    echo "PASSED: $desc"
    PASS=$((PASS + 1))
  else
    echo "FAILED: $desc"
    echo "  expected: $(echo "$expected" | head -3)"
    echo "  actual  : $(echo "$actual" | head -3)"
    FAIL=$((FAIL + 1))
  fi
}

output=$(bash exercise.sh 2>/dev/null)

section() {
  local from="$1"
  local to="$2"
  echo "$output" | sed -n "/--- ${from} ---/,/--- ${to} ---/p" \
    | grep -v "^---" | grep -v '^$' | head -5
}

# Task 1: shellcheck --version で "version:" を含む行を出力
task1=$(section "Task 1" "Task 2" | grep "version" | head -1)
if echo "$task1" | grep -q "version"; then
  echo "PASSED: Task 1: shellcheck のバージョンを確認"
  PASS=$((PASS + 1))
else
  echo "FAILED: Task 1: shellcheck のバージョンを確認"
  echo "  expected: version: x.x.x を含む行"
  echo "  actual  : $task1"
  FAIL=$((FAIL + 1))
fi

# Task 2: lint_target.sh の警告数が 3 以上
task2=$(section "Task 2" "Task 3" | head -1)
if [ "$task2" -ge 3 ] 2>/dev/null; then
  echo "PASSED: Task 2: lint_target.sh の警告数が 3 以上 (${task2}件)"
  PASS=$((PASS + 1))
else
  echo "FAILED: Task 2: lint_target.sh の警告数を確認"
  echo "  expected: 3 以上の数値"
  echo "  actual  : $task2"
  FAIL=$((FAIL + 1))
fi

# Task 3: スペースを含む文字列をそのまま echo
task3=$(section "Task 3" "Task 4" | head -1)
check "Task 3: スペースを保持して echo" "  spaces   here  " "$task3"

# Task 4: バッククォートが $() に変換されているか確認（ソース検査）
if ! grep -v '^#' exercise.sh | grep -q '`'; then
  echo "PASSED: Task 4: バッククォートを \$() に変換"
  PASS=$((PASS + 1))
else
  echo "FAILED: Task 4: exercise.sh にまだバッククォートが含まれています"
  FAIL=$((FAIL + 1))
fi

# Task 5: 配列要素数が 3
task5=$(echo "$output" | sed -n "/--- Task 5 ---/,\$p" | grep -v "^---" | grep -v '^$' | head -1)
check "Task 5: 配列要素数が 3" "3" "$task5"

echo ""
echo "=============================="
echo "Result: $PASS/$((PASS + FAIL)) passed"
echo "=============================="
