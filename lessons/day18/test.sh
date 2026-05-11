#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0

check() {
    local desc="$1" expected="$2" actual="$3"
    if [ "$actual" = "$expected" ]; then
        echo "PASSED: $desc"
        PASS=$((PASS + 1))
    else
        echo "FAILED: $desc"
        echo "  期待値: $expected"
        echo "  実際値: $actual"
        FAIL=$((FAIL + 1))
    fi
}

# exercise.sh をソースして変数を取得（temp ファイル経由）
_tmp=$(mktemp)
grep -v '^#' exercise.sh | grep -v '^$' > "$_tmp"
source "$_tmp" > /dev/null 2>&1
rm -f "$_tmp"

# Task 1: APP が "myapp" か
check "Task 1: APP=\"myapp\" が設定されている" "myapp" "$APP"

# Task 2: PHONY_LIST に build と clean が含まれるか
if echo "$PHONY_LIST" | grep -q "build" && echo "$PHONY_LIST" | grep -q "clean"; then
    echo "PASSED: Task 2: PHONY_LIST に build と clean が含まれている"
    PASS=$((PASS + 1))
else
    echo "FAILED: Task 2: PHONY_LIST に build か clean が含まれていない（値: '$PHONY_LIST'）"
    FAIL=$((FAIL + 1))
fi

# Makefile を生成してから Task 3〜5 を確認する
bash exercise.sh > /dev/null 2>&1

# Task 3: make build の出力に "Building" が含まれるか
if [ -f Makefile ]; then
    _build_out=$(make build 2>/dev/null)
    if echo "$_build_out" | grep -qi "building"; then
        echo "PASSED: Task 3: make build が 'Building...' を出力した"
        PASS=$((PASS + 1))
    else
        echo "FAILED: Task 3: make build の出力に 'Building' が含まれない（BUILD_CMD を確認）"
        FAIL=$((FAIL + 1))
    fi
else
    echo "FAILED: Task 3: Makefile が存在しない（bash exercise.sh を実行しているか確認）"
    FAIL=$((FAIL + 1))
fi

# Task 4: make clean の出力に "Cleaning" が含まれるか
if [ -f Makefile ]; then
    _clean_out=$(make clean 2>/dev/null)
    if echo "$_clean_out" | grep -qi "cleaning"; then
        echo "PASSED: Task 4: make clean が 'Cleaning...' を出力した"
        PASS=$((PASS + 1))
    else
        echo "FAILED: Task 4: make clean の出力に 'Cleaning' が含まれない（CLEAN_CMD を確認）"
        FAIL=$((FAIL + 1))
    fi
else
    echo "FAILED: Task 4: Makefile が存在しない"
    FAIL=$((FAIL + 1))
fi

# Task 5: make all が成功するか
if make all > /dev/null 2>&1; then
    echo "PASSED: Task 5: make all が成功した"
    PASS=$((PASS + 1))
else
    echo "FAILED: Task 5: make all が失敗した（ALL_DEPS を確認）"
    FAIL=$((FAIL + 1))
fi

echo ""
echo "$PASS/5 passed"
