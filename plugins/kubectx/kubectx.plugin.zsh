#!/usr/bin/env zsh

export KREW_ROOT="${KREW_ROOT:-"$HOME/.kube/kube-krew"}"
export PATH="${KREW_ROOT}/bin:$PATH"
# export PKG_CONFIG_PATH; PKG_CONFIG_PATH="$(brew --prefix openssl@3)/lib/pkgconfig:${$PKG_CONFIG_PATH}"

[ -f $HOME/.kube/fubectl.source ] && source $HOME/.kube/fubectl.source

source "$ZSH/plugins/kubectx/kubectx.plugin.zsh"

if type "kubectl-krew" > /dev/null; then
  # If the completion file does not exist, generate it and then source it
  # Otherwise, source it and regenerate in the background
  if [[ ! -f "$ZSH_CACHE_DIR/completions/_kubectl_krew" ]]; then
    kubectl krew completion zsh | tee "$ZSH_CACHE_DIR/completions/_kubectl_krew" >/dev/null
  else
    helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_kubectl_krew" >/dev/null &|
  fi

  source "$ZSH_CACHE_DIR/completions/_kubectl_krew"
fi

