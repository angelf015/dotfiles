# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Generic
export LANG=es_MX.UTF-8
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
ZSH_THEME=""

# autoload -Uz compinit
# compinit
# zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
zstyle ':completion:*' menu select

# Añadir rutas al PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"

bindkey '^L' clear-screen
bindkey -v

export PATH="/opt/homebrew/bin:$PATH"

# Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi


export PATH="$PATH:/usr/local/bin/nvim"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
# EZA (mejor alternativa a ls)
alias ls='eza --icons'
alias ll='eza -l --icons --git'
alias la='eza -la --icons --git'
alias lt='eza -l --icons --git --sort=modified --reverse'
alias tree='eza --tree --icons'
alias treea='eza --tree --icons -a'
alias lsize='eza -l --icons --sort=size --reverse'
alias ldir='eza -D --icons'
alias lfile='eza -f --icons'

# Otros aliases
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias y=yazi
alias lvim='NVIM_APPNAME=nvim-alt nvim'
alias mvim='NVIM_APPNAME=mvim nvim'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


mkcd() {
  mkdir -p "$1" && cd "$1"
}


# bun completions
[ -s "/Users/arch/.bun/_bun" ] && source "/Users/arch/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(zoxide init zsh)"
# eval "$(zellij setup --generate-auto-start zsh)"

# opencode
export PATH=/Users/arch/.opencode/bin:$PATH
