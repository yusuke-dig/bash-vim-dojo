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

# Task 1: xargs -n 1 で1行ずつ出力
task1=$(echo "$output" | grep -A 5 "Task 1" | grep -v "Task 1" | grep -v "^--" | grep -v '^$' | head -3)
expected1="apple
banana
cherry"
check "Task 1: xargs -n 1 で1行ずつ出力" "$expected1" "$task1"

# Task 2: xargs -I {} で "Animal: xxx" 形式
task2=$(echo "$output" | grep -A 5 "Task 2" | grep -v "Task 2" | grep -v "^--" | grep "Animal:" | head -3)
expected2="Animal: cat
Animal: dog
Animal: bird"
check "Task 2: xargs -I {} で Animal: xxx 形式" "$expected2" "$task2"

# Task 3: find + xargs で "Script: " 形式
task3=$(echo "$output" | grep -A 10 "Task 3" | grep -v "Task 3" | grep -v "^--" | grep "Script:" | wc -l | tr -d ' ')
if [ "$task3" -ge 1 ]; then
  echo "PASSED: Task 3: find + xargs で Script: 形式"
  PASS=$((PASS + 1))
else
  echo "FAILED: Task 3: find + xargs で Script: 形式 (Script: を含む行が見つかりません)"
  FAIL=$((FAIL + 1))
fi

# Task 4: xargs grep で ok を含む行を検索
task4=$(echo "$output" | grep -A 10 "Task 4" | grep -v "Task 4" | grep -v "^--" | grep "ok" | wc -l | tr -d ' ')
if [ "$task4" -ge 2 ]; then
  echo "PASSED: Task 4: xargs grep で ok 行を検索"
  PASS=$((PASS + 1))
else
  echo "FAILED: Task 4: xargs grep で ok 行を検索 (ok を含む行が2行以上必要)"
  FAIL=$((FAIL + 1))
fi

# Task 5: [FOUND] 形式で出力
task5=$(echo "$output" | grep -A 10 "Task 5" | grep -v "Task 5" | grep -v "^--" | grep "\[FOUND\]" | head -2)
expected5="[FOUND] status: ok
[FOUND] result: ok"
check "Task 5: [FOUND] 形式で出力" "$expected5" "$task5"

echo ""
echo "=============================="
echo "Result: $PASS/$((PASS + FAIL)) passed"
echo "=============================="
