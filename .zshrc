# Set locale
export LANG=en_US.utf8

# Set design of prompt
PROMPT="%n@%m %B%F{green}%~%f%b "

# Set up history file
HISTFILE=$HOME/.zsh_history
# Set max amount of entries in history
HISTSIZE=100000

# Remove duplicate entries from history
setopt hist_ignore_all_dups
# Remove superfluous blanks from history items
setopt hist_reduce_blanks
# Save history items as soon as they are entered
setopt inc_append_history
# Share history between different instances of the shell
setopt share_history

# Automagically correct commands
setopt correct_all
# Automagically list choices on ambiguos completion
setopt auto_list
# Automagically use menu completion
setopt auto_menu

# Select completions with arrow keys
zstyle ':completion:*' menu select
# Group completion results by category
zstyle ':completion:*' group-name ''
# Enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

# Set TTY for GPG
export GPG_TTY=$(tty)

# Attach TMUX on SSH session
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
	tmux attach-session -t tty || tmux new-session -s tty
fi
