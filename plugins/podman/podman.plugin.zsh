#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *b* ]] {
  PATH="${0:h}/bin:${PATH}"
}

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `podman`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_podman" ]]; then
  typeset -g -A _comps
  autoload -Uz _podman
  _comps[podman]=_podman
fi

podman completion zsh 2> /dev/null >| "$ZSH_CACHE_DIR/completions/_podman" &|

# alias to docker, run podman commands as docker
if ! type "docker" > /dev/null; then
  # alias docker=podman
  # alias docker-compose=podman-compose

  export DOCKER_HOST="unix://$(podman machine inspect | jq -r '.[0].ConnectionInfo.PodmanSocket.Path')"
fi

[[ -f "${0:h}/aliases" ]] && source "${0:h}/aliases"
