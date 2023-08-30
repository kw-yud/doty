#!/usr/bin/env zsh

export NEXT_TELEMETRY_DISABLED=1

# Enable persistent REPL history for `node`.
# export NODE_REPL_HISTORY=~/.node_history;
# Disable persistent REPL history for `node`.
export NODE_REPL_HISTORY="${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/.node_history"

# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE="32768";
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE="sloppy";

if type "nodenv" > /dev/null; then
    eval "$(nodenv init -)"
fi
