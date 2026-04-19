#!/bin/bash
# Day 02 自動採点スクリプト
# 使い方: bash lessons/day02/test.sh

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

PASS=0
FAIL=0
TOTAL=5

echo "===== Day 02 採点結果 ====="
echo ""

# Task 1: NAME が YOUR_NAME のままではないか
source_content=$(cat exercise.sh)
if echo "$source_content" | grep -q 'NAME="YOUR_NAME"'; then
  echo "[FAILED] Task 1: NAME がまだ YOUR_NAME のままです"
  FAIL=$((FAIL + 1))
else
  name_val=$(grep '^NAME=' exercise.sh | head -1 | cut -d'"' -f2)
  if [ -n "$name_val" ]; then
    echo "[PASSED] Task 1: NAME=\"$name_val\" が設定されています"
    PASS=$((PASS + 1))
  else
    echo "[FAILED] Task 1: NAME の値が空です"
    FAIL=$((FAIL + 1))
  fi
fi

# Task 2: OPERATOR が正しい演算子に変わっているか（コメント行を除外）
if grep -v '^#' exercise.sh | grep -q 'OPERATOR'; then
  echo "[FAILED] Task 2: 比較演算子がまだ OPERATOR のままです"
  FAIL=$((FAIL + 1))
else
  # score=75, 60以上なら合格
  task2_output=$(bash -c '
    score=75
    if echo "'"$source_content"'" | grep -q "score OPERATOR"; then
      echo "OPERATOR未置換"
    else
      score_line=$(grep "if \[ \$score" exercise.sh | head -1)
      if echo "$score_line" | grep -qE "\-ge|\-gt|\-eq"; then
        eval "$(grep "^score=" exercise.sh | head -1)"
        if [ $score -ge 60 ]; then echo "合格"; else echo "不合格"; fi
      else
        echo "判定不明"
      fi
    fi
  ' 2>/dev/null)

  # 実際にexercise.shを部分実行して確認
  task2_result=$(bash -c "
    score=75
    $(grep -A3 'Task 2' exercise.sh | grep -v '^#' | head -5)
  " 2>/dev/null)

  if echo "$task2_result" | grep -q "合格"; then
    echo "[PASSED] Task 2: score=75 で '合格' が表示されます"
    PASS=$((PASS + 1))
  else
    # 演算子があるか確認
    if grep -E '\$score\s+\-(ge|gt|eq|le|lt|ne)\s+60' exercise.sh > /dev/null 2>&1; then
      echo "[PASSED] Task 2: 比較演算子が設定されています"
      PASS=$((PASS + 1))
    else
      echo "[FAILED] Task 2: 正しい比較演算子（-ge など）に変えてください"
      FAIL=$((FAIL + 1))
    fi
  fi
fi

# Task 3: elif節が追加されているか（grade=82 → 合格 が表示されるか）
if grep -q 'elif' exercise.sh; then
  # grade=82 のブロックを実行してみる
  task3_output=$(bash -c "
    grade=82
    $(sed -n '/Task 3/,/Task 4/p' exercise.sh | grep -v '^#' | grep -v '===')
  " 2>/dev/null)
  if echo "$task3_output" | grep -q "合格"; then
    echo "[PASSED] Task 3: elif が追加され grade=82 で '合格' が表示されます"
    PASS=$((PASS + 1))
  else
    echo "[FAILED] Task 3: elif は追加されましたが、grade=82 で '合格' が表示されません"
    FAIL=$((FAIL + 1))
  fi
else
  echo "[FAILED] Task 3: elif 節が追加されていません"
  FAIL=$((FAIL + 1))
fi

# Task 4: "余計な行" の echo が削除されているか（コメント行を除外）
if grep -v '^#' exercise.sh | grep -q '余計な行'; then
  echo "[FAILED] Task 4: '余計な行' の echo がまだ残っています（dd で削除してください）"
  FAIL=$((FAIL + 1))
else
  echo "[PASSED] Task 4: 余計な行が削除されています"
  PASS=$((PASS + 1))
fi

# Task 5: day と "Monday" の比較が書かれているか
if grep -qE 'day=|DAY=' exercise.sh && grep -q 'Monday' exercise.sh; then
  echo "[PASSED] Task 5: day 変数と Monday の比較が書かれています"
  PASS=$((PASS + 1))
else
  echo "[FAILED] Task 5: day 変数のセットと Monday の比較を書いてください"
  FAIL=$((FAIL + 1))
fi

echo ""
echo "============================="
echo "スコア: $PASS/$TOTAL passed"
echo "============================="

if [ $PASS -eq $TOTAL ]; then
  echo "完璧です！Day 02 クリア！"
elif [ $PASS -ge 3 ]; then
  echo "あと少し！残りのタスクに挑戦してみましょう。"
else
  echo "lesson.md を読み直して、もう一度試してみましょう。"
fi
