#!/bin/bash
# Day 09 採点スクリプト

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

echo "=== Day 09 テスト ==="

# セットアップ: exercise.sh を実行
rm -f result_find.txt result_count.txt result_upper.txt
rm -rf work
bash exercise.sh > /dev/null 2>&1

# Task 1: work/backup.txt が存在するか
if [ -f "work/backup.txt" ]; then
    check "Task 1: original.txt を backup.txt としてコピー" "ok"
else
    check "Task 1: original.txt を backup.txt としてコピー" "fail"
fi

# Task 2: work/renamed.txt が存在するか
if [ -f "work/renamed.txt" ]; then
    check "Task 2: backup.txt を renamed.txt にリネーム" "ok"
else
    check "Task 2: backup.txt を renamed.txt にリネーム" "fail"
fi

# Task 3: result_find.txt が存在し、.txt ファイルパスが含まれるか
if [ -f "result_find.txt" ] && grep -q "\.txt" result_find.txt; then
    check "Task 3: .txt ファイルを検索して result_find.txt に保存" "ok"
else
    check "Task 3: .txt ファイルを検索して result_find.txt に保存" "fail"
fi

# Task 4: result_count.txt が存在し、数字が入っているか
if [ -f "result_count.txt" ]; then
    count=$(cat result_count.txt | tr -d '[:space:]')
    if echo "$count" | grep -qE '^[0-9]+$'; then
        check "Task 4: .txt ファイルの数を result_count.txt に保存" "ok"
    else
        check "Task 4: .txt ファイルの数を result_count.txt に保存" "fail"
    fi
else
    check "Task 4: .txt ファイルの数を result_count.txt に保存" "fail"
fi

# Task 5: result_upper.txt の内容が "HELLO" か
if [ -f "result_upper.txt" ]; then
    upper=$(cat result_upper.txt | tr -d '[:space:]')
    if [ "$upper" = "HELLO" ]; then
        check "Task 5: hello を大文字に変換して result_upper.txt に保存" "ok"
    else
        check "Task 5: hello を大文字に変換して result_upper.txt に保存（内容: '$upper'）" "fail"
    fi
else
    check "Task 5: hello を大文字に変換して result_upper.txt に保存" "fail"
fi

echo ""
echo "=== 結果: $PASS/$((PASS + FAIL)) passed ==="
