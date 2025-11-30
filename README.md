# 🏰 dot-tower

My personal dotfiles for Arch Linux with niri compositor.

## 🎨 Theme

**Catppuccin Frappe** everywhere!

## 📦 What's included

### Shell
- `.bashrc` - Bash configuration
- `.bash_profile` - Bash profile
- `.bash_execs` - Bash executable scripts
- `starship.toml` - Starship prompt configuration

### Terminal & Tools
- `ghostty/` - Ghostty terminal emulator
- `tmux/` - Tmux configuration
- `nvim/` - Neovim configuration
- `yazi/` - Yazi file manager
- `btop/` - System monitor
- `cava/` - Audio visualizer
- `mpv/` - Media player
- `ripgrep/` - Ripgrep config

### Window Manager & UI
- `niri/` - Niri compositor configuration
- `waybar/` - Status bar
- `rofi/` - Application launcher
- `mako/` - Notification daemon

### Applications
- `qutebrowser/` - Browser configuration
- `obs-studio/` - OBS themes
- `zed/` - Zed editor
- `imv/` - Image viewer

### System
- `gtk-3.0/`, `gtk-4.0/` - GTK themes
- `xdg-desktop-portal/` - Portal configuration
- `yay/` - AUR helper configuration

## 🚀 Quick Install

```bash
git clone https://github.com/Yerontaki/dot-tower.git
cd dot-tower
./install.sh
```

The script will:
- ✅ Create symlinks to all configs
- ✅ Backup existing configs with `.backup.TIMESTAMP`
- ✅ Work on any machine without hardcoded paths

## 🔄 Update

```bash
cd dot-tower
git pull
```

Changes will apply immediately since configs are symlinked!

## 📝 Notes

- All configs use `~/` or `$HOME` - no hardcoded paths
- Catppuccin Frappe theme throughout
- Optimized for Arch Linux + niri
- Wayland-native setup

## 🛠️ Requirements

- Arch Linux
- niri compositor
- Packages: ghostty, nvim, qutebrowser, waybar, rofi, mako, yazi, btop, mpv, etc.

---

**Theme:** Catppuccin Frappe 🌙
