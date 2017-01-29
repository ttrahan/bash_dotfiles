# bash_dotfiles

Configuration files I use to customize my dev environment

Installation with submodules for .vim bundles:  
```
git clone --recursive git@github.com:ttrahan/dotfiles.git
```

Create symlinks to $HOME directory:
```bash
ln -s ~/dotfiles/.bash_profile ~
ln -s ~/dotfiles/.vim/ ~
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.hammerspoon/ ~
```

Update submodules:
```bash
git submodule foreach git pull
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
