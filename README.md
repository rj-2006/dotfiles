# Dotfiles

Personal configs for CachyOS — a **niri** + illogical-impulse setup.

## Layout

| Path            | Symlinked to          | What it is                    |
|-----------------|-----------------------|-------------------------------|
| `.config/nvim`  | `~/.config/nvim`      | Neovim (LazyVim) config       |
| `.config/kitty` | `~/.config/kitty`     | Kitty terminal + themes       |
| `.config/codeforces` | `~/.config/codeforces` | Codeforces dark CSS theme (Stylus) |
| `gitconfig`     | `~/.gitconfig`        | Git aliases & identity        |
| `zshrc`         | `~/.zshrc`            | Zsh config, dev aliases       |
| `scripts/`      | `~/.local/bin`        | Dev / env helper scripts      |

## Setup on a new machine

```bash
git clone <your-url> ~/dotfiles
cd ~/dotfiles
bash setup.sh          # creates all the symlinks
exec zsh               # reload shell
```

`setup.sh` is idempotent and safe to re-run — it refuses to overwrite a
non-symlink file.

## Scripts

- `scripts/configure-env.sh` — EDITOR, git aliases, SSH key, dev `cd` aliases.
- `scripts/opencode-fast-dev.sh` — CachyOS bloat/AI-dev-kit cleanup (needs sudo).
- `scripts/finish-caelestia-setup` — (reference only) one-time Caeltia dot installer.

## Notes

- tmux is installed but has no tracked config yet — add `tmux.conf` when ready.
- Runtime/cache files (`zhistory`, `lazy-lock`, generated kitty themes) are
  gitignored.