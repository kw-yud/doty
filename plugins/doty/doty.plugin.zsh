#!/usr/bin/env zsh
# Standarized $0 handling, following:
# https://z-shell.github.io/zsh-plugin-assessor/Zsh-Plugin-Standard
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Load the shell dotfiles, and then some:
# [[ -f "${0:h}/path" ]] && source "${0:h}/path"
# [[ -f "${0:h}/bash_prompt" ]] && source "${0:h}/bash_prompt"
# [[ -f "${0:h}/bash_exports" ]] && source "${0:h}/bash_exports"
# [[ -f "${0:h}/aliases" ]] && source "${0:h}/aliases"
# [[ -f "${0:h}/bash_functions" ]] && source "${0:h}/bash_functions"
# [[ -f "${0:h}/extra" ]] && source "${0:h}/extra"

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend;
# ZSH
# setopt APPEND_HISTORY;

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
# shopt -s checkwinsize

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# shopt -s autocd 2> /dev/null;
# * Recursive globbing, e.g. `echo **/*.txt`

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
