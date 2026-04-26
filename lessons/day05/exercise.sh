#!/bin/bash
# Day 05 演習: Vimヤンク・ペースト（y, p, yy） × Bash関数
#
# 進め方:
#   vim exercise.sh で開き、/Task で各タスクへ検索移動！
#   yy でヤンク、p でペーストしながら関数をコピー・再利用しよう
#   # YOUR CODE HERE の行を書き換えて完成させる
#   採点: bash test.sh

# -------------------------------------------------------
# Task 1: 挨拶を表示する関数 greet を定義して呼び出す
# -------------------------------------------------------
# 期待出力: Hello, World!
echo "=== Task 1 ==="
greet() {
  # YOUR CODE HERE
echo "Hello, World!" 
}
greet

# -------------------------------------------------------
# Task 2: 引数で名前を受け取り "Hello, <name>!" と表示する関数 hello を定義
# -------------------------------------------------------
# 期待出力: Hello, Alice!
echo "=== Task 2 ==="
hello() {
  # YOUR CODE HERE ($1 を使う)
  echo "Hello, $1!" 
}
hello "Alice"

# -------------------------------------------------------
# Task 3: local 変数を使って "Result: <計算結果>" を表示する関数 calc を定義
# -------------------------------------------------------
# 引数: $1 と $2 を足し算する
# 期待出力: Result: 7
echo "=== Task 3 ==="
calc() {
  # YOUR CODE HERE (local result を使う)
  echo "Result: $(($1 + $2))"  
}
calc 3 4

# -------------------------------------------------------
# Task 4: say_hello と say_bye を定義して両方呼ぶ
# -------------------------------------------------------
# ヒント: say_hello を書いたら yy/p でコピーして say_bye のベースにしよう
# 期待出力:
#   Good morning!
#   Good night!
echo "=== Task 4 ==="
say_hello() {
  # YOUR CODE HERE
  echo "Good morning!" 
}
say_bye() {
  # YOUR CODE HERE
  echo "Good night!" 
}
say_hello
say_bye

# -------------------------------------------------------
# Task 5: 関数の出力を変数に受け取る
# -------------------------------------------------------
# double は引数を2倍にして echo で返す
# 期待出力: 10
echo "=== Task 5 ==="
double() {
  # YOUR CODE HERE (echo $(($1 * 2)) のように echo で返す)
  echo $(($1 * 2))  
}
val=$(double 5)
echo "$val"
