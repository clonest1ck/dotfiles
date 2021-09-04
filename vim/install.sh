#!/bin/bash

BACKUP_DIR="/home/$(whoami)/.backup/vim"
RC=".vimrc"
CONF_DIR=".vim"
TARGET_DIR="/home/$(whoami)"

rc_config()
{
  RC=$1
  CONF_DIR=$2
  TARGET_DIR=$3
  
  # Create directories
  mkdir -p $TARGET_DIR/$CONF_DIR/{autoload,bundle,indent}

  BUNDLE_DIR="$TARGET_DIR/$CONF_DIR/bundle"

  # install pathogen
  curl -LSso "$TARGET_DIR/$CONF_DIR/autoload/pathogen.vim" https://tpo.pe/pathogen.vim

  # install onedark color scheme
  git clone https://github.com/joshdick/onedark.vim "$BUNDLE_DIR/onedark"

  # install vim-polyglot language packs
  POLYGLOT_VERSION=4.17.0
  PLUGIN_NAME="vim-polyglot"
  curl -LSso "$BUNDLE_DIR/$PLUGIN_NAME.tar.gz" https://github.com/sheerun/$PLUGIN_NAME/archive/refs/tags/v$POLYGLOT_VERSION.tar.gz
  tar -zxvf "$BUNDLE_DIR/$PLUGIN_NAME.tar.gz"
  mv "$PLUGIN_NAME-$POLYGLOT_VERSION" "$BUNDLE_DIR/$PLUGIN_NAME"
  rm -f "$BUNDLE_DIR/$PLUGIN_NAME.tar.gz"

  # install ctrlp to search files and stuff
  git clone https://github.com/ctrlpvim/ctrlp.vim.git "$BUNDLE_DIR/ctrlp"
}

rc_precheck()
{
  check_command curl && check_command git
}

