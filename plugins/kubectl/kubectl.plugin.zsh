#!/usr/bin/env zsh
# Standardized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *b* ]] {
  PATH="${0:h}/bin:${PATH}"
}

source "$ZSH/plugins/kubectl/kubectl.plugin.zsh"

[[ -f "${0:h}/aliases" ]] && source "${0:h}/aliases"

