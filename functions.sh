function gcd() {
  local dir
  dir=$(ghq list -p | fzf) || return
  cd "$dir"
}

function gcl() {
  git branch | grep -v '*' | xargs git branch -D
}

function aws() {
  if [[ "$1" == "sso" && "$2" == "login" ]]; then
    echo "🆖 aws sso login は禁止されています 🙅" >&2
    return 1
  fi

  command aws "$@"
}

function paws() {
  local args=("$@")
  local has_profile=0
  local i

  for ((i = 1; i <= ${#args}; i++)); do
    case "${args[$i]}" in
      --profile)
        has_profile=1
        break
        ;;
      --profile=*)
        has_profile=1
        break
        ;;
    esac
  done

  if (( has_profile == 0 )); then
    local profile
    profile=$(aws configure list-profiles | fzf -q '!-sso ') || return
    args=("--profile" "$profile" "${args[@]}")
  fi

  aws "${args[@]}"
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
