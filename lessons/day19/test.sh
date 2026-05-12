#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0

ok()   { echo "PASSED: $1"; ((PASS++)); }
fail() { echo "FAILED: $1"; ((FAIL++)); }

# 作業ディレクトリをクリーン
rm -f output.txt all.log out.log err.log

# exercise.sh を実行
bash exercise.sh 2>/dev/null

# Task 1: output.txt の1行目が "Hello, redirect!"
if [[ -f output.txt ]] && head -1 output.txt | grep -qv '^#' && head -1 output.txt | grep -q "Hello, redirect!"; then
  ok "Task 1: output.txt に 'Hello, redirect!' が書き込まれている"
else
  fail "Task 1: output.txt に 'Hello, redirect!' が見つからない"
fi

# Task 2: output.txt に "Appended line" が含まれる
if [[ -f output.txt ]] && grep -q "Appended line" output.txt; then
  ok "Task 2: output.txt に 'Appended line' が追記されている"
else
  fail "Task 2: output.txt に 'Appended line' が見つからない"
fi

# Task 3: EXIT_CODE 変数が 0 以外（エラーが発生したコマンド）
# exercise.sh を source して EXIT_CODE を取得
unset EXIT_CODE
source <(grep -A2 'Task 3' exercise.sh | grep -v '^#')
if [[ -n "$EXIT_CODE" ]] && [[ "$EXIT_CODE" -ne 0 ]]; then
  ok "Task 3: EXIT_CODE=$EXIT_CODE（エラーを捨てて終了コードを取得できている）"
else
  fail "Task 3: EXIT_CODE が未設定または 0（2>/dev/null と \$? の組み合わせを確認）"
fi

# Task 4: all.log が存在し、内容がある
if [[ -f all.log ]] && [[ -s all.log ]]; then
  ok "Task 4: all.log にデータが書き込まれている"
else
  fail "Task 4: all.log が存在しないか空（> all.log 2>&1 の形式を確認）"
fi

# Task 5: out.log と err.log がそれぞれ存在し内容がある
if [[ -f out.log ]] && [[ -s out.log ]] && [[ -f err.log ]] && [[ -s err.log ]]; then
  ok "Task 5: out.log と err.log に分けて書き込まれている"
else
  fail "Task 5: out.log または err.log が存在しないか空（> out.log 2> err.log を確認）"
fi

echo ""
echo "========================================="
echo "Result: $PASS/$((PASS + FAIL)) passed"
echo "========================================="

# クリーンアップ
rm -f output.txt all.log out.log err.log
