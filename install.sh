#!/bin/bash

# Neovim Dotfiles Installation Script
# Supports Linux and macOS

set -e  # Exit immediately if a command exits with a non-zero status

# ANSI Color Codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Logging functions
log_success() {
    echo -e "${GREEN}[✓] $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}[!] $1${NC}"
}

log_error() {
    echo -e "${RED}[✗] $1${NC}"
    exit 1
}

# Check prerequisites
check_prerequisites() {
    local missing_deps=()

    # Check for essential tools
    command -v git >/dev/null 2>&1 || missing_deps+=("git")
    command -v curl >/dev/null 2>&1 || missing_deps+=("curl")
    command -v unzip >/dev/null 2>&1 || missing_deps+=("unzip")

    # Check Neovim version
    if ! command -v nvim >/dev/null 2>&1; then
        missing_deps+=("neovim")
    else
        NVIM_VERSION=$(nvim --version | head -n 1 | awk '{print $2}')
        REQUIRED_VERSION="0.8.0"
        if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NVIM_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
            log_warning "Neovim version is lower than recommended. Updating is suggested."
        fi
    fi

    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing_deps[*]}. Please install them first."
    fi
}

# Backup existing Neovim config
backup_existing_config() {
    local nvim_config_path="${HOME}/.config/nvim"
    local backup_path="${HOME}/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)"

    if [ -d "$nvim_config_path" ]; then
        log_warning "Existing Neovim configuration found. Creating backup..."
        mv "$nvim_config_path" "$backup_path"
        log_success "Existing config backed up to $backup_path"
    fi
}

# Install Packer (Neovim Plugin Manager)
install_plugin_manager() {
    local packer_path="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"

    if [ ! -d "$packer_path" ]; then
        log_warning "Installing Packer plugin manager..."
        git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_path"
        log_success "Packer installed successfully"
    else
        log_success "Packer is already installed"
    fi
}

# Create symlink to dotfiles
create_config_symlink() {
    local dotfiles_path="${HOME}/.dotfiles/nvim"
    local nvim_config_path="${HOME}/.config/nvim"

    if [ ! -d "$dotfiles_path" ]; then
        log_error "Dotfiles Neovim configuration not found at $dotfiles_path"
    fi

    ln -sfn "$dotfiles_path" "$nvim_config_path"
    log_success "Symlinked Neovim configuration from $dotfiles_path"
}

# Install LSP and Treesitter dependencies
install_additional_dependencies() {
    log_warning "Installing additional Neovim dependencies..."
    
    # List of system-level dependencies
    local dependencies=("nodejs" "npm" "python3" "pip3")
    local missing_system_deps=()

    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            missing_system_deps+=("$dep")
        fi
    done

    if [ ${#missing_system_deps[@]} -ne 0 ]; then
        log_warning "Missing system dependencies: ${missing_system_deps[*]}"
        log_warning "Please install these manually or use your system's package manager"
    fi

    # Python LSP dependencies
    pip3 install --user pynvim debugpy

    # Node LSP dependencies
    npm install -g pyright typescript typescript-language-server

    log_success "Additional dependencies installed"
}

# Sync Neovim Plugins
sync_plugins() {
    log_warning "Syncing Neovim plugins. This might take a few minutes..."
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    log_success "Plugins synchronized successfully"
}

# Main installation function
main() {
    clear
    echo "🚀 Neovim Dotfiles Installer 🚀"
    echo "------------------------------"

    check_prerequisites
    backup_existing_config
    create_config_symlink
    install_plugin_manager
    install_additional_dependencies
    sync_plugins

    echo -e "\n${GREEN}✨ Neovim configuration installed successfully! ✨${NC}"
    echo "Open Neovim and enjoy your new setup!"
}

# Run the installation
main
