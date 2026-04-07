# dotfiles

macOS向けのdotfiles管理リポジトリです。

## セットアップ

### 前提

- macOS
- [Homebrew](https://brew.sh/ja/) がインストール済みであること

### インストール & アップデート

スクリプトの内容を事前に確認したい場合:

```bash
curl -fsSL https://raw.githubusercontent.com/yaizuuuu/dotfiles/HEAD/install.sh | less
```

インストール実行:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/yaizuuuu/dotfiles/HEAD/install.sh)"
```

## 管理対象ファイル

| ファイル | リンク先 |
|---|---|
| `.zshrc` | `~/.zshrc` |
| `.Brewfile` | `~/.Brewfile` |
| `.gitconfig` | `~/.gitconfig` |
| `.config/starship.toml` | `~/.config/starship.toml` |
| `.config/ghostty/config` | `~/.config/ghostty/config` |
| `.config/git/ignore` | `~/.config/git/ignore` |
| `AGENTS.md` | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` |
| `.claude/notify.sh` | `~/.claude/notify.sh` |
| `.claude/settings.json` | `~/.claude/settings.json` |

## 注意

- `install.sh` は `gh auth login` が済んでいない場合ログインを促します（ghqでリポジトリをcloneするために必要）
- Google 日本語入力の更新後は、端末の再起動が必要になることがあります
