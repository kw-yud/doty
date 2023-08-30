#!/usr/bin/env zsh

#                   _           _     _   __    ___      
#    __ _ _ __   __| |_ __ ___ (_) __| | / _\  /   \/\ /\
#   / _` | '_ \ / _` | '__/ _ \| |/ _` | \ \  / /\ / //_/
#  | (_| | | | | (_| | | | (_) | | (_| | _\ \/ /_// __ \ 
#   \__,_|_| |_|\__,_|_|  \___/|_|\__,_| \__/___,'\/  \/ 
#                                                        
export ANDROID_AVD_HOME=$HOME"${DOTY_DEVELOPMENT_SDK_DIRECTORY}/avd"
export ANDROID_HOME="${DOTY_DEVELOPMENT_SDK_DIRECTORY}/android"

# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"${ANDROID_HOME}":*)
        ;;
    *)
        export PATH="${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}"
        ;;
esac


# [[ -d "${HOME}/.sdkman" ]] && export SDKMAN_DIR="$HOME/.sdkman"
# [[ -f "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
