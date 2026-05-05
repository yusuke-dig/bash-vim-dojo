#!/bin/bash
# Day 13 採点スクリプト

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

echo "=== Day 13 テスト ==="

rm -f result_task1.txt result_task2.txt result_task3.txt result_task4.txt result_task5.txt data.txt
bash exercise.sh > /dev/null 2>&1

# Task 1: 名前5人が1行ずつ出力されているか
if [ -f "result_task1.txt" ]; then
    lines=$(wc -l < result_task1.txt | xargs)
    if [ "$lines" -eq 5 ] \
        && grep -q "^Alice$" result_task1.txt \
        && grep -q "^Bob$" result_task1.txt \
        && grep -q "^Carol$" result_task1.txt; then
        check "Task 1: 名前（\$1）を result_task1.txt に抽出（5行）" "ok"
    else
        check "Task 1: 名前（\$1）を result_task1.txt に抽出（5行）" "fail"
    fi
else
    check "Task 1: 名前（\$1）を result_task1.txt に抽出（5行）" "fail"
fi

# Task 2: 70以上の行が3行（Alice:85, Carol:91, Eve:78）あるか
if [ -f "result_task2.txt" ]; then
    lines=$(wc -l < result_task2.txt | xargs)
    if [ "$lines" -eq 3 ] \
        && grep -q "Alice" result_task2.txt \
        && grep -q "Carol" result_task2.txt \
        && grep -q "Eve" result_task2.txt; then
        check "Task 2: 点数70以上の行を result_task2.txt に保存（3行）" "ok"
    else
        check "Task 2: 点数70以上の行を result_task2.txt に保存（3行）" "fail"
    fi
else
    check "Task 2: 点数70以上の行を result_task2.txt に保存（3行）" "fail"
fi

# Task 3: 合計が 363（85+62+91+47+78）か
if [ -f "result_task3.txt" ]; then
    total=$(cat result_task3.txt | xargs)
    if [ "$total" = "363" ]; then
        check "Task 3: 点数の合計を result_task3.txt に保存（363）" "ok"
    else
        check "Task 3: 点数の合計を result_task3.txt に保存（363）" "fail"
    fi
else
    check "Task 3: 点数の合計を result_task3.txt に保存（363）" "fail"
fi

# Task 4: "Alice: 85" 形式の行が含まれるか
if [ -f "result_task4.txt" ]; then
    lines=$(wc -l < result_task4.txt | xargs)
    if [ "$lines" -eq 5 ] \
        && grep -q "Alice: 85" result_task4.txt \
        && grep -q "Bob: 62" result_task4.txt \
        && grep -q "Carol: 91" result_task4.txt; then
        check "Task 4: \"名前: 点数\" 形式で result_task4.txt に保存（5行）" "ok"
    else
        check "Task 4: \"名前: 点数\" 形式で result_task4.txt に保存（5行）" "fail"
    fi
else
    check "Task 4: \"名前: 点数\" 形式で result_task4.txt に保存（5行）" "fail"
fi

# Task 5: Tokyo の2人（Alice, Carol）が出力されているか
if [ -f "result_task5.txt" ]; then
    lines=$(wc -l < result_task5.txt | xargs)
    if [ "$lines" -eq 2 ] \
        && grep -q "^Alice$" result_task5.txt \
        && grep -q "^Carol$" result_task5.txt; then
        check "Task 5: Tokyo の名前を result_task5.txt に保存（Alice, Carol）" "ok"
    else
        check "Task 5: Tokyo の名前を result_task5.txt に保存（Alice, Carol）" "fail"
    fi
else
    check "Task 5: Tokyo の名前を result_task5.txt に保存（Alice, Carol）" "fail"
fi

echo ""
echo "=== 結果: $PASS/$((PASS + FAIL)) passed ==="
