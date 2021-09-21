if not set -q __GIT_PROMPT_DIR
    set __GIT_PROMPT_DIR ~/.DOTFILES_RESOURCES/gitprompt
end

# Base16 Shell
#if status --is-interactive
#    set BASE16_SHELL "$HOME/.config/base16-shell/"
#    source "$BASE16_SHELL/profile_helper.fish"
#end

# vault
set -gx VAULT_ADDR https://vault.se.axis.com
# Ansible
set -gx ANSIBLE_PIPELINING True
set -gx ANSIBLE_VAULT_PASSWORD_FILE ~/.ansible_vault_pass
# editor
set -gx EDITOR vim
# path
set -gx PATH /sbin /usr/sbin /usr/local/sbin /home/gorane/.local/bin $PATH
# term 
# Let TERM be set by resp. terminal
#set -gx TERM xterm-256color
# Colors
# Reset
set ResetColor (set_color normal)       # Text Reset

# Regular Colors
set Red (set_color red)                 # Red
set Yellow (set_color yellow);          # Yellow
set Blue (set_color blue)               # Blue
set WHITE (set_color white)

# Bold
set BGreen (set_color -o green)         # Green

# High Intensty
set IBlack (set_color -o black)         # Black

# Bold High Intensty
set Magenta (set_color -o purple)       # Purple

# Appearance of the git prompt.
set GIT_PROMPT_PREFIX "["
set GIT_PROMPT_SUFFIX "]"
set GIT_PROMPT_SEPARATOR "|"
set GIT_PROMPT_BRANCH "$Magenta"
set GIT_PROMPT_STAGED "$Red● "
set GIT_PROMPT_CONFLICTS "$Red✖ "
set GIT_PROMPT_CHANGED "$Blue✚ "
set GIT_PROMPT_REMOTE " "
set GIT_PROMPT_UNTRACKED "…"
set GIT_PROMPT_STASHED "⚑ "
set GIT_PROMPT_CLEAN "$BGreen✔"

# Make tmux play nicely with colors.
# Also needs `set -g default-terminal "screen-256color"`
# in tmux.conf
alias tmux "env TERM=screen-256color tmux"

