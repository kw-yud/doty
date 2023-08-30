#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard

alias goget='go get -x'
alias gopath='export GOPATH=$GOPATH:$(pwd)/bin'

export GOCACHE="${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/go-build"

# doty_update_golang_env() {
#   local go_path
#   go_path="$(asdf which go)"
#   if [[ -n "${go_path}" ]]; then
#     export GOROOT="$(dirname "$(dirname "${go_path:A}")")"
#   fi
# }

# autoload -U add-zsh-hook
# add-zsh-hook precmd doty_update_golang_env

. "${HOME}/.gvm/scripts/gvm"

# export GOPATH="${DOTY_DEVELOPMENT_SDK_DIRECTORY}/golang/$(go version | grep -Eo "go([0-9]{1,}.?)+")/global"
# export GVM_OVERLAY_PREFIX="${GOPATH}/overlay"
export GOBIN="${GOPATH}/bin"
# export PATH="${GOBIN}:${GVM_OVERLAY_PREFIX}:${PATH}"
# export LD_LIBRARY_PATH="${GVM_OVERLAY_PREFIX}:${LD_LIBRARY_PATH}"
# export PKG_CONFIG_PATH="${GVM_OVERLAY_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"
