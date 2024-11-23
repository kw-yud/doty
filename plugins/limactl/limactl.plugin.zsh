if [ $commands[limactl] ]; then
  source <(limactl completion zsh)
  compdef _limactl limactl
fi
