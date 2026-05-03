#!/bin/bash
# Day 12 採点スクリプト

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

echo "=== Day 12 テスト ==="

rm -f result_task1.txt result_task2.txt result_task3.txt result_task4.txt result_task5.txt
rm -f source_a.txt source_b.txt source_c.txt
bash exercise.sh > /dev/null 2>&1

# Task 1: 9行になっているか（3ファイル × 3行）
if [ -f "result_task1.txt" ]; then
    lines=$(wc -l < result_task1.txt | xargs)
    if [ "$lines" -eq 9 ]; then
        check "Task 1: 3ファイルを cat で結合して result_task1.txt に保存（9行）" "ok"
    else
        check "Task 1: 3ファイルを cat で結合して result_task1.txt に保存（9行）" "fail"
    fi
else
    check "Task 1: 3ファイルを cat で結合して result_task1.txt に保存（9行）" "fail"
fi

# Task 2: 3行で apple, dog, red が含まれるか
if [ -f "result_task2.txt" ]; then
    lines=$(wc -l < result_task2.txt | xargs)
    if [ "$lines" -eq 3 ] \
        && grep -q "apple" result_task2.txt \
        && grep -q "dog" result_task2.txt \
        && grep -q "red" result_task2.txt; then
        check "Task 2: 各ファイルの先頭行を result_task2.txt に追記（apple, dog, red）" "ok"
    else
        check "Task 2: 各ファイルの先頭行を result_task2.txt に追記（apple, dog, red）" "fail"
    fi
else
    check "Task 2: 各ファイルの先頭行を result_task2.txt に追記（apple, dog, red）" "fail"
fi

# Task 3: "e" を含む行が5行（apple, cherry, red, blue, green）あるか
if [ -f "result_task3.txt" ]; then
    lines=$(wc -l < result_task3.txt | xargs)
    if [ "$lines" -eq 5 ] \
        && grep -q "apple" result_task3.txt \
        && grep -q "cherry" result_task3.txt \
        && grep -q "red" result_task3.txt \
        && grep -q "blue" result_task3.txt \
        && grep -q "green" result_task3.txt; then
        check "Task 3: \"e\" を含む行を grep -h で result_task3.txt に保存（5行）" "ok"
    else
        check "Task 3: \"e\" を含む行を grep -h で result_task3.txt に保存（5行）" "fail"
    fi
else
    check "Task 3: \"e\" を含む行を grep -h で result_task3.txt に保存（5行）" "fail"
fi

# Task 4: "source_a.txt" "3 lines" 形式の行が含まれるか
if [ -f "result_task4.txt" ] \
    && grep -q "source_a.txt" result_task4.txt \
    && grep -q "3 lines" result_task4.txt \
    && grep -q "source_b.txt" result_task4.txt \
    && grep -q "source_c.txt" result_task4.txt; then
    check "Task 4: 各ファイルの行数を \"ファイル名: N lines\" 形式で result_task4.txt に保存" "ok"
else
    check "Task 4: 各ファイルの行数を \"ファイル名: N lines\" 形式で result_task4.txt に保存" "fail"
fi

# Task 5: 3行で cherry, bird, green が含まれるか
if [ -f "result_task5.txt" ]; then
    lines=$(wc -l < result_task5.txt | xargs)
    if [ "$lines" -eq 3 ] \
        && grep -q "cherry" result_task5.txt \
        && grep -q "bird" result_task5.txt \
        && grep -q "green" result_task5.txt; then
        check "Task 5: 各ファイルの末尾行を result_task5.txt に追記（cherry, bird, green）" "ok"
    else
        check "Task 5: 各ファイルの末尾行を result_task5.txt に追記（cherry, bird, green）" "fail"
    fi
else
    check "Task 5: 各ファイルの末尾行を result_task5.txt に追記（cherry, bird, green）" "fail"
fi

echo ""
echo "=== 結果: $PASS/$((PASS + FAIL)) passed ==="
