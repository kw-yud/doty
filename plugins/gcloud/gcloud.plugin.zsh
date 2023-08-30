#!/usr/bin/env bash

# Use a python you have installed in a special location
export CLOUDSDK_PYTHON="$(pyenv which python)"
export CLOUDSDK_ROOT_DIR="$HOME/.local/share/google-cloud"

# Add `$CLOUDSDK_ROOT_DIR/bin` to the `$PATH`
# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"${CLOUDSDK_ROOT_DIR}/bin":*)
        ;;
    *)
        export PATH="${CLOUDSDK_ROOT_DIR}/bin:${PATH}"
        ;;
esac
