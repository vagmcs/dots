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
export ICLOUD_DIR="/Users/${USER}/Library/Mobile Documents/com~apple~CloudDocs"
export OBSIDIAN_VAULT="/Users/${USER}/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes"
export ZSH_COMPDUMP="${CACHE_HOME}/zsh/.zcompdump-${HOST}"

# Add homebrew executables to PATH
HOMEBREW_HOME="/opt/homebrew"
export PATH="${HOMEBREW_HOME}/bin:${PATH}"
export PATH="${HOMEBREW_HOME}/opt/openvpn/sbin:${PATH}"

# Command Not Found Handler
HOMEBREW_COMMAND_NOT_FOUND="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND" ]; then
  source "$HOMEBREW_COMMAND_NOT_FOUND";
fi

# FZF catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source plugins
eval "$(sheldon source)"

#
# HISTORY
#
HISTFILE="${CACHE_HOME}/.zsh_history" # path should exist
HISTCONTROL=ignoreboth  # don't save duplicate lines or lines starting with space
HISTSIZE=10000
HISTFILESIZE=5000
SAVEHIST=10000

# FZF history search (hint: navigate right pane using shift + arrow keys)
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

#
# SHELL CONFIG
#
setopt autocd         # change to given directory
setopt append_history # do not overwrite history
setopt globdots       # show hidden files

# Use vim-like keybindings
bindkey -v
bindkey jk vi-cmd-mode

# Runs compinit in a precmd hook, so there is no need to call compinit manually
source ${HOMEBREW_HOME}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ${HOMEBREW_HOME}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_HOME}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# registers carapace completers (compdefs are queued by autocomplete)
source <(carapace _carapace)
source <(fzf --zsh)

# TAB opens a selectable menu instead of inserting a single match
bindkey '^I' menu-select
bindkey -M menuselect '^I' menu-complete
if [[ -n $terminfo[kcbt] ]]; then
  bindkey "$terminfo[kcbt]" menu-select
  bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
fi

# Enable starship prompt
eval "$(starship init zsh)"

# Man pages colors
autoload -U colors && colors
function man() {
    env \
        LESS_TERMCAP_md="${fg_bold[blue]}" \
        LESS_TERMCAP_me="${reset_color}" \
        LESS_TERMCAP_mb="${fg_bold[red]}" \
        LESS_TERMCAP_us="${fg[green]}" \
        LESS_TERMCAP_ue="${reset_color}" \
        LESS_TERMCAP_so="${fg_bold[yellow]}" \
        LESS_TERMCAP_se="${reset_color}" \
        PAGER="${commands[less]:-$PAGER}" \
        man "$@"
}

# Enable zoxide
eval "$(zoxide init zsh)"

# Enable worktrunk
if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

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
  local url="https://search.brave.com/search?q="

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

function autocommit() {
  local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  git add -A && git commit -m "autocommit: ${timestamp}"
}


#
# ALIASES
#
alias v='nvim'
alias vim='nvim'
alias amm='scala-cli repl --power --ammonite --ammonite-version 2.5.11 -S 2.13.12'
alias vault='cd ${OBSIDIAN_VAULT}'
alias marp-pdf='marp --pdf --browser-path /Applications/Helium.app/Contents/MacOS/Helium'
alias lzd='lazydocker'
alias oc="opencode"
alias q="opencode run"

# Moving around
alias cd='z'
alias ..='z ..'
alias .2='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'
alias ls='eza -l --group-directories-first --icons --git'
alias la='eza -la --group-directories-first --icons --git'
alias lt='eza -aT --group-directories-first --icons --git'

# Git
alias glog='git log'
alias gc='git commit -m'
alias gco='git checkout'

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

# tmux session wizard (use t command to select a path or specify one)
export PATH=$HOME/.config/tmux/plugins/tmux-session-wizard/bin:$PATH

# GNU coreutils
PATH="${HOMEBREW_HOME}/opt/coreutils/libexec/gnubin:${PATH}"

# ScalaTIKZ
PATH="${HOME_OPT}/scalatikz/bin:${PATH}"

# Rust
PATH="${HOME}/.cargo/bin:${PATH}"

# Obsidian
PATH="/Applications/Obsidian.app/Contents/MacOS:${PATH}"

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
export JAVA_HOME="${SDKMAN_DIR}/candidates/java/current"
export PATH="${SDKMAN_DIR}/candidates/java/current/bin:$PATH"
export PATH="${SDKMAN_DIR}/candidates/sbt/current/bin:$PATH"
export PATH="${SDKMAN_DIR}/candidates/scala/current/bin:$PATH"
export PATH="${SDKMAN_DIR}/candidates/scalacli/current/bin:$PATH"

# Only init sdkman CLI when you actually call sdk
sdk() {
  unfunction sdk
  [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
  sdk "$@"
}

# Export docker host
# Because of the following symlink, docker commands work using podman.sock
# /var/run/docker.sock -> ~/.local/share/containers/podman/machine/podman.sock
export DOCKER_HOST="unix:///var/run/docker.sock"
