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
        echo "  expected: $expected"
        echo "  actual:   $actual"
        FAIL=$((FAIL + 1))
    fi
}

# Task 1: パイプで単語数を数える
result1=$(bash exercise.sh 2>/dev/null | grep -A1 "Task 1" | tail -1 | tr -d ' ')
check "Task 1: パイプで単語数 (3)" "3" "$result1"

# Task 2: ファイルに書き出す
bash exercise.sh > /dev/null 2>&1
result2=$(cat /tmp/day07_out.txt 2>/dev/null | head -1)
check "Task 2: リダイレクトでファイル書き出し" "Hello, Bash!" "$result2"

# Task 3: 追記リダイレクト
result3_lines=$(cat /tmp/day07_out.txt 2>/dev/null | wc -l | tr -d ' ')
result3_last=$(cat /tmp/day07_out.txt 2>/dev/null | tail -1)
check "Task 3: 追記後に2行存在する" "2" "$result3_lines"
check "Task 3: 追記内容が正しい" "Hello, Vim!" "$result3_last"

# Task 4: sortで並び替え
result4=$(bash exercise.sh 2>/dev/null | grep -A3 "Task 4" | grep -v "^--" | grep -v "Task 4" | head -1)
check "Task 4: sort結果の1行目" "Hello, Bash!" "$result4"

# Task 5: seq+grep
result5=$(bash exercise.sh 2>/dev/null | grep -A2 "Task 5" | grep -v "^--" | grep -v "Task 5" | head -1 | tr -d ' ')
check "Task 5: seq|grepで3を表示" "3" "$result5"

echo ""
echo "Result: $PASS/$((PASS + FAIL)) passed"
