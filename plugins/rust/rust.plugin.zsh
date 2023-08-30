#!/usr/bin/env bash

#                  _                               
#   _ __ _   _ ___| |_    ___ __ _ _ __ __ _  ___  
#  | '__| | | / __| __|  / __/ _` | '__/ _` |/ _ \ 
#  | |  | |_| \__ \ |_  | (_| (_| | | | (_| | (_) |
#  |_|   \__,_|___/\__|  \___\__,_|_|  \__, |\___/ 
#                                      |___/       
export RUSTUP_HOME="${DOTY_DEVELOPMENT_SDK_DIRECTORY}/rust/rustup"
export CARGO_HOME="${DOTY_DEVELOPMENT_SDK_DIRECTORY}/rust/cargo"


[[ -d "${CARGO_HOME}" ]] || mkdir -p "${CARGO_HOME}"
[[ -f "${CARGO_HOME}/env" ]] && source "${CARGO_HOME}/env"

# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"${CARGO_HOME}/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="${CARGO_HOME}/bin:${PATH}"
        ;;
esac
