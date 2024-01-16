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

# Python
export PYENV_ROOT="${HOME}/.pyenv"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/startup.py"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export WORKON_HOME="${XDG_DATA_HOME}/virtualenvs"
export PYLINTHOME="${XDG_CACHE_HOME}/pylint"
export PYTHON_EGG_CACHE="${XDG_CACHE_HOME}/python-eggs"
export CONDARC="${XDG_CONFIG_HOME}/conda/condarc"
export PIPENV_IGNORE_VIRTUALENVS=1 
export PIPENV_VENV_IN_PROJECT=1

# Docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export MACHINE_STORAGE_PATH="${XDG_DATA_HOME}/docker-machine"

# TeX
export TEXMFHOME="${XDG_DATA_HOME}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME}/texlive/texmf-config"

. "$HOME/.cargo/env"
