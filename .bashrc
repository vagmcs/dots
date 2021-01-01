#  ____            _
# | __ )  __ _ ___| |__
# |  _ \ / _` / __| '_ \
# | |_) | (_| \__ \ | | |
# |____/ \__,_|___/_| |_|
#

#
# EXPORT
#
export TERM="xterm-256color"
export EDITOR=nvim


#
# FUNCTIONS 
#
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# HISTORY
#
HISTCONTROL=ignoreboth  # don't save duplicate lines or lines starting with space
HISTSIZE=10000
HISTFILESIZE=5000


#
# SHELL CONFIG
#
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}"'

PS1="\[\033[01;32m\]\u@\h[\W]\[\033[33m\]\$(parse_git_branch)\[\033[01;32m\]>\[$(tput sgr0)\] "

shopt -s autocd 				# change to given directory
shopt -s cdspell				# autocorrect cd misspellings
shopt -s cmdhist 				# save multi-line commands in history as a single line
shopt -s histappend 		# do not overwrite history
shopt -s checkwinsize		# check the window size after each external command

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

# Bare repo
alias config="git --git-dir=${HOME}/dotfiles --work-tree=${HOME}"

# Pacman
alias pacman='sudo pacman'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Change user shell
alias chbash="sudo chsh ${USER} -s /bin/bash"
alias chzsh="sudo chsh ${USER} -s /bin/zsh"


#
# PATH
#
USR_HOME="${HOME}/Usr"
USR_OPT="${USR_HOME}/opt"

# Add user executables to PATH
if [ -d "${USR_HOME}/bin" ]; then
  PATH="${USR_HOME}/bin:$PATH"
fi

if [ -d "${HOME}/.local/bin" ]; then
	PATH="${HOME}/.local/bin:${PATH}"
fi

# Java
JAVA_HOME="${USR_OPT}/java"
PATH="${JAVA_HOME}/bin:${PATH}"

# Maven
PATH="${USR_OPT}/maven/bin:${PATH}"

# Scala
PATH="${USR_OPT}/scala/bin:${PATH}"

# SBT
PATH="${USR_OPT}/sbt/bin:${PATH}"

# ScalaTIKZ
PATH="${USR_OPT}/scalatikz/bin:${PATH}"

# Clingo
PATH="${USR_OPT}/clingo/build/release:${PATH}"

# LpSolve
LD_LIBRARY_PATH="${USR_OPT}/lpsolve:${LD_LIBRARY_PATH}"


export PATH LD_LIBRARY_PATH JAVA_HOME

