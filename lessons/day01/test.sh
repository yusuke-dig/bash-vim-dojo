#!/usr/bin/env bash
# Day 01 自動採点スクリプト
# 使い方: bash lessons/day01/test.sh

SCRIPT="lessons/day01/exercise.sh"
PASS=0
FAIL=0

check() {
    local description="$1"
    local expected_pattern="$2"
    local actual
    actual=$(bash "$SCRIPT" 2>/dev/null)

    if echo "$actual" | grep -qE "$expected_pattern"; then
        echo "  PASSED: $description"
        ((PASS++))
    else
        echo "  FAILED: $description"
        echo "         期待パターン: $expected_pattern"
        echo "         実際の出力:"
        echo "$actual" | sed 's/^/           /'
        ((FAIL++))
    fi
}

echo "=============================="
echo " Day 01 採点結果"
echo "=============================="

# Task 1: name変数が空でなく、挨拶文に含まれているか
check "Task 1: 名前を表示できる" "こんにちは、.+！"

# Task 2: 足し算の結果が42になっているか
check "Task 2: 10 + 32 = 42 が表示される" "10 \+ 32 = 42"

# Task 3: 日付が YYYY-MM-DD 形式で表示されているか
check "Task 3: 今日の日付が表示される" "今日は [0-9]{4}-[0-9]{2}-[0-9]{2} です"

# Task 4: 自己紹介文が両方の変数を含んでいるか
check "Task 4: 自己紹介文に名前と数が入っている" "私の名前は.+です。好きな数は[0-9]+です。"

echo "=============================="
echo " スコア: $PASS / $((PASS + FAIL)) passed"
echo "=============================="

if [ $FAIL -eq 0 ]; then
    echo " 全問正解！Day 01 完了です！"
    echo " progress.md に記録して次のレッスンへ進みましょう。"
else
    echo " exercise.sh を見直して再挑戦！"
fi
