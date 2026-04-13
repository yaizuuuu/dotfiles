
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"


# envs
export PATH="${HOME}/.local/bin:$PATH"
export AWS_VAULT_KEYCHAIN_NAME="login"

# customize
eval "$(starship init zsh)"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/Projects/ghq/github.com/rupa/z/z.sh
source $HOME/Projects/ghq/github.com/yaizuuuu/dotfiles/aliases.sh
source $HOME/Projects/ghq/github.com/yaizuuuu/dotfiles/functions.sh

# anyenv
eval "$(anyenv init -)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="${HOME}/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# Safe-chain
source $HOME/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
