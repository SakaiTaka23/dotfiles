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

# peco
# ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# gでgitリポジトリ表示
alias g='cd /Users/fumi/Downloads/$(ghq list | peco)'
function peco-ghq-look () {
    local ghq_roots="$(git config --path --get-all ghq.root)"
    local selected_dir=$(ghq list --full-path | \
        xargs -I{} ls -dl --time-style=+%s {}/.git | sed 's/.*\([0-9]\{10\}\)/\1/' | sort -nr | \
        sed "s,.*\(${ghq_roots/$'\n'/\|}\)/,," | \
        sed 's/\/.git//' | \
        peco --prompt="cd-ghq >" --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq list --full-path | grep --color=never -E "/$selected_dir$")"
        zle accept-line
    fi
}
zle -N peco-ghq-look
bindkey '^G' peco-ghq-look

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
