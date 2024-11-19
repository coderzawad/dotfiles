# 🚀 My Developer Environment Dotfiles

A carefully curated collection of configurations for Neovim, tmux, and Kitty terminal to create a powerful and elegant development environment.

## 📦 What's Inside

- **Neovim**: Modern text editor configuration with plugins and custom keybindings
- **tmux**: Terminal multiplexer setup with productivity enhancements
- **Kitty**: Fast, feature-rich terminal emulator configuration

## 🔧 Prerequisites

Before installation, ensure you have the following:

- Git
- Neovim (version 0.8.0 or higher)
- tmux (version 3.0 or higher)
- Kitty terminal
- A Nerd Font installed (recommended: JetBrainsMono Nerd Font)

## ⚡ Quick Install

```bash
# Clone the repository
git clone https://github.com/coderzawad/dotfiles.git ~/.dotfiles

# Run the install script
cd ~/.dotfiles
./install.sh
```

## 📝 Manual Installation

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
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
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

## 🎨 Customization

### Neovim
- Main configuration file: `~/.config/nvim/init.lua`
- Plugin configurations: `~/.config/nvim/lua/plugins`
- Custom keybindings: `~/.config/nvim/lua/keymaps.lua`

### tmux
- Main configuration: `~/.tmux.conf`
- Custom scripts: `~/.tmux/scripts/`

### Kitty
- Main configuration: `~/.config/kitty/kitty.conf`
- Color scheme: `~/.config/kitty/theme.conf`

## 🔍 Troubleshooting

### Common Issues

1. **Neovim plugins not working**
   - Ensure all prerequisites are installed
   - Run `:checkhealth` in Neovim
   - Update plugins with `:PackerSync`

2. **tmux key bindings not working**
   - Check if TPM is installed
   - Try reloading tmux config with `Ctrl + S (prefix)` + `r`

3. **Kitty rendering issues**
   - Verify that a compatible Nerd Font is installed
   - Check your GPU drivers are up to date

## 📚 Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [tmux Documentation](https://github.com/tmux/tmux/wiki)
- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/)

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for any improvements you make.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
