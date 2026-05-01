#!/bin/bash
# Day 10 採点スクリプト

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

echo "=== Day 10 テスト ==="

# セットアップ: クリーンな状態で実行
rm -f result_task1.txt result_task2.txt result_task3.txt result_task4.txt result_task5.txt
rm -rf work
bash exercise.sh > /dev/null 2>&1

# Task 1: result_task1.txt に "Hello, Phase1!" が含まれるか
if [ -f "result_task1.txt" ] && grep -q "Hello, Phase1!" result_task1.txt; then
    check "Task 1: greeting 変数を echo で result_task1.txt に保存" "ok"
else
    check "Task 1: greeting 変数を echo で result_task1.txt に保存" "fail"
fi

# Task 2: result_task2.txt に "odd: 1" と "even: 2" が含まれるか
if [ -f "result_task2.txt" ] && grep -q "odd: 1" result_task2.txt && grep -q "even: 2" result_task2.txt; then
    check "Task 2: 1〜5 を奇数/偶数に分けて result_task2.txt に保存" "ok"
else
    check "Task 2: 1〜5 を奇数/偶数に分けて result_task2.txt に保存" "fail"
fi

# Task 3: result_task3.txt に "Hello, Alice!" "Hello, Bob!" "Hello, Carol!" が含まれるか
if [ -f "result_task3.txt" ] \
    && grep -q "Hello, Alice!" result_task3.txt \
    && grep -q "Hello, Bob!" result_task3.txt \
    && grep -q "Hello, Carol!" result_task3.txt; then
    check "Task 3: greet() 関数で3名に挨拶して result_task3.txt に保存" "ok"
else
    check "Task 3: greet() 関数で3名に挨拶して result_task3.txt に保存" "fail"
fi

# Task 4: result_task4.txt が "even" 行のみで "odd" を含まないか
if [ -f "result_task4.txt" ] \
    && grep -q "even" result_task4.txt \
    && ! grep -q "odd" result_task4.txt; then
    check "Task 4: even 行だけを抽出して result_task4.txt に保存" "ok"
else
    check "Task 4: even 行だけを抽出して result_task4.txt に保存" "fail"
fi

# Task 5: result_task5.txt に 2 以上の数字があるか（a.sh と b.sh で最低2）
if [ -f "result_task5.txt" ]; then
    count=$(cat result_task5.txt | tr -d '[:space:]')
    if echo "$count" | grep -qE '^[0-9]+$' && [ "$count" -ge 2 ]; then
        check "Task 5: work/ 以下の .sh ファイル数を result_task5.txt に保存" "ok"
    else
        check "Task 5: work/ 以下の .sh ファイル数を result_task5.txt に保存（値: '$count'）" "fail"
    fi
else
    check "Task 5: work/ 以下の .sh ファイル数を result_task5.txt に保存" "fail"
fi

echo ""
echo "=== 結果: $PASS/$((PASS + FAIL)) passed ==="
