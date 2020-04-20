# Set locale
export LANG=en_US.utf8

# Enable ls colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Setup ls colors
if [[ -z "$LS_COLORS" ]]; then
	(( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

# Link ls for color support
ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

# Set design of prompt
PROMPT="%(?:%n@%m %B%F{green}%~%f%b :%n@%m %B%F{red}%~%f%b )"

# Set up history file
HISTFILE=~/.zsh_history
# Set max amount of entries in history
SAVEHIST=1000

# Bind arrow up and down to search history based on entered text
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Remove duplicate entries from history
setopt hist_ignore_all_dups
# Remove superfluous blanks from history items
setopt hist_reduce_blanks
# Save history items as soon as they are entered
setopt inc_append_history
# Share history between different instances of the shell
setopt share_history

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
# Take advantage of $LS_COLORS for completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Source plugins
source ~/.zsh_plugins/zsh-z/zsh-z.plugin.zsh

# Enable tab completion
autoload -U compinit && compinit

# Set TTY for GPG
export GPG_TTY=$(tty)

# Set path for GoLang environment
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
