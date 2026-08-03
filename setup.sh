#!/usr/bin/env bash
# Dotfiles installer — symlinks tracked configs back into $HOME.
# Usage:  bash setup.sh   (run from anywhere; uses DOTFILES_DIR, defaults to repo)
set -euo pipefail

# Resolve the repo root (handles being invoked from any cwd)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME}"

die() { echo "error: $*" >&2; exit 1; }

link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "  !! $dst exists and is not a symlink — skipping (move it first if you want it replaced)"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  echo "  ✓ $src -> $dst"
}

echo "==> Linking dotfiles from $DOTFILES_DIR"

# ~/.config/* (whole dirs)
link "$DOTFILES_DIR/.config/nvim"  "$HOME_DIR/.config/nvim"
link "$DOTFILES_DIR/.config/kitty" "$HOME_DIR/.config/kitty"

# home files
link "$DOTFILES_DIR/gitconfig" "$HOME_DIR/.gitconfig"
link "$DOTFILES_DIR/zshrc"     "$HOME_DIR/.zshrc"

# helper scripts -> ~/.local/bin
mkdir -p "$HOME_DIR/.local/bin"
for s in "$DOTFILES_DIR"/scripts/*.sh; do
  ln -sfn "$s" "$HOME_DIR/.local/bin/$(basename "$s")"
done
echo "  scripts installed to ~/.local/bin"

echo
echo "Done. Restart your shell (exec zsh) to pick up the new .zshrc."