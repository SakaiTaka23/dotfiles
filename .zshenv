# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# JetBrains
export PATH="$HOME/.jetbrains:$PATH"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Rust
. "$HOME/.cargo/env"
