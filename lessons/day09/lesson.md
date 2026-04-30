# Day 09: :! でシェル実行 × Bashファイル操作（cp, mv, find）

## 今日のゴール（15分で達成）

Vimを離れずにシェルコマンドを実行し、ファイルのコピー・移動・検索を使いこなす。
「Vimの中でファイル操作が完結する」感覚をつかむ。

---

## Vim チートシート（今日覚える3コマンド）

| コマンド | 動作 | 例 |
|---------|------|----|
| `:!コマンド` | Vimを離れずシェルコマンドを実行 | `:!ls -la` |
| `:r !コマンド` | シェルコマンドの出力をカーソル位置に挿入 | `:r !date` |
| `:.!コマンド` | 現在行をシェルコマンドでフィルタリング（行を置き換え） | `:.!tr a-z A-Z` |

### よく使うパターン

```
# ファイル一覧を確認
:!ls

# スクリプトをその場で実行
:!bash exercise.sh

# コマンドの出力をファイルに追記
:!echo "hello" >> output.txt
```

---

## Bash チートシート（今日覚える4コマンド）

| コマンド | 動作 | 例 |
|---------|------|----|
| `cp src dst` | ファイルをコピー | `cp a.txt b.txt` |
| `mv src dst` | ファイルを移動（リネームも） | `mv old.txt new.txt` |
| `find dir -name "*.txt"` | ファイルを検索 | `find . -name "*.sh"` |
| `find dir -name "*.txt" -type f` | 通常ファイルのみ検索 | `find . -name "*.log" -type f` |

### コード例（そのまま使える）

```bash
# ファイルをコピー
cp source.txt backup.txt

# ファイルをリネーム
mv old_name.txt new_name.txt

# カレントディレクトリ以下の .sh ファイルをすべて探す
find . -name "*.sh"

# 特定ディレクトリ内の .txt ファイルを検索
find /tmp -name "*.txt" -type f

# findで見つけたファイルの数を数える
find . -name "*.sh" | wc -l
```

---

## 組み合わせポイント（なぜ一緒に学ぶか）

`:!` を使えば、Vimでスクリプトを書きながら **その場でファイル操作コマンドを試せる**。

```
# Vimの中でこれが全部できる
:!cp exercise.sh exercise_backup.sh    # バックアップ作成
:!find . -name "*.sh"                  # スクリプト一覧確認
:!mv exercise_backup.sh backup/        # ファイル整理
```

エディタとシェルを行き来しなくてよいので、作業が一本化される。

---

## 演習の進め方

1. `vim lessons/day09/exercise.sh` で演習ファイルを開く
2. 各 Task のコメントを読んで `# YOUR CODE HERE` の部分を埋める
3. `:!bash exercise.sh` で動作確認（Vimを離れずに実行できる！）
4. `bash lessons/day09/test.sh` で採点
