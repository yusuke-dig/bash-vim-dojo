# Bash & Vim Dojo — Claude への指示

## プロジェクト概要

毎日15分でVimとBashを組み合わせて学ぶ練習プロジェクト。

## 「今日の分を作って」と言われたら

以下の手順で必ずファイルを生成すること：

1. `progress.md` を読んで次のDay番号を確認する
2. `curriculum.md` の該当Dayのテーマを確認する
3. `lessons/dayNN/` ディレクトリを作成し、以下3ファイルを生成する：
   - `lesson.md` — 解説とチートシート（読むだけで理解できる構成）
   - `exercise.sh` — 実行可能な演習ファイル（コメントで手順を誘導）
   - `test.sh` — 自動採点スクリプト（bash test.sh で結果確認）
4. `progress.md` の最終レッスン日と完了済みDayを更新する
5. `README.md` の「進捗ログ」テーブルに1行追加する（日付・テーマを記録）
6. `../dev-learning-logs/` に学習ログを書く（下記「dev-learning-logs 連携」参照）
7. 以下のコマンドでコミットする（必ず実行すること）：
   ```
   git add lessons/dayNN/ progress.md README.md
   git commit -m "Day NN: [Vimテーマ] × [Bashテーマ]"
   ```

## dev-learning-logs 連携

レッスン生成と同時に `../dev-learning-logs/` にも学習ログを書くこと。

### 手順

1. `../dev-learning-logs/logs/bash-vim/YYYY-MM-DD.md` を作成する
   - YYYY-MM-DD は今日の日付
   - 記法・粒度は `../dev-learning-logs/CLAUDE.md` の規約に従う
   - 構成: 今日の作業内容 / 今日学んだこと（Vim・Bash・組み合わせの観点別）
2. `../dev-learning-logs/README.md` の `## Bash & Vim` セクションに1行追加する
   - 形式: `- [YYYY-MM-DD](logs/bash-vim/YYYY-MM-DD.md) 今日のトピック要約`
3. `../dev-learning-logs/` でコミットする：
   ```
   cd ../dev-learning-logs
   git add logs/bash-vim/YYYY-MM-DD.md README.md
   git commit -m "Bash & Vim Day NN: [Vimテーマ] × [Bashテーマ]"
   cd -
   ```

## レッスンファイルの規約

### lesson.md の構成
```
# Day NN: [Vimテーマ] × [Bashテーマ]

## 今日のゴール（15分で達成）

## Vim チートシート（今日覚える3〜5コマンド）

## Bash チートシート（今日覚える3〜5コマンド）

## 組み合わせポイント（なぜ一緒に学ぶか）

## 演習の進め方
```

### exercise.sh の規約
- 実行可能にする (`chmod +x` を考慮)
- 各タスクはコメントで `# Task N:` と番号をつける
- ユーザーが編集する箇所は `# YOUR CODE HERE` で明示
- Vimで開いて編集することを前提にした構造にする

### test.sh の規約
- `bash test.sh` で採点できる
- PASSEDとFAILEDを明確に表示
- 最後にスコア（例: 3/5 passed）を表示

## カリキュラムの哲学

- VimとBashは「セットで使うもの」として教える
- 毎回1つのVimコマンドと1つのBash概念を深める（浅く広くではなく）
- 演習は必ず実際に動くコードで行う

## 進捗確認

「進捗を見せて」と言われたら `progress.md` を表示して要約する。
