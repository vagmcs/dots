# XDG Basic
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE=-
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
export ENHANCD_DIR="${XDG_DATA_HOME}/enhancd"

# X11
export XCOMPOSEFILE="${XDG_CONFIG_HOME}/X11/xcompose"
export XCOMPOSECACHE="${XDG_CACHE_HOME}/X11/xcompose"

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export ANDROID_PREFS_ROOT="${XDG_CONFIG_HOME}/android"

# NodeJS
export NVM_DIR="${XDG_DATA_HOME}/nvm"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"

# Python
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/startup.py"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export WORKON_HOME="${XDG_DATA_HOME}/virtualenvs"
export PYLINTHOME="${XDG_CACHE_HOME}/pylint"

# TeX
export TEXMFHOME="${XDG_DATA_HOME}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME}/texlive/texmf-config"

# Wine
[ ! command -v wine &> /dev/null ] && [ ! -d ${XDG_DATA_HOME}/wine ] && mkdir -p "${XDG_DATA_HOME}/wine"
export WINEPREFIX="${XDG_DATA_HOME}/wine/default"

