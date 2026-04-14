#!/bin/bash

set -euo pipefail

# 事前準備:
# brewはあらかじめインストールしておく
#   ref: https://brew.sh/ja/


# colored log helpers

info() {
  echo -e "\033[1;32m[INFO]\033[0m \033[1m=== $1 ===\033[0m"
}

warn() {
  echo -e "\033[1;33m[WARN]\033[0m \033[1m=== $1 ===\033[0m"
}

error() {
  echo -e "\033[1;31m[ERROR]\033[0m \033[1m=== $1 ===\033[0m" >&2
}

if output=$(brew --version 2>/dev/null); then
  info "already installed brew: ${output}"
else
  error "not installed brew"
  exit 1
fi

GHQ_DIR="${HOME}/Projects/ghq"
DOTFILES_DIR="${GHQ_DIR}/github.com/yaizuuuu/dotfiles"
info "dotfiles dir: ${DOTFILES_DIR}"


info "installing bundle from .Brewfile"

# google-japanese-imeが更新された場合、端末の再起動が必要な場合がある
if [ -f "${HOME}/.Brewfile" ]; then
  info "already existed ${HOME}/.Brewfile"
else
  warn "not yet existed ${HOME}/.Brewfile, fetching .Brewfile"
  curl -fsSL https://raw.githubusercontent.com/yaizuuuu/dotfiles/HEAD/.Brewfile > $HOME/.Brewfile
fi
brew bundle --global


info "cloning dotfiles repo"

if gh auth status 2> /dev/null; then
  info "already login github"
else
  warn "not yet login github"
  gh auth login -c -p https -w
fi

if [ -f "${HOME}/.gitconfig" ]; then
  info "already existed ${HOME}/.gitconfig"
else
  warn "not yet existed ${HOME}/.gitconfig, fetching .gitconfig"
  curl -fsSL https://raw.githubusercontent.com/yaizuuuu/dotfiles/HEAD/.gitconfig > $HOME/.gitconfig
fi

ghq get https://github.com/yaizuuuu/dotfiles


info "creating links"

ln -sf  $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf  $DOTFILES_DIR/.Brewfile ~/.Brewfile
ln -sf  $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -sf  $DOTFILES_DIR/.git-templates ~/

mkdir -p ~/.config/ghostty
mkdir -p ~/.config/git

ln -sf  $DOTFILES_DIR/.config/starship.toml ~/.config/starship.toml
ln -sf  $DOTFILES_DIR/.config/ghostty/config ~/.config/ghostty/config
ln -sf  $DOTFILES_DIR/.config/git/ignore ~/.config/git/ignore

mkdir -p ~/.claude
mkdir -p ~/.codex

ln -sf  $DOTFILES_DIR/.claude/CLAUDE.md ~/.codex/AGENTS.md
ln -sf  $DOTFILES_DIR/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sf  $DOTFILES_DIR/.claude/notify.sh ~/.claude/notify.sh
ln -sf  $DOTFILES_DIR/.claude/settings.json ~/.claude/settings.json


info "installing lefthook"

(cd "$DOTFILES_DIR" && lefthook install)


info "installing safe-chain"

SAFE_CHAIN_VER="1.4.9"
curl -fsSL "https://github.com/AikidoSec/safe-chain/releases/download/${SAFE_CHAIN_VER}/install-safe-chain.sh" | sh
