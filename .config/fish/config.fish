# SSH agent
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
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
set -gx EDITOR nvim
# path
set -gx PATH ~/.local/bin ~/.cargo/bin $PATH
# term 
# Let TERM be set by resp. terminal
#set -gx TERM xterm-256color

# Load fishmarks (http://github.com/techwizrd/fishmarks)
source $__fish_config_dir/functions/marks.fish

# Make tmux play nicely with colors.
# Also needs `set -g default-terminal "screen-256color"`
# in tmux.conf
alias tmux "env TERM=screen-256color tmux"
alias wiki "ddgr --np --gb !w $argv[1]"
alias ddg "ddgr --np --gb !duckduckgo $argv[1]"
alias vim "nvim"
alias mutt "neomutt"

### GIT PROMPT CONFIGURATION
# See the file /usr/share/fish/functions/fish_git_prompt.fish
# (echo $fish_function_path)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'yes'
# Define gitprompt colors
set -l gitprompt_orange 'f98912'
# Set colors
set __fish_git_prompt_color_dirtystate blue
set __fish_git_prompt_color_invalidstate $gitprompt_orange
set __fish_git_prompt_color_stagedstate red
set __fish_git_prompt_color_cleanstate green
#set __fish_git_prompt_color_branch
#set __fish_git_prompt_color_untrackedfiles
#set __fish_git_prompt_color_stashstate
#set __fish_git_prompt_color_upstream
#set __fish_git_prompt_color
