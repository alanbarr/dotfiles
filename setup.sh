#! /bin/bash
DOT_DIR=${PWD}
HOME_DIR=/home/${USER}

set -e 

git submodule update --init --recursive

# Setup vim
ln -s ${DOT_DIR}/vim/.vimrc   ${HOME_DIR}/.vimrc
ln -s ${DOT_DIR}/vim/.vim     ${HOME_DIR}/.vim

ln -s ${DOT_DIR}/vim/.vim/colors/wombat256/colors/wombat256mod.vim  ${HOME_DIR}/.vim/colors/wombat256mod.vim
ln -s ${DOT_DIR}/vim/.vim/colors/wombat/colors/wombat.vim           ${HOME_DIR}/.vim/colors/wombat.vim


# Setup Fonts
ln -s ${DOT_DIR}/fonts ${HOME_DIR}/.fonts





