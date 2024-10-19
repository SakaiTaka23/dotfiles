#!/bin/zsh

DOTPATH="${HOME}/dotfiles"

ln -s "$DOTPATH"/nvim "$HOME/.config/nvim" &&
    ln -s "$DOTPATH"/.gitconfig "$HOME/.gitconfig" &&
    ln -s "$DOTPATH/.p10k.zsh" "$HOME/.p10k.zsh" &&
    ln -s "$DOTPATH/.zprofile" "$HOME/.zprofile" &&
    ln -s "$DOTPATH/.zshrc" "$HOME/.zshrc" &&
    ln -s "$DOTPATH/wezterm/.wezterm.lua" "$HOME/.wezterm.lua" &&
    ln -s "$DOTPATH/.omp.toml" "$HOME/.omp.toml" &&
    ln -s "$DOTPATH/hammerspoon" "$HOME/.hammerspoon/init.lua"
