#!/usr/bin/env bash

# Installation script for zsh configuration files
# This script will create symlinks from your home directory to this repo

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Function to backup and create symlink
backup_and_link() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target to ${target}.backup.${TIMESTAMP}"
        mv "$target" "${target}.backup.${TIMESTAMP}"
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

# Create .zsh directory if it doesn't exist
if [ ! -d "$HOME/.zsh" ]; then
    echo "Creating $HOME/.zsh directory"
    mkdir -p "$HOME/.zsh"
fi

# Install git completion
backup_and_link "$SCRIPT_DIR/zsh/_git" "$HOME/.zsh/_git"

echo ""
echo "✓ Installation complete!"
echo ""
echo "To apply changes, run: source ~/.zshrc"
echo ""
echo "Note: Backups of existing files were created with .backup.$TIMESTAMP extension"
