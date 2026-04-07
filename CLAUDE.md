# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリについて

macOS向けdotfiles管理リポジトリ。シンボリックリンクで各設定ファイルをホームディレクトリに展開する。

## セットアップ・更新

```bash
bash install.sh
```

`install.sh` は以下を行う:
1. Homebrew bundle (`~/.Brewfile`) でパッケージ一括インストール
2. GitHub認証・ghqでリポジトリをclone (`~/Projects/ghq/github.com/yaizuuuu/dotfiles`)
3. 管理対象ファイルをホームディレクトリへシンボリックリンク

## 管理対象ファイルとリンク先

| リポジトリ内パス | リンク先 |
|---|---|
| `.zshrc` | `~/.zshrc` |
| `.Brewfile` | `~/.Brewfile` |
| `.gitconfig` | `~/.gitconfig` |
| `.config/starship.toml` | `~/.config/starship.toml` |
| `.config/ghostty/config` | `~/.config/ghostty/config` |
| `.config/git/ignore` | `~/.config/git/ignore` |
| `.git-templates` | `~/.git-templates` |
| `.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` / `~/.codex/AGENTS.md` |
| `.claude/notify.sh` | `~/.claude/notify.sh` |
| `.claude/settings.json` | `~/.claude/settings.json` |

## アーキテクチャ

- **`.zshrc`** — PATH設定、starship/zsh-autosuggestions/zsh-syntax-highlighting初期化、anyenv初期化
- **`aliases.sh`** — コマンドエイリアス（`bat`, `eza`, `kiro-cli` など）。`.zshrc` からsource
- **`functions.sh`** — Shell関数。`ghq-cd`（fzfでghqリポジトリを選択してcd）、`brew`ラッパー（install/uninstall後に `.Brewfile` 自動更新）
- **`.claude/CLAUDE.md`** — Claude Code / Codex向けグローバル指示。`~/.claude/CLAUDE.md` と `~/.codex/AGENTS.md` の両方にリンク

## 新しいdotfileを追加する手順

1. ファイルをリポジトリ内に追加
2. `install.sh` に `ln -sf` コマンドを追記
3. `README.md` の管理対象ファイル表を更新
