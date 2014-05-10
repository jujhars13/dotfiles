#!/bin/sh
# copy my .files here

files="~/.zshrc ~/.vimrc ~/.vim"
for file in $files; do
    cp -Rf $file  .
done
