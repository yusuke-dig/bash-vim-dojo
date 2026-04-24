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

# Task 1: 1〜5
task1=$(echo "$output" | grep -A 5 "=== Task 1 ===" | grep -v '^#' | grep -v "===" | head -5 | tr '\n' ' ' | sed 's/ $//')
check "Task 1: while 1〜5" "1 2 3 4 5" "$task1"

# Task 2: 10〜7 カウントダウン
task2=$(echo "$output" | grep -A 4 "=== Task 2 ===" | grep -v '^#' | grep -v "===" | head -4 | tr '\n' ' ' | sed 's/ $//')
check "Task 2: while カウントダウン" "10 9 8 7" "$task2"

# Task 3: fruit: <name>
task3=$(echo "$output" | grep -A 3 "=== Task 3 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' '|' | sed 's/|$//')
check "Task 3: read fruit" "fruit: apple|fruit: banana|fruit: cherry" "$task3"

# Task 4: 2倍
task4=$(echo "$output" | grep -A 3 "=== Task 4 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' ' ' | sed 's/ $//')
check "Task 4: 2倍" "4 10 6" "$task4"

# Task 5: Round N: start
task5=$(echo "$output" | grep -A 3 "=== Task 5 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' '|' | sed 's/|$//')
check "Task 5: Round N: start" "Round 1: start|Round 2: start|Round 3: start" "$task5"

# Review 1: 1 2 3
r1=$(echo "$output" | grep -A 3 "=== Review 1 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' ' ' | sed 's/ $//')
check "Review 1: while で 1 2 3" "1 2 3" "$r1"

# Review 2: >> prefix
r2=$(echo "$output" | grep -A 3 "=== Review 2 ===" | grep -v '^#' | grep -v "===" | head -3 | tr '\n' '|' | sed 's/|$//')
check "Review 2: >> 接頭辞" ">> foo|>> bar|>> baz" "$r2"

# Review 3: 0 2 4 6 8
r3=$(echo "$output" | grep -A 5 "=== Review 3 ===" | grep -v '^#' | grep -v "===" | head -5 | tr '\n' ' ' | sed 's/ $//')
check "Review 3: while 偶数列" "0 2 4 6 8" "$r3"

echo ""
echo "Result: $PASS/$((PASS + FAIL)) passed"
