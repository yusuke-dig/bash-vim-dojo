#!/bin/bash
# Day 14: :g コマンド × xargs
# 実行方法: bash exercise.sh
# 採点方法: bash test.sh

# =============================================================
# Task 1: xargs の基本 — echo の出力を引数として渡す
# =============================================================
# 「apple banana cherry」という文字列を echo して、
# xargs に渡して各単語を1行ずつ出力してください。
# 期待出力:
#   apple
#   banana
#   cherry
#
# ヒント: echo "..." | xargs -n 1 echo を使う

echo "--- Task 1 ---"
# YOUR CODE HERE
echo "apple banana cherry" | xargs -n 1 echo


# =============================================================
# Task 2: xargs -I {} — 引数の位置を指定して出力
# =============================================================
# 「cat dog bird」を echo して xargs に渡し、
# 各単語を「Animal: (単語)」という形式で出力してください。
# 期待出力:
#   Animal: cat
#   Animal: dog
#   Animal: bird
#
# ヒント: xargs -n 1 -I {} echo "Animal: {}" を使う

echo "--- Task 2 ---"
# YOUR CODE HERE
echo "cat dog bird" | xargs -n 1 -I {} echo "Animal: {}"


# =============================================================
# Task 3: find + xargs — ファイル一覧を処理する
# =============================================================
# カレントディレクトリ（lessons/day14/）の .sh ファイルを
# find で検索し、xargs を使って各ファイルのパスを
# 「Script: (パス)」という形式で出力してください。
#
# ヒント: find . -name "*.sh" | xargs -I {} echo "Script: {}" を使う

echo "--- Task 3 ---"
# YOUR CODE HERE
find . -name "*.sh" | xargs -I {} echo "Script: {}"


# =============================================================
# Task 4: xargs でファイル内容を grep する
# =============================================================
# 以下の一時ファイルを作成してから、
# echo でファイル名リストを渡して xargs grep を使い、
# 両方のファイルから "ok" という文字列を含む行を検索してください。
#
# ヒント: echo "file1 file2" | xargs grep "keyword" を使う

echo "--- Task 4 ---"
echo -e "status: ok\nstatus: error" > /tmp/day14_a.txt
echo -e "result: ok\nresult: fail" > /tmp/day14_b.txt

# YOUR CODE HERE
echo "/tmp/day14_a.txt /tmp/day14_b.txt" | xargs grep "ok"


# =============================================================
# Task 5: パイプラインの組み合わせ
# =============================================================
# /tmp/day14_a.txt と /tmp/day14_b.txt の両ファイルを cat して、
# grep で "ok" を含む行だけ抽出し、
# xargs を使って各行を「[FOUND] (行)」の形式で出力してください。
# 期待出力:
#   [FOUND] status: ok
#   [FOUND] result: ok
#
# ヒント: cat ... | grep "ok" | xargs -I {} echo "[FOUND] {}" を使う

echo "--- Task 5 ---"
# YOUR CODE HERE
cat /tmp/day14_a.txt /tmp/day14_b.txt | grep "ok" | xargs -I {} echo "[FOUND] {}"
