# vault # move this to local config
set -gx VAULT_ADDR https://vault.se.axis.com
# Ansible
set -gx ANSIBLE_PIPELINING True
set -gx ANSIBLE_VAULT_PASSWORD_FILE ~/.ansible_vault_pass
# Load local config
if [ -f $HOME/.config/fish/local_config.fish ]
    source $HOME/.config/fish/local_config.fish
end

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
# Bold Colors
set BGreen (set_color -o green)         # Green
# High Intensty
set IBlack (set_color -o black)         # Black
# Bold High Intensty
set Magenta (set_color -o purple)       # Purple

# Appearance of the git prompt.
#set GIT_PROMPT_PREFIX "["
#set GIT_PROMPT_SUFFIX "]"
#set GIT_PROMPT_SEPARATOR "|"
#set GIT_PROMPT_BRANCH "$Magenta"
#set GIT_PROMPT_STAGED "$Red● "
#set GIT_PROMPT_CONFLICTS "$Red✖ "
#set GIT_PROMPT_CHANGED "$Blue✚ "
#set GIT_PROMPT_REMOTE " "
#set GIT_PROMPT_UNTRACKED "…"
#set GIT_PROMPT_STASHED "⚑ "
#set GIT_PROMPT_CLEAN "$BGreen✔"

# Make tmux play nicely with colors.
# Also needs `set -g default-terminal "screen-256color"`
# in tmux.conf
alias tmux "env TERM=screen-256color tmux"

### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/fish_git_prompt.fish
#
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'yes'

#set -l cl_empress '757575'
#set -l cl_gainsboro 'E0E0E0'
#set -l cl_dodger_blue '297EF2'
#set -l cl_gorse 'FFEB3B'
#set -l cl_red_orange 'F52D2D'
#set __fish_git_prompt_color_branch $cl_gorse -b $cl_empress
#set __fish_git_prompt_color_dirtystate $cl_dodger_blue -b $cl_gainsboro
#set __fish_git_prompt_color_invalidstate $cl_red_orange -b $cl_gainsboro
#set __fish_git_prompt_color_stagedstate $cl_dodger_blue -b $cl_gainsboro
#set __fish_git_prompt_color_cleanstate $cl_dodger_blue -b $cl_gainsboro
#set __fish_git_prompt_color_stashstate $cl_dodger_blue -b $cl_gainsboro
#set __fish_git_prompt_color_upstream $cl_gainsboro -b $cl_empress
#set __fish_git_prompt_color_untrackedfiles $cl_dodger_blue -b $cl_gainsboro
#set __fish_git_prompt_color $cl_gainsboro -b $cl_empress
#
#set __fish_git_prompt_char_cleanstate '  '
#set __fish_git_prompt_char_dirtystate '  '
#set __fish_git_prompt_char_invalidstate '  '
#set __fish_git_prompt_char_stagedstate '  '
#set __fish_git_prompt_char_stashstate '  '
#set __fish_git_prompt_char_stateseparator ' '
#set __fish_git_prompt_char_untrackedfiles '  '
#set __fish_git_prompt_char_upstream_ahead '  '
#set __fish_git_prompt_char_upstream_behind '  '
#set __fish_git_prompt_char_upstream_diverged '  '
#set __fish_git_prompt_char_upstream_equal '  '
#set __fish_git_prompt_char_upstream_prefix ' '
