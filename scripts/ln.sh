#!/bin/zsh

DOTPATH="${HOME}/dotfiles"

ln -s "$DOTPATH"/nvim "$HOME/.config/nvim" &&
    ln -s "$DOTPATH"/.gitconfig "$HOME/.gitconfig" &&
    ln -s "$DOTPATH/.zprofile" "$HOME/.zprofile" &&
    ln -s "$DOTPATH/.zshenv" "$HOME/.zshenv" &&
    ln -s "$DOTPATH/.zshrc" "$HOME/.zshrc" &&
    ln -s "$DOTPATH/.omp.toml" "$HOME/.omp.toml" &&
    ln -s "$DOTPATH/code/settings.json" "$HOME/Library/Application\ Support/Code/User/settings.json" &&
    ln -s "$DOTPATH/code/keybindings.json" "$HOME/Library/Application\ Support/Code/User/keybindings.json" &&
    ln -s "$DOTPATH/hammerspoon" "$HOME/.hammerspoon" &&
    ln -s "$DOTPATH/ghostty/config" "$HOME/.config/ghostty/config" &&
    ln -s "$DOTPATH/lazygit/config.yml" "$HOME/.config/lazygit/config.yml" &&
    ln -s "$DOTPATH/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf" &&
    ln -s "$DOTPATH/nvim" "$HOME/.config" &&
    ln -s "$DOTPATH/yazi" "$HOME/.config"

# For tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# yazi dependency install
ya pkg install
