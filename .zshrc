#  _________  _   _
# |__  / ___|| | | |
#   / /\___ \| |_| |
#  / /_ ___) |  _  |
# /____|____/|_| |_|
#


#
# EXPORT
#
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export EDITOR=nvim
export ZPLUG_HOME="${XDG_DATA_HOME}/.zplug"
export ZPLUG_BIN="${ZPLUG_HOME}/bin"
export ZPLUG_REPOS="${ZPLUG_HOME}/repos"
export ZPLUG_CACHE_DIR="${ZPLUG_HOME}/cache"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# PLUGINS
#
source "${ZPLUG_HOME}"/init.zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "b4b4r07/enhancd", from:github
zplug "mafredri/zsh-async", from:github
zplug "darvid/zsh-poetry", from:github

# Install plugins if plugins exist that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to PATH
zplug load


#
# HISTORY
#
HISTFILE="${XDG_CACHE_HOME}"/.zsh_history
HISTCONTROL=ignoreboth  # don't save duplicate lines or lines starting with space
HISTSIZE=10000
HISTFILESIZE=5000
SAVEHIST=1000


#
# SHELL CONFIG
#
setopt autocd 				# change to given directory
setopt append_history # do not overwrite history

# Use emacs-like keybindings
bindkey -e

# Basic auto/tab completion
autoload -Uz compinit & compinit -u
_comp_options+=(globdots)
zstyle ':completion:*' menu select
zstyle :compinstall filename '${HOME}/.zshrc'

# Enable starship prompt 
eval "$(starship init zsh)"

# Select man pages color
less_termcap[md]="${fg_bold[blue]}"

# Enable zsh syntax highlighting and autosuggestions
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load colorscheme
(cat ~/.cache/wal/sequences &) 

# Load neofetch
neofetch 

# Enable pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


#
# ALIASES
#
alias vim='nvim'
alias ema='emacs -nw'

# Moving around
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ls='exa -l --group-directories-first --icons'
alias la='exa -la --group-directories-first --icons'
alias lt='exa -aT --group-directories-first --icons'

# Colorful commands
alias df='duf -hide special -output mountpoint,size,used,avail,usage,type'
alias ccat='bat'
alias du='ncdu -rx --exclude .git'
alias grep='grep --color=auto'
alias pping='prettyping --nolegend'
alias wget="wget --hsts-file=${XDG_CACHE_HOME}/wget-hsts"

# History search
alias h='history'
alias hs='history | grep'

# Bare repo
alias config="git --git-dir=${HOME}/Work/dev/dots --work-tree=${HOME}"

# Python
alias pip='pip3'
alias python='python3'


#
# PATH
#
USR_LOCAL="/usr/local"
OPT_LOCAL="/opt/local"
LOCAL_HOME="${HOME}/.local"
LOCAL_OPT="${LOCAL_HOME}/opt"

# Add opt local binaries to PATH
if [ -d "${OPT_LOCAL}/bin" ]; then
    PATH="${OPT_LOCAL}/bin:${PATH}"
fi

# Add user executables to PATH
if [ -d "${LOCAL_HOME}/bin" ]; then
  PATH="${LOCAL_HOME}/bin:${PATH}"
fi

# GNU coreutils
PATH="${USR_LOCAL}/opt/coreutils/libexec/gnubin:${PATH}"

# Java
JAVA_HOME="${LOCAL_OPT}/java"
PATH="${JAVA_HOME}/bin:${PATH}"

# Scala
PATH="${LOCAL_OPT}/scala/bin:${PATH}"

# ScalaTIKZ
PATH="${LOCAL_OPT}/scalatikz/bin:${PATH}"

# Add native libraries
DYLD_LIBRARY_PATH="/usr/local/lib:$DYLD_LIBRARY_PATH"

# Source private work configurations
source "${HOME}/.work"

# Export variables 
export PATH DYLD_LIBRARY_PATH JAVA_HOME JAVA_LIBRARY_PATH

