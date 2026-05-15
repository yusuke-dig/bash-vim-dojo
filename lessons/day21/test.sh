#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

pass=0
fail=0

check() {
    local desc="$1"
    local result="$2"
    if [ "$result" = "true" ]; then
        echo "PASSED: $desc"
        ((pass++))
    else
        echo "FAILED: $desc"
        ((fail++))
    fi
}

source exercise.sh 2>/dev/null

# --------------------
# Task 1: exit_code 変数
# --------------------
if [ -n "$exit_code" ] && [ "$exit_code" -gt 0 ] 2>/dev/null; then
    check "Task 1: exit_code に 0 以外の終了コードが格納されている" "true"
else
    check "Task 1: exit_code に 0 以外の終了コードが格納されている" "false"
fi

# --------------------
# Task 2: check_file 関数
# --------------------
if declare -f check_file > /dev/null 2>&1; then
    check_file "$DIR/exercise.sh"
    if [ $? -eq 0 ]; then
        check "Task 2: check_file は存在するファイルで 0 を返す" "true"
    else
        check "Task 2: check_file は存在するファイルで 0 を返す" "false"
    fi
    check_file "/no_such_file_xyz_abc_123_test"
    if [ $? -ne 0 ]; then
        check "Task 2: check_file は存在しないファイルで 0 以外を返す" "true"
    else
        check "Task 2: check_file は存在しないファイルで 0 以外を返す" "false"
    fi
else
    check "Task 2: check_file は存在するファイルで 0 を返す" "false"
    check "Task 2: check_file は存在しないファイルで 0 以外を返す" "false"
fi

# --------------------
# Task 3: safe_mkdir 関数
# --------------------
if declare -f safe_mkdir > /dev/null 2>&1; then
    output=$(safe_mkdir "/no_permission_path_xyz/subdir_test" 2>&1)
    code=$?
    if echo "$output" | grep -q "作成失敗" && [ $code -ne 0 ]; then
        check "Task 3: safe_mkdir は失敗時に '作成失敗' を出力して 0 以外を返す" "true"
    else
        check "Task 3: safe_mkdir は失敗時に '作成失敗' を出力して 0 以外を返す" "false"
    fi
else
    check "Task 3: safe_mkdir は失敗時に '作成失敗' を出力して 0 以外を返す" "false"
fi

# --------------------
# Task 4: run_with_check 関数
# --------------------
if declare -f run_with_check > /dev/null 2>&1; then
    run_with_check true
    if [ $? -eq 0 ]; then
        check "Task 4: run_with_check は成功コマンドで 0 を返す" "true"
    else
        check "Task 4: run_with_check は成功コマンドで 0 を返す" "false"
    fi
    output=$(run_with_check false 2>&1)
    code=$?
    if [ $code -ne 0 ] && echo "$output" | grep -q "コマンド失敗"; then
        check "Task 4: run_with_check は失敗コマンドで 'コマンド失敗' を出力して 0 以外を返す" "true"
    else
        check "Task 4: run_with_check は失敗コマンドで 'コマンド失敗' を出力して 0 以外を返す" "false"
    fi
else
    check "Task 4: run_with_check は成功コマンドで 0 を返す" "false"
    check "Task 4: run_with_check は失敗コマンドで 'コマンド失敗' を出力して 0 以外を返す" "false"
fi

# --------------------
# Task 5: get_exit_code 関数
# --------------------
if declare -f get_exit_code > /dev/null 2>&1; then
    result=$(get_exit_code true 2>/dev/null)
    if [ "$result" = "0" ]; then
        check "Task 5: get_exit_code は成功コマンドの終了コード '0' を出力する" "true"
    else
        check "Task 5: get_exit_code は成功コマンドの終了コード '0' を出力する" "false"
    fi
    result=$(get_exit_code ls /no_such_path_xyz_abc 2>/dev/null)
    if [ -n "$result" ] && [ "$result" -gt 0 ] 2>/dev/null; then
        check "Task 5: get_exit_code は失敗コマンドの終了コードを出力する" "true"
    else
        check "Task 5: get_exit_code は失敗コマンドの終了コードを出力する" "false"
    fi
else
    check "Task 5: get_exit_code は成功コマンドの終了コード '0' を出力する" "false"
    check "Task 5: get_exit_code は失敗コマンドの終了コードを出力する" "false"
fi

# --------------------
# スコア表示
# --------------------
total=$((pass + fail))
echo ""
echo "=========================="
echo "結果: $pass/$total passed"
echo "=========================="
