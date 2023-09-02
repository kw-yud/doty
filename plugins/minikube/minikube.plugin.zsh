#!/usr/bin/env zsh

if [[ -x "$(command -v minikube)" ]]; then
    export MINIKUBE_HOME="${DOTY_DEVELOPMENT_DIRECTORY}/minikube"
    export MINIKUBE_IN_STYLE=false
fi

source "$ZSH/plugins/minikube/minikube.plugin.zsh"
