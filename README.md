<div align="center">

# 🌌 Arch Linux Dotfiles - Hyprland (Tokyo Night)

![preview](https://github.com/vitorhugo-chav/Dotfiles/assets/68597368/3b2f8a49-9f7a-4a25-83c7-10ee7609a320)

</div>

Welcome to my personal configuration files for Arch Linux, meticulously crafted for a seamless and productive experience on the Hyprland compositor. This setup is defined by its consistent **Tokyo Night** color scheme and a strong focus on keyboard-driven workflows.

---

## 🛠️ Configuration Details

| Component       | Application                                 | Description                                  |
| --------------- | ------------------------------------------- | -------------------------------------------- |
| **OS**          | `Arch Linux`                                | The base system.                             |
| **WM**          | `Hyprland`                                  | A dynamic tiling Wayland compositor.         |
| **Bar**         | `Waybar`                                    | A highly customizable Wayland status bar.    |
| **Shell**       | `Fish`                                      | A smart and user-friendly command-line shell.|
| **Terminal**    | `Kitty`                                     | A fast, feature-rich, GPU-based terminal.    |
| **Launcher**    | `Rofi`                                      | A versatile application launcher and switcher.|
| **Lock Screen** | `hyprlock`                                 | A modern and efficient screen locker for Hyprland.|
| **Editor**      | `Neovim`                                    | A hyperextensible, Vim-based text editor.    |
| **Notifications**| `swaync`                                   | A customizable notification daemon for Wayland.|
| **File Manager**| `Dolphin`                                   | KDE's powerful and extensible file manager.  |
| **PDF Viewer**  | `Zathura`                                   | A minimalist, Vim-like document viewer.      |
| **Theme**       | `Tokyo Night`                               | A clean, dark theme used across all components.|
| **Prompt**      | `Oh My Posh`                                | A themeable and powerful prompt engine.      |
| **File Search** | `fzf` + `fd`                                | A command-line fuzzy finder and file searcher.|
| **File Preview**| `bat` + `eza`                               | A cat clone with syntax highlighting and a modern `ls` replacement.|

---

## 📦 Requirements

Before you begin, ensure your system is up-to-date and you have an AUR helper like `yay` or `paru` installed.

### Official Repositories

```bash
sudo pacman -S --needed \
hyprland waybar rofi-wayland kitty fish neovim swaync \
ttf-jetbrains-mono-nerd noto-fonts-emoji polkit-gnome \
brightnessctl playerctl dolphin firefox zathura zathura-pdf-mupdf \
eza bat fzf fd zoxide oh-my-posh mariadb wl-clipboard cliphist \
swww kanshi hypridle ddcutil pavucontrol blueman networkmanager \
pipewire pipewire-pulse wireplumber qt6ct ttf-font-awesome hyprshot
```

### AUR (Arch User Repository)

```bash
yay -S --needed hyprlock-git pokemon-colorscripts-git
```

**Note:** A [Nerd Font](https://www.nerdfonts.com/) (like `ttf-jetbrains-mono-nerd`) is **essential** for icons to render correctly in the bar, terminal, and menus.

---

## 🚀 Installation

1.  **Clone the Repository**

    Clone this repository to a directory of your choice.

    ```bash
    git clone https://github.com/vitorhugo-chav/Dotfiles.git ~/Dotfiles
    ```

2.  **Symlink Configurations**

    It's recommended to use a tool like `stow` to manage your dotfiles, but you can also copy the files manually.

    *   **Copying (Simple Method):**
        ```bash
        # BE CAREFUL: This will overwrite existing configurations.
        cp -r ~/Dotfiles/.config/* ~/.config/
        ```

3.  **Make Scripts Executable**

    Ensure that any custom scripts have the necessary permissions.

    ```bash
    chmod +x ~/.config/rofi/powermenu.sh
    ```

4.  **Set Fish as Default Shell**
    ```bash
    chsh -s /usr/bin/fish
    ```

5.  **Install Fish Plugins**

    Launch `fish` and run `fisher` to install the plugins listed in `fish_plugins`:
    ```fish
    fisher
    ```

---

## ⌨️ Keybindings (Highlights)

This setup is heavily reliant on keyboard shortcuts. Here are some of the most important ones:

| Key Combination         | Action                                     |
| ----------------------- | ------------------------------------------ |
| `SUPER + Return`        | Open Terminal (`kitty`)                    |
| `SUPER + E`             | Open File Manager (`dolphin`)              |
| `SUPER + B`             | Open Browser (`firefox`)                   |
| `SUPER + C`             | Open Editor (`nvim`)                       |
| `SUPER + Space`         | Open App Launcher (`rofi`)                 |
| `SUPER + V`             | Show Clipboard History (`rofi`)            |
| `SUPER + SHIFT + Q`     | Close Active Window                        |
| `SUPER + F`             | Toggle Floating Window                     |
| `SUPER + SHIFT + F`     | Toggle Fullscreen                          |
| `SUPER + M`             | Exit Hyprland Session                      |
| `SUPER + L`             | Lock Screen (`hyprlock`)                   |
| `SUPER + Escape`        | Open Power Menu (Shutdown, Reboot, etc.)   |
| `SUPER + Print`         | Region Screenshot (saves to file)          |
| `SUPER + SHIFT + Print` | Region Screenshot (copies to clipboard)    |
| `SUPER + [1-9]`         | Switch to Workspace 1-9                    |
| `SUPER + SHIFT + [1-9]` | Move Active Window to Workspace 1-9        |
| `SUPER + [←↑→↓]`      | Move Focus between Windows                 |

---

## 🎨 Theming

*   **Global Theme:** [Tokyo Night](https://github.com/folke/tokyonight.nvim)
*   **Icons:** [Nerd Fonts](https://www.nerdfonts.com/) (JetBrains Mono) and Font Awesome.
*   **Wallpaper:** Managed by `swww` and `waypaper`. The default wallpaper is included in the repository.

---

## 🤝 Contributing

Feel free to fork this repository, open issues, or submit pull requests if you have suggestions for improvements or new features!
</div>