# Hyprland Dotfiles

This repository contains my personal configuration files (dotfiles) for [Hyprland](https://hyprland.org/), a dynamic tiling Wayland compositor. These configurations are tailored to my workflow and preferences, but feel free to use, modify, or adapt them to suit your needs!

## Overview

This dotfiles repository includes configurations for:
- **Hyprland**: Window manager settings for layouts, keybindings, and aesthetics.
- **Waybar**: A customizable status bar for Hyprland.
- **Wezterm/Kitty**: Terminal emulator configuration.
- **Neovim**: Editor settings for a productive coding environment.
- **Other utilities**: Shell (e.g., Zsh/Bash), prompt(oh-my-posh), and additional tools.

The goal is to create a lightweight, efficient, and visually appealing desktop environment on Hyprland.

## Prerequisites

Before using these dotfiles, ensure you have the following installed:
- [Hyprland](https://hyprland.org/) (latest stable version recommended)
- [Waybar](https://github.com/Alexays/Waybar)
- [Wezterm](https://github.com/wezterm/wezterm)
- [Neovim](https://neovim.io/)
- A Nerd Font (e.g., JetBrains Mono Nerd Font) for icons and glyphs
- Other dependencies listed in `dependencies.txt` (if applicable)

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/IncogCyberpunk/dotfiles.git ~/dotfiles
   ```

2. **Backup existing configurations**: Before proceeding, back up your existing dotfiles to avoid overwriting them:
    ```bash
    mkdir ~/dotfiles-backup
    mv ~/.config/hypr ~/.config/waybar ~/.config/alacritty ~/.config/nvim ~/dotfiles-backup/
    ```

3. **Symlink the dotfiles**: Create symbolic links to the configurations in this repository:
    ```bash
    ln -sf ~/dotfiles/hypr ~/.config/hypr
    ln -sf ~/dotfiles/waybar ~/.config/waybar
    ln -sf ~/dotfiles/wezterm ~/.config/wezterm
    ln -sf ~/dotfiles/kitty ~/.config/kitty
    ln -sf ~/dotfiles/nvim ~/.config/nvim
    ln -sf ~/dotfiles/tmux ~/.config/tmux
    ```

4. **Restart Hyprland**: Log out and log back in, or restart Hyprland to apply the changes:
    ```bash
    hyprctl dispatch exit
    ```

## Structure
```
dotfiles/
├── hypr/                # Hyprland configuration
├── waybar/              # Waybar configuration
├── alacritty/           # Alacritty terminal settings
├── nvim/                # Neovim configuration
├── scripts/             # Custom scripts for automation
└── README.md            # This file
```

## Customization

- **Hyprland** : Edit ~/.config/hypr/hyprland.conf to tweak keybindings, window rules, or animations.
- **Waybar** : Modify ~/.config/waybar/config and ~/.config/waybar/style.css for custom modules and styling.
- **Wezterm** : Adjust ~/.config/wezterm/wezterm.lua for font, colors, or other terminal settings.
- **Neovim** : Customize ~/.config/nvim/init.lua or other Lua files for plugins and keymaps.

## Keybindings
```
Some notable keybindings in this setup (check hypr/hyprland.conf for the full list):
```
- SUPER + R/Enter: Open Wezterm
- SUPER + Q: Close focused window
- SUPER + H/J/K/L: Switch between windows

## Contributing
```
If you find issues or have suggestions, feel free to open an issue or submit a pull request on the GitHub repository.
```

## License
```
This repository is licensed under the GNU GPL-3.0 License. Feel free to use and modify these dotfiles as you see fit.
```

## Acknowledgments
```
Inspired by various dotfile repositories and the Hyprland community.
Thanks to the developers of Hyprland, Neovim,  Waybar & Wezterm for their amazing tools.
```
