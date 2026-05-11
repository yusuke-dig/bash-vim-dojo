# Day 18: :make でMakefileターゲット実行 × Makefile基礎

## 今日のゴール（15分で達成）

- `:make [ターゲット名]` で Vim から直接 make を実行できる
- Makefile の基本構造（ターゲット・依存・レシピ）を理解できる
- 変数と `.PHONY` を使った Makefile を書ける

## Vim チートシート（今日覚える4コマンド）

| コマンド | 動作 |
|---------|------|
| `:make` | Makefile のデフォルトターゲット（通常 `all`）を実行 |
| `:make [ターゲット名]` | 指定したターゲットを実行（例: `:make build`） |
| `:copen` | make のエラー・警告を QuickFix リストで表示 |
| `:! bash exercise.sh` | exercise.sh を実行して Makefile を生成 |

## Vim 基本操作リファレンス（毎日掲載）

| カテゴリ | コマンド | 動作 |
|---------|---------|------|
| 移動 | `gg` | ファイル先頭へ |
| 移動 | `G` | ファイル末尾へ |
| 移動 | `0` / `$` | 行頭 / 行末へ |
| 移動 | `w` / `b` | 次の単語 / 前の単語へ |
| 移動 | `Ctrl-u` / `Ctrl-d` | 半ページ上 / 下スクロール |
| 編集 | `u` | アンドゥ |
| 編集 | `Ctrl-r` | リドゥ |
| 編集 | `dd` | 行を切り取り |
| 編集 | `yy` | 行をヤンク（コピー） |
| 編集 | `p` | 貼り付け |
| 編集 | `x` | カーソル位置の文字を削除 |
| モード | `i` | カーソル前に挿入 |
| モード | `a` | カーソル後に挿入 |
| モード | `Esc` | ノーマルモードに戻る |
| 検索 | `/パターン` | 前方検索 |
| 検索 | `n` / `N` | 次 / 前の一致へ |
| ファイル | `:w` | 保存 |
| ファイル | `:q` | 終了（`:wq` で保存して終了） |
| ファイル | `:e ファイル名` | 別ファイルを開く |

## Bash/Makefile チートシート（今日覚える5つ）

| 書き方 | 動作 |
|--------|------|
| `ターゲット名:` | ターゲットを定義する |
| `(タブ)コマンド` | ターゲットのレシピ（**必ずタブ文字**、スペース不可） |
| `VAR = 値` | Makefile 変数を定義する |
| `$(VAR)` | Makefile 変数を参照する |
| `.PHONY: ターゲット名` | ファイルと同名でも混同しないよう宣言する |

### コード例（そのまま写せば動く）

```makefile
# Makefile 変数
APP = myapp

# .PHONY: 同名ファイルが存在しても常にコマンドを実行する
.PHONY: all build clean

# all ターゲット（依存のみ、コマンドなし）
all: build

# build ターゲット（$(APP) は Makefile 変数として展開される）
build:
	echo "Building $(APP)"

# clean ターゲット
clean:
	echo "Cleaning..."
```

```bash
# Bash 変数に Makefile コマンドを設定する例
# $(APP) を展開させないようシングルクォートで囲む
BUILD_CMD='echo "Building $(APP)"'
CLEAN_CMD='echo "Cleaning..."'
```

## 組み合わせポイント（なぜ一緒に学ぶか）

実務では `make build` や `make test` を頻繁に打つ。Vim の `:make build` を使えば：

- Vim を離れずにビルドを実行できる
- エラーがあれば `:copen` で QuickFix リストを開いてジャンプできる
- `bash exercise.sh` で Makefile を生成 → `:make build` でテスト の流れが自然になる

## 演習の進め方

1. `vim exercise.sh` で開く
2. Task 1〜5 の `# YOUR CODE HERE` を埋める（`:wq` で保存）
3. `:! bash exercise.sh` で Makefile を生成する
4. `:e Makefile` で生成された Makefile を確認してみる
5. `:make build` と `:make clean` を実行して動作を確認する
6. `bash test.sh` で採点する

## 振り返り

演習が終わったら以下を試してみよう：

- `:make clean` → `:make build` の順に実行してみる
- `:copen` を開いてみる（エラーがなければ空のリスト）
- `:e Makefile` で生成されたファイルを眺め、タブ文字が使われているか確認する（`cat -A Makefile` で `^I` が見えたらタブ）
