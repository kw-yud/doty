#!/usr/bin/env zsh
# Standardized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *b* ]] {
  PATH="${0:h}/bin:${PATH}"
}

# alias to docker, run podman commands as docker
if ! type "docker" > /dev/null; then
  alias docker=podman
  alias docker-compose=podman-compose

  export DOCKER_HOST="unix://$(podman machine inspect &> /dev/null | jq -r '.[0].ConnectionInfo.PodmanSocket.Path')"
fi

source "$ZSH/plugins/podman/podman.plugin.zsh"

[[ -f "${0:h}/aliases" ]] && source "${0:h}/aliases"
