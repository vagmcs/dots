neofetch

USR_HOME="${HOME}/Usr"

if [ -d "${HOME}/.local/bin" ]; then
	PATH="${HOME}/.local/bin:${PATH}"
fi


#
# Aliases
#
alias vim='nvim'
alias ls='exa -l'
alias du='ncdu -rx --exclude .git'
alias df='pydf'
alias cat='bat'
alias grep='grep --color=auto'
alias ping='prettyping --nolegend'
alias config='git --git-dir=${HOME}/dotfiles --work-tree=${HOME}'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Java
JAVA_HOME="${USR_HOME}/opt/java"
PATH="${JAVA_HOME}/bin:${PATH}"

# Maven
PATH="${USR_HOME}/opt/maven/bin:${PATH}"

# Scala
PATH="${USR_HOME}/opt/scala/bin:${PATH}"

# SBT
PATH="${USR_HOME}/opt/sbt/bin:${PATH}"

# ScalaTIKZ
PATH="${USR_HOME}/opt/scalatikz/bin:${PATH}"

# Clingo
PATH="${USR_HOME}/opt/clingo/build/release:${PATH}"

# LpSolve
LD_LIBRARY_PATH="${USR_HOME}/opt/lpsolve:${LD_LIBRARY_PATH}"

export PATH LD_LIBRARY_PATH JAVA_HOME
