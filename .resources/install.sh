#! /bin/bash
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
mv ~/.xmobarrc ~/dofiles.bak
mv ~/.xmonad/xmonad.hs ~/dotfiles.bak
mv ~/.Xdefaults ~/dotfiles.bak
mv ~/.xsession ~/dotfiles.bak
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/ssh/config ~/.ssh/config
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
ln -s ~/dotfiles/xmobarrc ~/.xmobarrc
ln -s ~/dotfiles/Xdefaults ~/.Xdefaults
ln -s ~/dotfiles/xsession ~/.xsession
