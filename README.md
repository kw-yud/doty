# My Personal Dotfiles

A [Oh My Zsh](https://github.com/github.com/kw-yud/doty) inspired dotfiles.

> **NOTE:** Currently, only supports to managing your [zsh](https://www.zsh.org) configuration.

## Installation

**Warning:** If you want to give these doty a try, you should first fork this repository, review the code, and remove things you don't want or need.
Don't blindly use my settings unless you know what that entails. Use at your own risk!

### Basic Installation

Doty is installed by running one of the following commands in your terminal.
You can install this via the command-line with either `curl`, `wget` or another similar tool.

| Method    | Command                                                                                                 |
| :-------- | :------------------------------------------------------------------------------------------------------ |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/github.com/kw-yud/doty/master/scripts/install)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/github.com/kw-yud/doty/master/scripts/install)"`   |

_Note that any previous `.zshrc` will be moved to `~/.doty}/.backups`. After installation, you can move the configuration you want to preserve into the new `.zshrc`._

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
echo "run \"${HOME}/.doty/config/tmux/doty/doty\"" >> ${HOME}/.tmux.conf
```

- Load vim plugins
```bash
cat <<EOT >> ${HOME}/.config/nvim/init.lua
vim.opt.rtp:prepend(os.getenv("DOTY_DIRECTORY") .. "/config/nvim/after")
vim.opt.rtp:prepend(os.getenv("DOTY_DIRECTORY") .. "/config/nvim")

require("doty")
EOT
```

- Git configurations
```bash
git config --global --add --path core.excludesfile "${HOME}/.doty/config/git/gitignore"
git config --global --add --path core.attributesfile "${HOME}/.doty/config/git/gitattributes"
git config --global --includes --path include.path "${HOME}/.doty/config/git/.gitconfig"
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
cd; curl -#L https://github.com/kw-yud/doty/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,.osx}
```
