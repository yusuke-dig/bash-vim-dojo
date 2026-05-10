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

# exercise.sh をソースして関数定義を取り込む（出力は捨てる）
_tmp=$(mktemp)
grep -v "^#" exercise.sh | grep -v "^$" > "$_tmp"
source "$_tmp" > /dev/null 2>&1
rm -f "$_tmp"

# Task 1: greet 関数が "Hello, World!" を返すか
check "Task 1: greet 'World' → 'Hello, World!'" "Hello, World!" "$(greet 'World' 2>/dev/null)"

# Task 2: add 関数が合計を返すか
check "Task 2: add 3 5 → '8'" "8" "$(add 3 5 2>/dev/null)"

# Task 3: to_upper 関数が lib.sh から読み込まれているか
check "Task 3: to_upper 'bash' → 'BASH'" "BASH" "$(to_upper 'bash' 2>/dev/null)"

# exercise.sh を実行して出力を確認（Task 4・5 の呼び出し確認）
_output=$(bash exercise.sh 2>/dev/null)

# Task 4: greet "Vim" が呼ばれているか
if echo "$_output" | grep -q "Hello, Vim!"; then
    echo "PASSED: Task 4: greet 'Vim' が呼ばれている"
    PASS=$((PASS + 1))
else
    echo "FAILED: Task 4: 出力に 'Hello, Vim!' が見つからない"
    FAIL=$((FAIL + 1))
fi

# Task 5: add 7 3 が呼ばれているか（出力に 10 が含まれる）
if echo "$_output" | grep -q "^10$"; then
    echo "PASSED: Task 5: add 7 3 → 10 が出力されている"
    PASS=$((PASS + 1))
else
    echo "FAILED: Task 5: 出力に '10' が見つからない"
    FAIL=$((FAIL + 1))
fi

echo ""
echo "$PASS/5 passed"
