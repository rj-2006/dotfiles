#!/usr/bin/env bash
set -euo pipefail

echo "=== CachyOS Dev Kit - Bloat Removal ==="
echo

if [[ $EUID -ne 0 ]]; then
   echo "This script needs sudo."
   exec sudo bash "$0" "$@"
fi

# ─── EDITORS (remove ALL except neovim) ───
echo "[1/4] Removing extra code editors..."
pacman -Rns --noconfirm geany code vim micro zed windsurf gnome-text-editor 2>/dev/null || true

# ─── UNUSED WMs (keep niri only) ───
echo "[2/4] Removing unused window managers..."
pacman -Rns --noconfirm bspwm sxhkd hyprland illogical-impulse-hyprland \
  grimblast-git waybar polybar rofi dunst i3lock-color \
  nwg-dock-hyprland nwg-displays nwg-look 2>/dev/null || true

# ─── MEDIA / COMMUNICATION ───
echo "[3/4] Removing extra media apps and old chat clients..."
pacman -Rns --noconfirm vlc vlc-plugins-all obs-studio easyeffects \
  discord vencord 2>/dev/null || true

# ─── MISC BLOAT (safe removals) ───
echo "[4/4] Removing misc bloat..."
pacman -Rns --noconfirm perl-image-exiftool ffmpegthumbnailer tumbler poppler-glib \
  s-nail octopi xdg-desktop-portal-gnome xdg-desktop-portal-hyprland \
  plasma-browser-integration plasma-workspace plasma-nm plasma-integration \
  kde-cli-tools kdialog polkit-kde-agent 2>/dev/null || true

# Clean orphans
echo ">>> Cleaning orphaned dependencies..."
pacman -Rns --noconfirm $(pacman -Qdtq 2>/dev/null) 2>/dev/null || true

# Clean package cache
echo ">>> Cleaning package cache..."
pacman -Scc --noconfirm 2>/dev/null || true

echo
echo "=== Done ==="
echo "Remaining disk: $(df -h / | awk 'NR==2{print $4}') free"
echo
echo "Kept: niri + rice (inir/illogical-impulse), mpv (media), libreoffice,"
echo "      obsidian, AI CLIs (codex/gemini/opencode), decorative tools,"
echo "      all icons/themes, ollama models, all project files."
echo
echo "Re-run anything you need later with:"
echo "  sudo pacman -S <package>"
