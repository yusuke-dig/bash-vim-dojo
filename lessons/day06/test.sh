#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0

check() {
  local task="$1"
  local expected="$2"
  local actual="$3"
  if [ "$actual" = "$expected" ]; then
    echo "PASSED: $task"
    PASS=$((PASS + 1))
  else
    echo "FAILED: $task"
    echo "  expected: $expected"
    echo "  actual  : $actual"
    FAIL=$((FAIL + 1))
  fi
}

output=$(bash exercise.sh 2>/dev/null)

# Task 1: green
task1=$(echo "$output" | grep -A 1 "=== Task 1 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 1: 配列インデックス" "green" "$task1"

# Task 2: apple / banana / cherry
task2=$(echo "$output" | grep -A 3 "=== Task 2 ===" | grep -v "===" | grep -v '^#' | head -3 | tr '\n' '|' | sed 's/|$//')
check "Task 2: 配列ループ" "apple|banana|cherry" "$task2"

# Task 3: 5
task3=$(echo "$output" | grep -A 1 "=== Task 3 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 3: 配列の要素数" "5" "$task3"

# Task 4: cat dog bird
task4=$(echo "$output" | grep -A 1 "=== Task 4 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 4: 配列への追加" "cat dog bird" "$task4"

# Task 5: 85 / 90 / 78
task5=$(echo "$output" | grep -A 3 "=== Task 5 ===" | grep -v "===" | grep -v '^#' | head -3 | tr '\n' '|' | sed 's/|$//')
check "Task 5: 配列フィルタ" "85|90|78" "$task5"

echo ""
echo "Result: $PASS/$((PASS + FAIL)) passed"
