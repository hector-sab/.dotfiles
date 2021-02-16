#!/usr/bin/env bash

export BASE_DIR=~/.config/nvim
mkdir -p $BASE_DIR
ln -s $(pwd)/coc-settings.json $BASE_DIR/coc-settings.json
