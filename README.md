# bash_dotfiles

Configuration files I use to customize my dev environment

The .bash_profile file is maintained in this directory and sym-linked to the
$HOME directory

  * From home directory:  
    ```
    ln -s ~/dotfiles/.bash_profile .
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
