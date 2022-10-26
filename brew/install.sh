#!/bin/zsh

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if [[ "$(uname -m)" == arm64 ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      eval "$(/usr/local/bin/brew shellenv)"
fi

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade

echo "installing..."
brew bundle
brew bundle cleanup

echo "brew installed!!!"
