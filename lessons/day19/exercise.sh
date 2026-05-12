#!/usr/bin/env bash
# Day 19: Vim で YAML/設定ファイル編集 × リダイレクト完全理解
# vim exercise.sh で開いて編集し、bash test.sh で採点しよう

# ===== Task 1: 標準出力をファイルへ書き込む =====
# ヒント: echo "hello" > ファイル名 を使う
# "Hello, redirect!" という文字列を output.txt に書き込め

# YOUR CODE HERE

# ===== Task 2: 追記モードでファイルに書き足す =====
# ヒント: >> を使う（> だと上書きになるので注意）
# "Appended line" という文字列を output.txt に追記せよ

# YOUR CODE HERE

# ===== Task 3: エラーを /dev/null に捨てる =====
# ヒント: 存在しないファイルを cat すると標準エラーが出る
# cat no_such_file.txt のエラーを /dev/null へ捨てて、終了コードを変数 EXIT_CODE に格納せよ
# 例: some_cmd 2>/dev/null; EXIT_CODE=$?

# YOUR CODE HERE

# ===== Task 4: 標準出力とエラーを同じファイルへ =====
# ヒント: > file 2>&1 または &> file を使う
# ls -la と cat no_such_file.txt を ; でつなぎ、両方の出力を all.log へ書き込め
# 例: (ls -la; cat no_such_file.txt) > file 2>&1

# YOUR CODE HERE

# ===== Task 5: 標準出力とエラーを別々のファイルへ =====
# ヒント: > out.log 2> err.log のように別々にリダイレクトする
# (echo "stdout msg"; echo "stderr msg" >&2) の出力を
# 標準出力は out.log へ、標準エラーは err.log へそれぞれ書き込め

# YOUR CODE HERE
