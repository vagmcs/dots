#  _________  _   _
# |__  / ___|| | | |
#   / /\___ \| |_| |
#  / /_ ___) |  _  |
# /____|____/|_| |_|
#


#
# EXPORT
#
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
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

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
#HISTFILE=~/.zsh_history
HISTCONTROL=ignoreboth  # don't save duplicate lines or lines starting with space
HISTSIZE=10000
HISTFILESIZE=5000
SAVEHIST=1000


#
# SHELL CONFIG
#
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD/#$HOME/~}"'
precmd() { eval "${PROMPT_COMMAND}" }

setopt autocd 				# change to given directory
setopt append_history # do not overwrite history

# Use emacs-like keybindings
bindkey -e

# Basic auto/tab completion
autoload -Uz compinit & compinit -u
_comp_options+=(globdots)
zstyle ':completion:*' menu select
zstyle :compinstall filename '${HOME}/.zshrc'

# Enable stash display on pure theme
zstyle :prompt:pure:git:stash show yes

# Configure prompt on pure theme
autoload -U colors && colors
PURE_PROMPT_SYMBOL="[v@m] ❯"
zstyle ':prompt:pure:prompt:success' color cyan

# Select man pages color
less_termcap[md]="${fg_bold[blue]}"

# Enable zsh syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

(cat ~/.cache/wal/sequences &) # load colorscheme

neofetch # run neofetch


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
alias df='pydf'
alias ccat='bat'
alias du='ncdu -rx --exclude .git'
alias grep='grep --color=auto'
alias ping='prettyping --nolegend'
alias wget="wget --hsts-file=${XDG_CACHE_HOME}/wget-hsts"
alias diff='diff --color=auto'

# History search
alias h='history'
alias hs='history | grep'

# Bare repo
alias config="git --git-dir=${HOME}/Work/dev/dots --work-tree=${HOME}"

# Pacman
alias pacman='sudo pacman'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Change user shell
alias chbash="sudo chsh ${USER} -s /bin/bash"
alias chzsh="sudo chsh ${USER} -s /bin/zsh"


#
# PATH
#
LOCAL_HOME="${HOME}/.local"
LOCAL_OPT="${LOCAL_HOME}/opt"

# Add user executables to PATH
if [ -d "${LOCAL_HOME}/bin" ]; then
  PATH="${LOCAL_HOME}/bin:$PATH"
fi

# Java
JAVA_HOME="${LOCAL_OPT}/java"
PATH="${JAVA_HOME}/bin:${PATH}"

# Maven
PATH="${LOCAL_OPT}/maven/bin:${PATH}"

# Scala
PATH="${LOCAL_OPT}/scala/bin:${PATH}"

# SBT
PATH="${LOCAL_OPT}/sbt/bin:${PATH}"

# ScalaTIKZ
PATH="${LOCAL_OPT}/scalatikz/bin:${PATH}"

# Clingo
PATH="${LOCAL_OPT}/clingo/build/release:${PATH}"

# LpSolve
LD_LIBRARY_PATH="${LOCAL_OPT}/lpsolve:${LD_LIBRARY_PATH}"


export PATH LD_LIBRARY_PATH JAVA_HOME

