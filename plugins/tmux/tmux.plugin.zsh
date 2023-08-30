#!/usr/bin/env zsh

# CONFIGURATION VARIABLES
# The TERM to use for non-256 color terminals.
# Tmux states this should be screen, but you may need to change it on
# systems without the proper terminfo
: ${ZSH_TMUX_FIXTERM_WITHOUT_256COLOR:=screen}
# The TERM to use for 256 color terminals.
# Tmux states this should be screen-256color, but you may need to change it on
# systems without the proper terminfo
: ${ZSH_TMUX_FIXTERM_WITH_256COLOR:=screen-256color}

# Determine if the terminal supports 256 colors
if [[ $terminfo[colors] == 256 ]]; then
  export DOTY_TMUX_TERM=$ZSH_TMUX_FIXTERM_WITH_256COLOR
else
  export DOTY_TMUX_TERM=$ZSH_TMUX_FIXTERM_WITHOUT_256COLOR
fi
