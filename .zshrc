# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt AUTO_CD
setopt NO_BEEP
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
autoload -U compinit
compinit -u
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

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

alias g='cd $(ghq root)/$(ghq list | fzf)'
alias -g lb='`git branch | fzf --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# bat
alias cat="bat --theme="ansi" --style="numbers,changes,header""

# exa
alias ls="exa --icons"

# rm
alias rm=trash

# tree
alias tree='tree -C -a -I "\.git|node_modules|.next|.dist"'

# Programming

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# npm
export PATH="$HOME/.yarn/bin:$PATH"

# Docker
alias ld='lazydocker'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcb='docker compose build'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dstop='docker stop $(docker ps -q)'
alias dupdate='docker update --restart=no $(docker ps -a -q)'
alias dps='docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
alias dpsa='docker ps -a --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
alias de='docker exec -it $(docker ps | fzf | cut -d " " -f 1) /bin/bash'
alias des='docker exec -it $(docker ps | fzf | cut -d " " -f 1) /bin/sh'

# Go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# lazygit
alias lg='lazygit'

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Kubernetes
alias k="kubectl"

# Java
. ~/.asdf/plugins/java/set-java-home.zsh
