#!/bin/bash

CURRENTDIR=`pwd`

configFileList=("git/.gitconfig" "tmux/.tmux.conf" "zsh/.zshrc")

for file in ${configFileList[*]}
do
    ln -sf ${CURRENTDIR}/$file ${HOME}/
done

ln -sf ${CURRENTDIR}/tmux/tmux.sh ${HOME}/downloads/
