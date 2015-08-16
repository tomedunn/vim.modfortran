#!/bin/bash

SRC_DIR=.
VIM_DIR=~/.vim
PLUGINS_DIR="$VIM_DIR"

if [ ! -d "$VIM_DIR" ]; then
  echo "User Vim directory not detected..."
  echo "Aborting installation..."
else
  echo "Located user Vim directory..."

  # copy ftdetect files
  echo "Copying ftdetect files into ftdetect directory..."
  cp -r "$SRC_DIR/ftdetect/" "$PLUGINS_DIR/ftdetect"

  # copy ftplugin files
  echo "Copying ftplugin files into ftplugin directory..."
  cp -r "$SRC_DIR/ftplugin/" "$PLUGINS_DIR/ftplugin"

  # copy syntax files
  echo "Copying syntax files into syntax directory..."
  cp -r "$SRC_DIR/syntax/" "$PLUGINS_DIR/syntax"

  # copy indent files
  echo "Copying indent files into indent directory..."
  cp -r "$SRC_DIR/indent/" "$PLUGINS_DIR/indent"
fi
