#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0

check() {
    local desc="$1"
    local result="$2"
    if [ "$result" = "ok" ]; then
        echo "PASSED: $desc"
        ((PASS++))
    else
        echo "FAILED: $desc"
        ((FAIL++))
    fi
}

# 前回の結果ファイルを削除
rm -f result1.txt result2.txt result3.txt result4.txt result5.txt

# exercise.sh を実行
bash exercise.sh 2>/dev/null

# Task 1: "an" を含む単語が result1.txt に保存されているか
if [ -f result1.txt ]; then
    content=$(cat result1.txt)
    if echo "$content" | grep -q "banana" && \
       echo "$content" | grep -q "mango" && \
       echo "$content" | grep -q "orange" && \
       ! echo "$content" | grep -q "apple" && \
       ! echo "$content" | grep -q "grape"; then
        check "Task 1: grep で 'an' を含む単語を抽出" "ok"
    else
        check "Task 1: grep で 'an' を含む単語を抽出" "fail"
    fi
else
    check "Task 1: grep で 'an' を含む単語を抽出 (result1.txt なし)" "fail"
fi

# Task 2: コメント行以外の行数が non_comment_lines に入っているか
source <(grep -v "^#" exercise.sh | grep -v "^$")
if [ "$non_comment_lines" -gt 0 ] 2>/dev/null; then
    check "Task 2: grep -v でコメント除外した行数を取得" "ok"
else
    check "Task 2: grep -v でコメント除外した行数を取得 (0 または未設定)" "fail"
fi

# Task 3: "Task" が含まれる行が行番号付きで result3.txt に保存されているか
if [ -f result3.txt ]; then
    if grep -q "^[0-9]*:.*Task" result3.txt; then
        check "Task 3: grep -n で行番号付き検索" "ok"
    else
        check "Task 3: grep -n で行番号付き検索 (行番号形式が違う)" "fail"
    fi
else
    check "Task 3: grep -n で行番号付き検索 (result3.txt なし)" "fail"
fi

# Task 4: "cat" または "dog" を含む単語が result4.txt に保存されているか
if [ -f result4.txt ]; then
    content=$(cat result4.txt)
    if echo "$content" | grep -q "catalog" && \
       echo "$content" | grep -q "dogma" && \
       ! echo "$content" | grep -q "dodgeball" 2>/dev/null || \
       echo "$content" | grep -q "catfish"; then
        # dodgeball は "dog" を含まないが dogma は含む
        # catfish は "cat" を含む
        if echo "$content" | grep -q "dogma" && echo "$content" | grep -q "catfish"; then
            check "Task 4: grep -E で複数パターン検索" "ok"
        else
            check "Task 4: grep -E で複数パターン検索 (不足あり)" "fail"
        fi
    else
        check "Task 4: grep -E で複数パターン検索 (内容が違う)" "fail"
    fi
else
    check "Task 4: grep -E で複数パターン検索 (result4.txt なし)" "fail"
fi

# Task 5: 数字3桁以上を含む行が result5.txt に保存されているか
if [ -f result5.txt ]; then
    content=$(cat result5.txt)
    if echo "$content" | grep -q "banana" && \
       echo "$content" | grep -q "cherry" && \
       echo "$content" | grep -q "elderberry" && \
       ! echo "$content" | grep -q "apple" && \
       ! echo "$content" | grep -q "date:"; then
        check "Task 5: grep で数字3桁以上の行を抽出" "ok"
    else
        check "Task 5: grep で数字3桁以上の行を抽出 (内容が違う)" "fail"
    fi
else
    check "Task 5: grep で数字3桁以上の行を抽出 (result5.txt なし)" "fail"
fi

echo ""
echo "============================="
echo "Result: $PASS/$((PASS + FAIL)) passed"
echo "============================="
