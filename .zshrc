#  _________  _   _
# |__  / ___|| | | |
#   / /\___ \| |_| |
#  / /_ ___) |  _  |
# /____|____/|_| |_|


#
# EXPORT
#
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export EDITOR=nvim
export ZPLUG_HOME="${DATA_HOME}/.zplug"
export ZPLUG_BIN="${ZPLUG_HOME}/bin"
export ZPLUG_REPOS="${ZPLUG_HOME}/repos"
export ZPLUG_CACHE_DIR="${ZPLUG_HOME}/cache"
export ICLOUD_DIR="/Users/${USER}/Library/Mobile Documents/com~apple~CloudDocs"
export ZSH_COMPDUMP="${CACHE_HOME}/zsh/.zcompdump-${HOST}"

# Add homebrew executables to PATH
HOMEBREW_HOME="/opt/homebrew"
export PATH="${HOMEBREW_HOME}/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/openvpn/sbin:${PATH}"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#
# PLUGINS
#
source "${ZPLUG_HOME}"/init.zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
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
HISTFILE="${CACHE_HOME}/.zsh_history" # path should exist
HISTCONTROL=ignoreboth  # don't save duplicate lines or lines starting with space
HISTSIZE=10000
HISTFILESIZE=5000
SAVEHIST=10000

# History search using fzf
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
source <(fzf --zsh)


#
# SHELL CONFIG
#
setopt autocd         # change to given directory
setopt append_history # do not overwrite history
setopt globdots       # show hidden files

# Use vim-like keybindings
bindkey -v

# Enable zsh syntax highlighting and autosuggestions
source ${HOMEBREW_HOME}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOMEBREW_HOME}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_HOME}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Basic auto/tab completion
fpath=(/usr/local/share/zsh/completion/_docker $fpath)
fpath=(/usr/local/share/zsh/completion/_docker-compose $fpath)
fpath=(/Users/vagmcs/.docker/completions $fpath)
autoload -Uz compinit & compinit -u

# Enable autocompletion arrow-key driven interface
zstyle ':completion:*' menu select
zstyle :compinstall filename '${HOME}/.zshrc'

# Enable starship prompt 
eval "$(starship init zsh)"

# Select man pages color
less_termcap[md]="${fg_bold[blue]}"

# Enable zoxide
eval "$(zoxide init zsh)"

# Enable pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function pyenv_setup {
    export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
    export PYTHON_CONFIGURE_OPTS="--enable-framework"
    pyenv install $1
    pyenv shell $1
    pip install --upgrade pip
    pip install poetry ipython numpy pandas
    poetry self add poetry-docker-plugin
}

# Luminance
function lum() {
    if [ -z "$1" ] || [ "$1" = "--help" ]; then
        printf "%s\n" "Usage: lum integer"
        return 0
    fi
    m1ddc set luminance $1 > /dev/null
}

# Yazi wrapper that allows to change the current working directory
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Search the web
function search() {
  local url="https:unduck.link/?q="

  while [[ $# -gt 0 ]]; do
    url="${url}$1+"
    shift
  done

  open "${url%?}" &>/dev/null
}

# Connect using OpenVPN
function ovpn() {
  local ovpn_dir="${HOME}/.config/ovpn"  # Change this to your directory
  local selected=$(find "$ovpn_dir" -name "*.ovpn" -type f | fzf --prompt="Select VPN: " --height=40% --reverse)

  if [[ -n "$selected" ]]; then
    echo "Connecting to: $selected"
    sudo openvpn --config "$selected"
  fi
}


#
# ALIASES
#
alias vim='nvim'
alias zj='zellij'
alias amm='scala-cli repl --power --ammonite --ammonite-version 2.5.11 -S 2.13.12'

# Moving around
alias cd='z'
alias ..='z ..'
alias .2='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'
alias ls='eza -l --group-directories-first --icons'
alias la='eza -la --group-directories-first --icons'
alias lt='eza -aT --group-directories-first --icons'

# Colorful commands
alias df='duf -hide special -output mountpoint,size,used,avail,usage,type'
alias cat='bat'
alias du='dua i'
alias grep='grep --color=auto'
alias wget="wget --no-hsts"


#
# PATH
#
USR_LOCAL="/usr/local"
OPT_LOCAL="/opt/local"
HOME_LOCAL="${HOME}/.local"
HOME_OPT="${HOME_LOCAL}/opt"

# Add usr local binaries to PATH
if [ -d "${USR_LOCAL}/bin" ]; then
    PATH="${USR_LOCAL}/bin:${PATH}"
fi

# Add opt local binaries to PATH
if [ -d "${OPT_LOCAL}/bin" ]; then
    PATH="${OPT_LOCAL}/bin:${PATH}"
fi

# Add home local executables to PATH
if [ -d "${HOME_LOCAL}/bin" ]; then
    PATH="${HOME_LOCAL}/bin:${PATH}"
fi

# Tmux session wizard
export PATH=$HOME/.config/tmux/plugins/tmux-session-wizard/bin:$PATH

# GNU coreutils
PATH="${HOMEBREW_HOME}/opt/coreutils/libexec/gnubin:${PATH}"

# ScalaTIKZ
PATH="${HOME_OPT}/scalatikz/bin:${PATH}"

# Rust
PATH="${HOME}/.cargo/bin:${PATH}"

# Add native libraries
PATH="/Library/gurobi_server1200/macos_universal2/bin:${PATH}"
DYLD_LIBRARY_PATH="${HOMEBREW_HOME}/Cellar/lp_solve/5.5.2.11/lib:${DYLD_LIBRARY_PATH}"
LD_LIBRARY_PATH="${HOMEBREW_HOME}/Cellar/lp_solve/5.5.2.11/lib:${LD_LIBRARY_PATH}"
DYLD_FALLBACK_FRAMEWORK_PATH="${HOMEBREW_HOME}/Cellar/lp_solve/5.5.2.11/lib:${DYLD_FALLBACK_FRAMEWORK_PATH}"

# Source private configurations
source "${HOME}/.private"

# Enable Cargo environment
source "${HOME}/.cargo/env"

# Export variables 
export PATH LD_LIBRARY_PATH DYLD_LIBRARY_PATH DYLD_FALLBACK_FRAMEWORK_PATH

# Enable SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux new-session -A -s main
fi
