function ghq-cd() {
  local dir
  dir=$(ghq list -p | fzf) || return
  cd "$dir"
}

# brew install, brew uninstallを実行した後.Brewfileを更新する
function brew() {
  command brew "$@"

  case "$1" in
    install|uninstall)
      command brew bundle dump --global --brews --cask --tap -f
      ;;
  esac
}
