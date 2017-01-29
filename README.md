# bash_dotfiles

Configuration files I use to customize my dev environment

Installation with submodules for .vim bundles:  
```
git clone --recursive git@github.com:ttrahan/dotfiles.git
```

Create symlinks to $HOME directory:
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
```

Update submodules:
```bash
git submodule foreach git pull
```

To use Neovim and Python-enabled Vim plugins:
```bash
brew install neovim/neovim/neovim
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade
```

These files assume use of Bash 4.x. Upgrade on a Mac as follows:
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
