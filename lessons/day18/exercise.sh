#!/bin/bash
# Day 18: :make でMakefileターゲット実行 × Makefile基礎
#
# 【Vim での使い方】
#   1. vim exercise.sh で開く
#   2. Task 1〜5 の # YOUR CODE HERE を埋める（:wq で保存）
#   3. :! bash exercise.sh で Makefile を生成する
#   4. :e Makefile で内容を確認する
#   5. :make build / :make clean で動作確認
#   6. bash test.sh で採点

# ================================================================
# Task 1: APP 変数に "myapp" を設定する
# ----------------------------------------------------------------
# ヒント: APP="myapp"
APP="myapp"
# YOUR CODE HERE

# ================================================================
# Task 2: .PHONY に宣言するターゲット一覧を PHONY_LIST に設定する
#         all build clean の3つを含めること
# ----------------------------------------------------------------
# ヒント: PHONY_LIST="all build clean"
PHONY_LIST="all build clean"
# YOUR CODE HERE

# ================================================================
# Task 3: build ターゲットのコマンドを BUILD_CMD に設定する
#         Makefile変数 $(APP) を参照すること（シングルクォートで囲む）
# ----------------------------------------------------------------
# ヒント: BUILD_CMD='echo "Building $(APP)"'
BUILD_CMD='echo "Building $(APP)"'
# YOUR CODE HERE

# ================================================================
# Task 4: clean ターゲットのコマンドを CLEAN_CMD に設定する
# ----------------------------------------------------------------
# ヒント: CLEAN_CMD='echo "Cleaning..."'
CLEAN_CMD='echo "Cleaning..."'
# YOUR CODE HERE

# ================================================================
# Task 5: all ターゲットが依存するターゲットを ALL_DEPS に設定する
# ----------------------------------------------------------------
# ヒント: ALL_DEPS="build"
ALL_DEPS="build"
# YOUR CODE HERE

# === 以下は変更不要: 上の変数を使って Makefile を生成する ===
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    {
        printf "APP = %s\n\n" "$APP"
        printf ".PHONY: %s\n\n" "$PHONY_LIST"
        printf "all: %s\n\n" "$ALL_DEPS"
        printf "build:\n\t%s\n\n" "$BUILD_CMD"
        printf "clean:\n\t%s\n" "$CLEAN_CMD"
    } > Makefile
    echo "Makefile generated. Try: make all / make build / make clean"
fi
