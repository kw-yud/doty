#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard

function __init_gvm() {
    _goversion=$(go version | awk '{print $3}')
    # export GOPATH="${DOTY_DEVELOPMENT_SDK_DIRECTORY}/golang/$(go version | grep -Eo "go([0-9]{1,}.?)+")/global"
    # export GVM_OVERLAY_PREFIX="${GOPATH}/overlay"
    export GOBIN="${GOPATH}/bin"
    export GOCACHE="${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/go-build/${_goversion}"
    export GOTOOLDIR="${GOROOT}/pkg/tool/darwin_arm64"
    # export PATH="${GOBIN}:${GVM_OVERLAY_PREFIX}:${PATH}"
    # export LD_LIBRARY_PATH="${GVM_OVERLAY_PREFIX}:${LD_LIBRARY_PATH}"
    # export PKG_CONFIG_PATH="${GVM_OVERLAY_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"

    unset _goversion
}

# source "$ZSH/plugins/golang/golang.plugin.zsh"

function go-tools-install() {
    go install github.com/cweill/gotests/gotests@latest
    go install mvdan.cc/gofumpt@latest
    go install github.com/segmentio/golines@latest
    go install golang.org/x/tools/cmd/goimports@latest
    # go install golang.org/x/tools/refactor/rename@latest
    go install github.com/fatih/gomodifytags@latest
    go install gotest.tools/gotestsum@latest
    go install golang.org/x/vuln/cmd/govulncheck@latest
    go install github.com/twpayne/go-jsonstruct/v2/cmd/gojsonstruct@latest
}

function gvm-use() {
    gvm use ${@}
    __init_gvm
}

function gvm-uninstall () {
    local CURRENT_VERSION=$(go version | awk '{print $3}')
    go clean -modcache
    gvm use system
    gvm uninstall $CURRENT_VERSION

    __init_gvm
    go-tools-install

    echo "Go uninstall $CURRENT_VERSION"
}

function gvm-reinstall() {
    local CURRENT_VERSION=$(go version | awk '{print $3}')

    gvm-uninstall $CURRENT_VERSION
    gvm install $CURRENT_VERSION
    gvm use $CURRENT_VERSION

    __init_gvm
    go-tools-install

    echo "Go re-install $CURRENT_VERSION"
}

function gvm-update() {
    local CURRENT_VERSION=$(go version | awk '{print $3}')
    local ALIAS_VERSION=$(go version | awk '{print $3}' | awk -F . '{printf "%s.%s", $1, $2}')
    local LATEST_VERSION=$(gvm listall | grep ${ALIAS_VERSION} | tail -n 1 | sed "s/ //g")
    if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
        echo "You are already on the latest version (${LATEST_VERSION})"
        return
    fi

    go clean -modcache
    gvm install $LATEST_VERSION
    gvm use $LATEST_VERSION
    gvm uninstall $CURRENT_VERSION

    __init_gvm
    go-tools-install

    echo "Go updated from $CURRENT_VERSION to $LATEST_VERSION"
}

alias gomod='go mod tidy && go mod verify'
alias goget='go get -x'
alias gopath='export GOPATH=$GOPATH:$(pwd)/bin'

[ -f "${HOME}/.gvm/scripts/gvm" ] && source "${HOME}/.gvm/scripts/gvm"
[ -f "${HOME}/.gvm/scripts/gvm" ] && __init_gvm

# doty_update_golang_env() {
#   local go_path
#   go_path="$(asdf which go)"
#   if [[ -n "${go_path}" ]]; then
#     export GOROOT="$(dirname "$(dirname "${go_path:A}")")"
#   fi
# }

# autoload -U add-zsh-hook
# add-zsh-hook precmd doty_update_golang_env
