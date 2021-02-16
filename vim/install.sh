#!/usr/bin/env bash
export BASE_DIR=~/.config/nvim
mkdir -p $BASE_DIR
mkdir -p $BASE_DIR/plugin

for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
    rm -rf $BASE_DIR/$f
    ln -s $(pwd)/$f $BASE_DIR/$f
done
