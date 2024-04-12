alias g='cd $(ghq root)/$(ghq list | fzf)'
alias -g lb='`git branch | fzf --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# bat
alias cat="bat --theme="ansi" --style="numbers,changes,header""

# exa
alias ls="eza --icons"

# rm
alias rm=trash

# tree
alias tree='tree -C -a -I "\.git|node_modules|.next|.dist"'

# Docker
alias ld='lazydocker'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcb='docker compose build'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dstop='docker stop $(docker ps -q)'
alias dps='docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
alias dpsa='docker ps -a --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.RunningFor}}"'
alias de='docker exec -it $(docker ps | fzf | cut -d " " -f 1) /bin/bash'
alias des='docker exec -it $(docker ps | fzf | cut -d " " -f 1) /bin/sh'

# lazygit
alias lg='lazygit'

# Kubernetes
alias k="kubectl"
