setopt AUTO_CD
setopt NO_BEEP
setopt hist_ignore_dups
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
autoload -Uz compinit && compinit

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# fzf
export FZF_DEFAULT_COMMAND='--files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='
--height 60%
--reverse
--border
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# intellij
export PATH="$HOME/.jetbrains:$PATH"

# Java
. ~/.asdf/plugins/java/set-java-home.zsh

# npm
export PATH="$HOME/.yarn/bin:$PATH"

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Rust
. "$HOME/.cargo/env"
