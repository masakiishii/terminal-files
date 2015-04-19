#!/bin/bash

CURRENTDIR=`pwd`

configFileList=("git/.gitconfig" "tmux/tmux.sh" "zsh/.zshrc")

for file in ${configFileList[*]}
do
    ln -sf ${CURRENTDIR}/$file ${HOME}/
done
