#!/bin/bash

curl -sSL https://storage.googleapis.com/golang/go1.4.1.src.tar.gz | tar -v -C $HOME -xz
cd $HOME/go/src && ./make.bash --no-clean 2>&1

ln -s $HOME/.dotfiles/gopath $HOME/.gopath
echo ". $HOME/.gopath" >> $HOME/.profile

