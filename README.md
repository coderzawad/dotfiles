# 🚀 My Developer Environment Dotfiles

A carefully curated collection of configurations for Neovim, tmux, and Kitty terminal to create a powerful and elegant development environment.

## 📦 What's Inside

- **Neovim**: Modern text editor configuration with plugins and custom keybindings
- **tmux**: Terminal multiplexer setup with productivity enhancements
- **Kitty**: Fast, feature-rich terminal emulator configuration
- **Yabai**: A tiling window manager for MacOS
- **Skhd**: Shortcut deamon to use shortcuts for yabai
- **Alacritty**: Fast, Aesthetic terminal emulator written in rust.
- **Iterm2**: Mid, Bigginer friendly terminal emulator.
- **Starship**: Fast, oh-my-zsh alternative and its built on rust btw! 🗿 

## 🔧 Prerequisites

Before installation, ensure you have the following:

- Git
- Neovim (version 0.8.0 or higher)
- tmux (version 3.0 or higher)
- Kitty terminal
- A Nerd Font installed (recommended: MelsoLGS Nerd Font)

## 📝 Installation

### Neovim Setup

1. Backup your existing config (if any):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Create symbolic links:
```bash
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

### tmux Setup

1. Backup existing tmux configuration:
```bash
mv ~/.tmux.conf ~/.tmux.conf.backup
```

2. Create symbolic link:
```bash
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
```

3. Install tmux plugin manager (TPM):
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


4. Load tmux and install plugins:
Press `prefix` + `I` (capital i) to install plugins

### Kitty Setup

1. Backup existing Kitty config:
```bash
mv ~/.config/kitty ~/.config/kitty.backup
```

2. Create symbolic link:
```bash
ln -s ~/.dotfiles/kitty ~/.config/kitty
```

## 🔍 Troubleshooting

### Common Issues


1. **tmux key bindings not working**
   - Check if TPM is installed
   - Try reloading tmux config with `Ctrl + S (prefix)` + `r`

2. **Kitty rendering issues**
   - Verify that a compatible Nerd Font is installed (MelsoLGS NF is recommended)
   - Check your GPU drivers are up to date

## 📚 Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [tmux Documentation](https://github.com/tmux/tmux/wiki)
- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/)

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for any improvements you make.
