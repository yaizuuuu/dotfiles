#!/bin/bash

# terminal-notifierを使った通知
# 引数:
#   $1: 通知タイプ (Notification, Stop, Error等) - オプション
#   $2: 通知メッセージ - オプション

TYPE="${1:-Notification}"
MESSAGE="${2:-作業が完了しました}"

# 通知タイプに応じたサウンドとタイトル
case "$TYPE" in
  "Error")
    SOUND="Sosumi"
    TITLE="Claude Code - エラー"
    ;;
  "Stop")
    SOUND="Glass"
    TITLE="Claude Code - 完了"
    ;;
  *)
    SOUND="Glass"
    TITLE="Claude Code"
    ;;
esac

terminal-notifier \
  -title "$TITLE" \
  -message "$MESSAGE" \
  -sound "$SOUND" \
  -execute 'open -a Ghostty'
