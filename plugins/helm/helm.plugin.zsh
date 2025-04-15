if (( ! $+commands[helm] )); then
  return
fi

# Set an alternative location for storing cached files
export HELM_CACHE_HOME="${HELM_CACHE_HOME:-"${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/helm"}"
# set an alternative location for storing Helm configuration
export HELM_CONFIG_HOME="${HELM_CONFIG_HOME:-${DOTY_DEVELOPMENT_CONFIG_DIRECTORY}/helm}"
# set an alternative location for storing Helm data.
export HELM_DATA_HOME="${HELM_DATA_HOME:-${DOTY_DEVELOPMENT_DIRECTORY}/helm}"

source "$ZSH/plugins/helm/helm.plugin.zsh"
