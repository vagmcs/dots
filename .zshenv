# XDG Basic
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

# Bash
export LESSHISTFILE=-
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
export ENHANCD_DIR="${XDG_DATA_HOME}/enhancd"
export BASH_COMPLETION_USER_FILE="${XDG_CONFIG_HOME}"/bash-completion/bash_completion

# Python
export PYTHON_HISTORY="${XDG_STATE_HOME}/python/history"
export PYENV_ROOT="${HOME}/.pyenv"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export WORKON_HOME="${XDG_DATA_HOME}/virtualenvs"
export CONDARC="${XDG_CONFIG_HOME}/conda/condarc"

# Go
export GOPATH="${XDG_DATA_HOME}/go"
export GOMODCACHE="${XDG_CACHE_HOME}/go/mod"

# Ollama
export OLLAMA_MODELS="${XDG_DATA_HOME}/ollama/models"

# TeX
export TEXMFHOME="${XDG_DATA_HOME}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME}/texlive/texmf-config"
