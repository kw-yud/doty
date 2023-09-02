#!/usr/bin/env zsh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# export PKG_CONFIG_PATH; PKG_CONFIG_PATH="$(brew --prefix openssl@3)/lib/pkgconfig:${$PKG_CONFIG_PATH}"

[ -f $HOME/.kube/fubectl.source ] && source $HOME/.kube/fubectl.source

source "$ZSH/plugins/kubectx/kubectx.plugin.zsh"