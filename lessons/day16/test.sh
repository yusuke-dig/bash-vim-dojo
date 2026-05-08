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

# Task 1: bash -n で SYNTAX OK を出力
task1=$(section "Task 1" "Task 2" | grep "SYNTAX OK" | head -1)
check "Task 1: bash -n で SYNTAX OK を出力" "SYNTAX OK" "$task1"

# Task 2: double_num 7 の結果が 14
task2=$(section "Task 2" "Task 3" | head -1)
check "Task 2: double_num 7 の結果が 14" "14" "$task2"

# Task 3: triple_num 4 の結果が 12
task3=$(section "Task 3" "Task 4" | head -1)
check "Task 3: triple_num 4 の結果が 12" "12" "$task3"

# Task 4: file_check で FOUND
task4=$(section "Task 4" "Task 5" | grep "FOUND:" | head -1)
check "Task 4: file_check で FOUND: /tmp/day16_check.txt" "FOUND: /tmp/day16_check.txt" "$task4"

# Task 5: sum_to_n 5 の結果が 15
task5=$(echo "$output" | sed -n "/--- Task 5 ---/,\$p" | grep -v "^---" | grep -v '^$' | head -1)
check "Task 5: sum_to_n 5 の結果が 15" "15" "$task5"

echo ""
echo "=============================="
echo "Result: $PASS/$((PASS + FAIL)) passed"
echo "=============================="
