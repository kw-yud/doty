# My Personal Dotfiles

A [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) inspired dotfiles.

> **NOTE:** Currently, only supports to managing your [zsh](https://www.zsh.org) configuration.

## Installation

**Warning:** If you want to give these doty a try, you should first fork this repository, review the code, and remove things you don't want or need.
Don't blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and load the configuration

You can clone the repository wherever you want. (I like to keep it in `~/Development/doty`, with `~/.doty` as a symlink.)

```bash
git clone https://github.com/kw-yud/doty.git && cd doty
```

Currently, there is no installation script. So you'll need to install it manually:

- Load zsh modules
```bash
echo 'source "${HOME}/.doty/doty"' >> ${HOME}/.zshrc
```

- Load tmux modules
```bash
echo "run -b \"${HOME}/.doty/config/tmux/doty/doty\"" >> ${HOME}/.tmux.conf
```

- Load vim plugins
```bash
cat <<EOT >> ${HOME}/.config/nvim/init.lua
vim.opt.rtp:prepend(os.getenv("DOTY_DIRECTORY") .. "/config/nvim/after")
vim.opt.rtp:prepend(os.getenv("DOTY_DIRECTORY") .. "/config/nvim")

require("doty")
EOT
```

- Symlink configurations
```bash
ln -f -s "${HOME}/.doty/config/curlrc.symlink" "${HOME}/.curlrc"
ln -f -s "${HOME}/.doty/config/editorconfig.symlink" "${HOME}/.editorconfig"
ln -f -s "${HOME}/.doty/config/inputrc.symlink" "${HOME}/.inputrc"
ln -f -s "${HOME}/.doty/config/wgetrc.symlink" "${HOME}/.wgetrc"
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/kw-yud/doty/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,.osx,LICENSE-MIT.txt}
```
