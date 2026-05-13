#!/bin/bash
# Day 20 採点スクリプト

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0

check() {
    local desc="$1"
    local result="$2"
    if [ "$result" = "ok" ]; then
        echo "  PASSED: $desc"
        PASS=$((PASS + 1))
    else
        echo "  FAILED: $desc"
        FAIL=$((FAIL + 1))
    fi
}

echo "=== Day 20 テスト ==="

# セットアップ: クリーンな状態で実行
rm -f result_task1.txt result_task2.txt result_task3.txt result_task4.txt result_task5.txt
bash exercise.sh > /dev/null 2>&1

# Task 1: result_task1.txt に "Hello Bash" が含まれるか
if [ -f "result_task1.txt" ] && grep -q "Hello Bash" result_task1.txt; then
    check "Task 1: sed で world を Bash に置換して result_task1.txt に保存" "ok"
else
    check "Task 1: sed で world を Bash に置換して result_task1.txt に保存" "fail"
fi

# Task 2: result_task2.txt に "Alice: 90" が含まれるか
if [ -f "result_task2.txt" ] && grep -q "Alice: 90" result_task2.txt; then
    check "Task 2: awk で \"Alice: 90\" 形式に変換して result_task2.txt に保存" "ok"
else
    check "Task 2: awk で \"Alice: 90\" 形式に変換して result_task2.txt に保存" "fail"
fi

# Task 3: result_task3.txt に "item: foo" "item: bar" "item: baz" が含まれるか
if [ -f "result_task3.txt" ] \
    && grep -q "item: foo" result_task3.txt \
    && grep -q "item: bar" result_task3.txt \
    && grep -q "item: baz" result_task3.txt; then
    check "Task 3: xargs -I{} で \"item: {}\" 形式に展開して result_task3.txt に保存" "ok"
else
    check "Task 3: xargs -I{} で \"item: {}\" 形式に展開して result_task3.txt に保存" "fail"
fi

# Task 4: result_task4.txt に "ok" が含まれ、エラーメッセージが含まれないか
if [ -f "result_task4.txt" ] \
    && grep -q "ok" result_task4.txt \
    && ! grep -q "No such" result_task4.txt; then
    check "Task 4: エラーを 2>/dev/null で捨てて \"ok\" だけ result_task4.txt に保存" "ok"
else
    check "Task 4: エラーを 2>/dev/null で捨てて \"ok\" だけ result_task4.txt に保存" "fail"
fi

# Task 5: result_task5.txt に "HELLO" が含まれるか
if [ -f "result_task5.txt" ] && grep -q "HELLO" result_task5.txt; then
    check "Task 5: to_upper() 関数で \"hello\" を大文字に変換して result_task5.txt に保存" "ok"
else
    check "Task 5: to_upper() 関数で \"hello\" を大文字に変換して result_task5.txt に保存" "fail"
fi

echo ""
echo "=== 結果: $PASS/$((PASS + FAIL)) passed ==="
