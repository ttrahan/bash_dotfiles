# bash_dotfiles

Configuration files I use to customize my dev environment

Installation with submodules for .vim bundles:  
```
git clone --recursive git@github.com:ttrahan/dotfiles.git
```

Create symlinks to $HOME directory (use relative directories for directories below ~ 
to avoid issues with different user names on different machines:
```bash
ln -s ~/dotfiles/.bash_profile ~
# for Vim config
ln -s ~/dotfiles/.vim ~
ln -s ~/dotfiles/.vimrc ~
# for MacOS automation via Hammerspoon
ln -s ~/dotfiles/.hammerspoon/ ~
# for Neovim
ln -s ~/dotfiles/.vim ~/dotfiles/.config/nvim
ln -s ~/dotfiles/.vimrc ~/dotfiles/.config/nvim/init.vim
ln -s ~/dotfiles/.config/nvim ~/.config
# for tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

To update submodules:
```bash
git submodule foreach git pull origin master
git submodule update --init --recursive
```

The YouCompleteMe plugin requires an additional install step after updating the submodule:
```bash
cd ~/dotfiles/.vim/bundle/youcompleteme
./install.py
```

Install tools via Homebrew:
```bash
brew install tmux
brew install reattach-To-user-namespace
```

To use Neovim and Python-enabled Vim plugins (note 'vim' aliased to 'nvim' by default - remove from .aliases if not using Neovim):
```bash
brew install neovim/neovim/neovim
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade
```

To use tmux plugin manager (tpm):
```bash
cd ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Then, install tmux plugins:
* Within tmux, prefix + I (capital I) to fetch all plugins

Some of the files require Bash 4.x (e.g. .path). Upgrade on a Mac as follows:
  * Update homebrew packet database and install bash:
    ```
    $ brew update && brew install bash
    ```
  * Add the new shell to the list of allowed shells
    ```
    sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
    ```
  * Change to the new shell
    ```
    chsh -s /usr/local/bin/bash
    ```
  * Shut down Terminal and reboot
