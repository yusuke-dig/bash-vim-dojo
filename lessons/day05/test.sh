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

# Task 1: Hello, World!
task1=$(echo "$output" | grep -A 1 "=== Task 1 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 1: greet" "Hello, World!" "$task1"

# Task 2: Hello, Alice!
task2=$(echo "$output" | grep -A 1 "=== Task 2 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 2: hello 引数" "Hello, Alice!" "$task2"

# Task 3: Result: 7
task3=$(echo "$output" | grep -A 1 "=== Task 3 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 3: calc local変数" "Result: 7" "$task3"

# Task 4: Good morning! / Good night!
task4=$(echo "$output" | grep -A 2 "=== Task 4 ===" | grep -v "===" | grep -v '^#' | head -2 | tr '\n' '|' | sed 's/|$//')
check "Task 4: 複数関数" "Good morning!|Good night!" "$task4"

# Task 5: 10
task5=$(echo "$output" | grep -A 1 "=== Task 5 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Task 5: 関数の戻り値" "10" "$task5"

# Review 1: Max: 8
r1=$(echo "$output" | grep -A 1 "=== Review 1 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Review 1: max 関数" "Max: 8" "$r1"

# Review 2: 1 2 3
r2=$(echo "$output" | grep -A 3 "=== Review 2 ===" | grep -v "===" | grep -v '^#' | head -3 | tr '\n' ' ' | sed 's/ $//')
check "Review 2: count_up 関数" "1 2 3" "$r2"

# Review 3: HELLO, BOB!
r3=$(echo "$output" | grep -A 1 "=== Review 3 ===" | grep -v "===" | grep -v '^#' | head -1)
check "Review 3: greet_upper" "HELLO, BOB!" "$r3"

echo ""
echo "Result: $PASS/$((PASS + FAIL)) passed"
