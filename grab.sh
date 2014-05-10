#!/bin/sh
# copy my .files here

files="~/.zshrc ~/.vimrc ~/.vim"

for file in $files; do
    echo "cp -Rf $file ./"
done
