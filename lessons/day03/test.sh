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

# Task 1: 1〜5 の連番
task1=$(echo "$output" | grep -A 5 "=== Task 1 ===" | grep -v '^#' | grep -v "===" | head -5 | tr '\n' ' ' | sed 's/ $//')
check "Task 1: seq 1 5 ループ" "1 2 3 4 5" "$task1"

# Task 2: フルーツ
task2=$(echo "$output" | grep -A 3 "=== Task 2 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' '|' | sed 's/|$//')
check "Task 2: フルーツループ" "I like apple|I like banana|I like cherry" "$task2"

# Task 3: 0 2 4 6 8 10
task3=$(echo "$output" | grep -A 6 "=== Task 3 ===" | grep -v '^#' | grep -v "===" | head -6 | tr '\n' ' ' | sed 's/ $//')
check "Task 3: seq 0 2 10 ループ" "0 2 4 6 8 10" "$task3"

# Task 4: Loop N: done
task4=$(echo "$output" | grep -A 3 "=== Task 4 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' '|' | sed 's/|$//')
check "Task 4: Loop N: done" "Loop 1: done|Loop 2: done|Loop 3: done" "$task4"

# Task 5: Step N
task5=$(echo "$output" | grep -A 4 "=== Task 5 ===" | grep -v '^#' | grep -v "===" | head -4 | tr '\n' '|' | sed 's/|$//')
check "Task 5: ブレース展開" "Step 1|Step 2|Step 3|Step 4" "$task5"

echo ""
echo "Result: $PASS/$((PASS + FAIL)) passed"
