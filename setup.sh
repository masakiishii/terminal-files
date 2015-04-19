#!/bin/bash

CURRENTDIR=`pwd`

configFileList=("git/.gitconfig" "tmux/tmux.sh" "tmux/.tmux.conf" "zsh/.zshrc")

for file in ${configFileList[*]}
do
    ln -sf ${CURRENTDIR}/$file ${HOME}/
done
