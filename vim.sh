#!/bin/bash
passwd jsongo
git clone  https://github.com/jsongo/vim_jsongo.git .vim
git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
mv -f .vim/.vimrc .
vim -c BundleInstall -c quitall
vim
