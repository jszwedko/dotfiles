#! /bin/bash
echo 'Are you sure you want to run this script?'
echo 'It will erase your current bash and vim configs.'
read -p '$' -n 1
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    if [ ! -d "~/dotfiles.bak" ]; then
        mkdir ~/dotfiles.bak
    fi
    mv ~/.zshrc ~/dotfiles.bak
    mv ~/.vimrc ~/dotfiles.bak
    mv ~/.vim ~/dotfiles.bak
    mv ~/.tmux.conf ~/dotfiles.bak
    mv ~/.ssh/config ~/dotfiles.bak/ssh_config
    mv ~/.gitconfig ~/dotfiles.bak
    echo . ~/dotfiles/bashrc > ~/.bashrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/zshrc ~/.zshrc
    ln -s ~/dotfiles/ssh/config ~/.ssh/config
    ln -s ~/gitconfig ~/.gitconfig
else
    echo && echo 'Okay, no changes made.'
fi
