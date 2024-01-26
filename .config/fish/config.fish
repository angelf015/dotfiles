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

starship init fish | source

#et -gx PATH $PATH ~/.sdkman/bin

#set -gx PATH $HOME/.sdkman/bin/sdkman-init.sh
#set -gx PATH $PATH ~/.sdkman/candidates/java/18.0.1-open/bin/
set -gx PATH $HOME/.config/vifm/ $PATH
#alias vifm vifmrun
# Input prompt of fuzzy searcher
set -g FONTPREVIEW_SEARCH_PROMPT "❯ "

# Size of the font preview window
set -g FONTPREVIEW_SIZE 532x365

# The position where the font preview window should be displayed
set -g FONTPREVIEW_POSITION "+0+0"

# Font size
set -g FONTPREVIEW_FONT_SIZE 38

# Background color of the font preview window
set -g FONTPREVIEW_BG_COLOR "#1e1e2e"

# Foreground color of the font preview window
set -g FONTPREVIEW_FG_COLOR "#f38ba8"
set -gx PATH $HOME/.config/emacs/bin $PATH

