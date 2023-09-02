#!/usr/bin/env bash

export PIP_CACHE_DIR="${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/python/pip"
export PIPENV_CACHE_DIR="${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/python/pipenv"

#: load virtualenv
# export WORKON_HOME="${DOTY_DEVELOPMENT_DIRECTORY}/.virtualenvs"
# venvl="/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh"
# if [ ! -z "$venvl" ]; then
#   source $venvl
# fi

export PYENV_ROOT="${DOTY_DEVELOPMENT_SDK_DIRECTORY}/python/pyenv"

if [[ -x "$(command -v pyenv)" ]]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
fi

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING="UTF-8";

source "$ZSH/plugins/python/python.plugin.zsh"
