#!/bin/bash

source ./functions.sh 
PROGRESS_FILE="/home/$(whoami)/.dotfiles_progress"

if [ ! -f "$PROGRESS_FILE" ] ; then
  touch $PROGRESS_FILE
fi

for DIRECTORY in */ ; do
  if [ -f "$DIRECTORY/install.sh" ] ; then
    if grep -Fxq "$DIRECTORY" "$PROGRESS_FILE"; then
      echo "$DIRECTORY is already installed"
      continue
    fi

    source "$DIRECTORY/install.sh"
    if rc_precheck; then
      if ! backup_file $RC $TARGET_DIR $BACKUP_DIR ; then
        continue
      fi
      if ! backup_directory $CONF_DIR $TARGET_DIR $BACKUP_DIR ; then
        continue
      fi
      
      mkdir -p "$TARGET_DIR/$CONF_DIR"
      cp "$DIRECTORY/$RC" "$TARGET_DIR/"
      
      rc_config $RC $CONF_DIR $TARGET_DIR
      echo "$DIRECTORY" >> $PROGRESS_FILE
    else
      echo "Precheck failed for $DIRECTORY. Skipping."
    fi
  fi  
done
