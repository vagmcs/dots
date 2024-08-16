# XDG Basic
export CONFIG_HOME="${HOME}/.config"
export DATA_HOME="${HOME}/.local/share"
export CACHE_HOME="${HOME}/.cache"
export STATE_HOME="${HOME}/.local/state"

# Bash
export LESSHISTFILE=-
export GNUPGHOME="${DATA_HOME}/gnupg"
export ICEAUTHORITY="${CACHE_HOME}/ICEauthority"
export ENHANCD_DIR="${DATA_HOME}/enhancd"
export BASH_COMPLETION_USER_FILE="${CONFIG_HOME}"/bash-completion/bash_completion

# Python
export PYTHON_HISTORY="${STATE_HOME}/python/history"
export PYENV_ROOT="${HOME}/.pyenv"
export IPYTHONDIR="${CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="${CONFIG_HOME}/jupyter"
export WORKON_HOME="${DATA_HOME}/virtualenvs"
export CONDARC="${CONFIG_HOME}/conda/condarc"

# Go
export GOPATH="${DATA_HOME}/go"
export GOMODCACHE="${CACHE_HOME}/go/mod"

# Ollama
export OLLAMA_MODELS="${DATA_HOME}/ollama/models"

# TeX
export TEXMFHOME="${DATA_HOME}/texmf"
export TEXMFVAR="${CACHE_HOME}/texlive/texmf-var"
export TEXMFCONFIG="${CONFIG_HOME}/texlive/texmf-config"
