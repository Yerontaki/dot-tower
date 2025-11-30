#!/usr/bin/env bash
set -e

echo "🚀 Installing dotfiles..."

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup function
backup_if_exists() {
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo -e "${YELLOW}📦 Backing up existing $1${NC}"
        mv "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
    fi
}

# Symlink function
create_symlink() {
    local source="$1"
    local target="$2"
    
    backup_if_exists "$target"
    
    if [ -L "$target" ]; then
        rm "$target"
    fi
    
    mkdir -p "$(dirname "$target")"
    ln -sf "$source" "$target"
    echo -e "${GREEN}✓${NC} Linked: $target -> $source"
}

# Install home dotfiles
echo ""
echo "📂 Installing home dotfiles..."
for file in .bash_execs .bash_profile .bashrc .tmux.conf; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        create_symlink "$DOTFILES_DIR/$file" "$HOME/$file"
    fi
done

# Install .tmux directory
if [ -d "$DOTFILES_DIR/.tmux" ]; then
    create_symlink "$DOTFILES_DIR/.tmux" "$HOME/.tmux"
fi

# Install .config directories
echo ""
echo "⚙️  Installing .config directories..."
if [ -d "$DOTFILES_DIR/.config" ]; then
    for dir in "$DOTFILES_DIR/.config"/*; do
        if [ -d "$dir" ]; then
            dirname=$(basename "$dir")
            create_symlink "$dir" "$HOME/.config/$dirname"
        fi
    done
fi

echo ""
echo -e "${GREEN}✨ Dotfiles installation complete!${NC}"
echo ""
echo "Note: Your old configs were backed up with .backup.TIMESTAMP extension"
echo "Run 'source ~/.bashrc' to reload your shell configuration"
