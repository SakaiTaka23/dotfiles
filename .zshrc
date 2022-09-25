# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

alias g='cd $(ghq root)/$(ghq list | fzf --reverse)'

# bat
alias cat="bat --theme="ansi" --style="numbers,changes,header""

# exa
alias ls="exa --icons"

# rm
alias rm=trash

# tree
alias tree='tree -a -I "\.git|node_modules|.next|.dist"'

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
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
alias des='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/sh'

# Go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# lazygit
alias lg='lazygit'

# OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Kubernetes
alias k="kubectl"
