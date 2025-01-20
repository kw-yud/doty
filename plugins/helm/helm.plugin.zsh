# If the completion file does not exist, generate it and then source it
# Otherwise, source it and regenerate in the background
if [[ ! -f "$ZSH_CACHE_DIR/completions/_helm" ]]; then
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null
  source "$ZSH_CACHE_DIR/completions/_helm"
else
  source "$ZSH_CACHE_DIR/completions/_helm"
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null &|
fi

# Set an alternative location for storing cached files
export HELM_CACHE_HOME="${HELM_CACHE_HOME:-"${DOTY_DEVELOPMENT_CACHE_DIRECTORY}/helm"}"
# set an alternative location for storing Helm configuration
export HELM_CONFIG_HOME="${HELM_CONFIG_HOME:-${DOTY_DEVELOPMENT_CONFIG_DIRECTORY}/helm}"
# set an alternative location for storing Helm data.
export HELM_DATA_HOME="${HELM_DATA_HOME:-${DOTY_DEVELOPMENT_DIRECTORY}/helm}"

source "$ZSH/plugins/helm/helm.plugin.zsh"

