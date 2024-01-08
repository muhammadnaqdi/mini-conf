mkdir -p ~/backgrounds ~/gits ~/keys ~/media ~/scripts ~/tmp ~/.xmonad ~/.config/alacritty ~/binary ~/projects

cp -f vimrc ~/.vimrc
cp -f init.el ~/.emacs
cp -f xmobarrc ~/.xmobarrc
cp -f alacritty.yml ~/.config/alacritty/alacritty.yml
cp -f xmonad.hs ~/.xmonad/xmonad.hs
cp -f scripts/* ~/scripts/

if [[ -z $(grep '# user' ~/.profile) ]]
then
    cat profile >> ~/.profile
fi

# systemctl --user enable emacs
