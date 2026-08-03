#!/usr/bin/env bash
set -euo pipefail

echo "=== Configuring Dev Environment ==="

# ─── SET EDITOR ───
echo ">>> Setting EDITOR to nvim..."
if grep -q 'export EDITOR' ~/.zshrc; then
  sed -i "s/export EDITOR='geany'/export EDITOR='nvim'/" ~/.zshrc
  sed -i "s/export VISUAL=\"\${EDITOR}\"/export VISUAL='nvim'/" ~/.zshrc
else
  echo "export EDITOR='nvim'" >> ~/.zshrc
  echo "export VISUAL='nvim'" >> ~/.zshrc
fi

# ─── GIT ALIASES ───
echo ">>> Setting git aliases..."
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all --decorate"
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.df diff
git config --global alias.dfc "diff --cached"
git config --global push.autoSetupRemote true

# ─── SSH KEY ───
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo ">>> Generating SSH key..."
  ssh-keygen -t ed25519 -C "keturahu295@gmail.com" -N "" -f ~/.ssh/id_ed25519
  echo "SSH public key:"
  cat ~/.ssh/id_ed25519.pub
else
  echo ">>> SSH key already exists at ~/.ssh/id_ed25519"
fi

# ─── DEV ALIASES ───
echo ">>> Adding dev aliases to ~/.zshrc..."
cat >> ~/.zshrc << 'EOF'

# Dev shortcuts
alias dev="cd ~/dev"
alias devgo="cd ~/dev/go"
alias devrs="cd ~/dev/rust"
alias devcpp="cd ~/dev/cpp"
alias devlab="cd ~/dev/labs"
alias gst="git status"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --all --decorate"
EOF

echo
echo "=== Environment configured! ==="
echo "Run: source ~/.zshrc"
echo
echo "Add your SSH key to GitHub:"
cat ~/.ssh/id_ed25519.pub 2>/dev/null || echo "(generate with: ssh-keygen -t ed25519 -C 'keturahu295@gmail.com')"
