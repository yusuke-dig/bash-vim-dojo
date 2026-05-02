#!/bin/bash
# Day 11 採点スクリプト

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

echo "=== Day 11 テスト ==="

rm -f result_task1.txt result_task2.txt result_task3.txt result_task4.txt result_task5.txt data.txt
bash exercise.sh > /dev/null 2>&1

# Task 1: "orange" が含まれ "apple" が含まれないか
if [ -f "result_task1.txt" ] \
    && grep -q "orange" result_task1.txt \
    && ! grep -q "apple" result_task1.txt; then
    check "Task 1: apple を orange に置換して result_task1.txt に保存" "ok"
else
    check "Task 1: apple を orange に置換して result_task1.txt に保存" "fail"
fi

# Task 2: コメント行（#）が含まれないか
if [ -f "result_task2.txt" ] \
    && ! grep -q "^#" result_task2.txt \
    && grep -q "banana" result_task2.txt; then
    check "Task 2: コメント行を除いて result_task2.txt に保存" "ok"
else
    check "Task 2: コメント行を除いて result_task2.txt に保存" "fail"
fi

# Task 3: 1行だけで内容が "apple" か
if [ -f "result_task3.txt" ]; then
    lines=$(wc -l < result_task3.txt | tr -d '[:space:]')
    content=$(cat result_task3.txt | tr -d '[:space:]')
    if [ "$lines" -eq 1 ] && [ "$content" = "apple" ]; then
        check "Task 3: 1行目だけ抽出して result_task3.txt に保存" "ok"
    else
        check "Task 3: 1行目だけ抽出して result_task3.txt に保存" "fail"
    fi
else
    check "Task 3: 1行目だけ抽出して result_task3.txt に保存" "fail"
fi

# Task 4: "grape" と "melon" が含まれ、"apple" と "banana" が含まれないか
if [ -f "result_task4.txt" ] \
    && grep -q "grape" result_task4.txt \
    && grep -q "melon" result_task4.txt \
    && ! grep -q "apple" result_task4.txt \
    && ! grep -q "banana" result_task4.txt; then
    check "Task 4: apple→grape / banana→melon の連続置換で result_task4.txt に保存" "ok"
else
    check "Task 4: apple→grape / banana→melon の連続置換で result_task4.txt に保存" "fail"
fi

# Task 5: 2行で "banana" と "apple pie" が含まれるか
if [ -f "result_task5.txt" ]; then
    lines=$(wc -l < result_task5.txt | tr -d '[:space:]')
    if [ "$lines" -eq 2 ] \
        && grep -q "banana" result_task5.txt \
        && grep -q "apple pie" result_task5.txt; then
        check "Task 5: 2〜3行目を抽出して result_task5.txt に保存" "ok"
    else
        check "Task 5: 2〜3行目を抽出して result_task5.txt に保存" "fail"
    fi
else
    check "Task 5: 2〜3行目を抽出して result_task5.txt に保存" "fail"
fi

echo ""
echo "=== 結果: $PASS/$((PASS + FAIL)) passed ==="
