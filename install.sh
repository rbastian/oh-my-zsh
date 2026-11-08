#!/usr/bin/env bash

# Installation script for zsh configuration files
# This script will create symlinks from your home directory to this repo

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKED_UP=0

# Function to backup and create symlink
backup_and_link() {
    local source="$1"
    local target="$2"

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        echo "Already linked: $target"
        return
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target to ${target}.backup.${TIMESTAMP}"
        mv "$target" "${target}.backup.${TIMESTAMP}"
        BACKED_UP=1
    fi

    echo "Creating symlink: $target -> $source"
    ln -s "$source" "$target"
}

echo "Installing zsh configuration files..."
echo "Repository: $SCRIPT_DIR"
echo ""

# Install main config files
backup_and_link "$SCRIPT_DIR/zshrc" "$HOME/.zshrc"
backup_and_link "$SCRIPT_DIR/zshenv" "$HOME/.zshenv"
backup_and_link "$SCRIPT_DIR/zprofile" "$HOME/.zprofile"

echo ""
echo "✓ Installation complete!"
echo ""
echo "To apply changes, run: source ~/.zshrc"
if [ "$BACKED_UP" -eq 1 ]; then
    echo ""
    echo "Note: Backups of existing files were created with .backup.$TIMESTAMP extension"
fi
