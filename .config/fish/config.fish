if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end
#neofetch
#screenfetch
bind \cs '__ethp_commandline_toggle_sudo.fish'

# Alias git
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gs "git status"
alias gl "git log"
set -gx PATH $HOME/.local/bin $PATH
