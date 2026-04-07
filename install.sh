#!/bin/bash

set -u

# 事前準備:
# brewはあらかじめインストールしておく
#   ref: https://brew.sh/ja/


# colored log helpers

info() {
  echo -e "\033[1;32m[INFO]\033[0m \033[1m$1\033[0m"
}

warn() {
  echo -e "\033[1;33m[WARN]\033[0m \033[1m$1\033[0m"
}

error() {
  echo -e "\033[1;31m[ERROR]\033[0m \033[1m$1\033[0m" >&2
}

if output=$(brew --version 2>/dev/null); then
  info "=== already installed brew: ${output} ==="
else
  echo "brew の取得に失敗しました"
  error "=== not installed brew ==="
  exit 1
fi

GHQ_DIR="${HOME}/Projects/ghq"
DOTFILES_DIR="${GHQ_DIR}/github.com/yaizuuuu/dotfiles"
info "dotfiles dir: ${DOTFILES_DIR}"


info "=== installing bundle from .Brewfile ==="

# google-japanese-imeが更新された場合、端末の再起動が必要な場合がある
brew bundle --global

if output=$(gh auth status 2> /dev/null); then
  info "=== already login github:\n${output} ==="
else
  warn "=== not yet login github ==="
  gh auth login
fi


info "=== cloning dotfiles repo ==="

ln -sf  $DOTFILES_DIR/.gitconfig ~/.gitconfig
ghq get https://github.com/yaizuuuu/dotfiles


info "=== creating links ==="

ln -sf  $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf  $DOTFILES_DIR/.Brewfile ~/.Brewfile

mkdir -p ~/.config/ghostty
mkdir -p ~/.config/git

ln -sf  $DOTFILES_DIR/.config/starship.toml ~/.config/starship.toml
ln -sf  $DOTFILES_DIR/.config/ghostty/config ~/.config/ghostty/config
ln -sf  $DOTFILES_DIR/.config/git/ignore ~/.config/git/ignore

mkdir -p ~/.claude
mkdir -p ~/.codex

ln -sf  $DOTFILES_DIR/AGENTS.md ~/.codex/AGENTS.md
ln -sf  $DOTFILES_DIR/AGENTS.md ~/.claude/CLAUDE.md
ln -sf  $DOTFILES_DIR/.claude/notify.sh ~/.claude/notify.sh
ln -sf  $DOTFILES_DIR/.claude/settings.json ~/.claude/settings.json


info "=== installing safe-chain ==="

curl -fsSL https://github.com/AikidoSec/safe-chain/releases/latest/download/install-safe-chain.sh | sh
