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

# Task 1: show_section で "=== START ===" を出力
task1=$(echo "$output" | grep -A 3 "Task 1" | grep -v "Task 1" | grep -v "^--" | grep -v '^$' | head -1)
check "Task 1: show_section で === START === を出力" "=== START ===" "$task1"

# Task 2: sum_numbers 5 の結果が 15
task2=$(echo "$output" | grep -A 3 "Task 2" | grep -v "Task 2" | grep -v "^--" | grep -v '^$' | head -1)
check "Task 2: sum_numbers 5 の結果が 15" "15" "$task2"

# Task 3: log_message で "[INFO] 処理開始" を出力
task3=$(echo "$output" | grep -A 3 "Task 3" | grep -v "Task 3" | grep -v "^--" | grep -v '^$' | head -1)
check "Task 3: log_message で [INFO] 処理開始 を出力" "[INFO] 処理開始" "$task3"

# Task 4: check_file で EXISTS / MISSING を出力
task4_exists=$(echo "$output" | grep -A 5 "Task 4" | grep -v "Task 4" | grep -v "^--" | grep "EXISTS:" | head -1)
task4_missing=$(echo "$output" | grep -A 5 "Task 4" | grep -v "Task 4" | grep -v "^--" | grep "MISSING:" | head -1)
check "Task 4a: check_file EXISTS" "EXISTS: /tmp/day15_exists.txt" "$task4_exists"
check "Task 4b: check_file MISSING" "MISSING: /tmp/day15_nofile.txt" "$task4_missing"

# Task 5: main から process_items を呼び出して Processing: を出力
task5=$(echo "$output" | grep -A 6 "Task 5" | grep -v "Task 5" | grep -v "^--" | grep "Processing:" | head -3)
expected5="Processing: alpha
Processing: beta
Processing: gamma"
check "Task 5: main から process_items を呼び出す" "$expected5" "$task5"

echo ""
echo "=============================="
echo "Result: $PASS/$((PASS + FAIL)) passed"
echo "=============================="
