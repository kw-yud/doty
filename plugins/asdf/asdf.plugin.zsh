#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

if [[ $PMSPEC != *b* ]] {
  PATH="${0:h}/bin:${PATH}"
}

# Defaults to `~/.asdf` - Location where `asdf` install plugins, shims and installs.
# Can be set to any location before sourcing `asdf.sh` or `asdf.fish` mentioned in the section above.
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-"${DOTY_DEVELOPMENT_DIRECTORY}/asdf"}"
# The filename of the file storing the tool names and versions.
# Defaults to `.tool-versions`.
# Can be any valid filename.
# Typically you should not override the default value unless you know you want asdf to ignore `.tool-versions` files.
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="${ASDF_DEFAULT_TOOL_VERSIONS_FILENAME:-".asdf-tool-versions"}"
# Defaults to `~/.asdfrc` as described above. Can be set to any location.
export ASDF_CONFIG_FILE="${ASDF_CONFIG_FILE:-"${0:h}/.asdfrc"}"

export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# Enable aliases for asdf as "Tool Version Manager"
alias tvm="asdf"

# See: https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
source "${ZSH}/plugins/asdf/asdf.plugin.zsh"
