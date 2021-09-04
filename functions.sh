#!/bin/bash

check_command()
{
  COMMAND=$1

  if ! command -v $COMMAND &> /dev/null ; then
    echo "$COMMAND is needed to complete the setup, but it does not seem to be installed."
    echo "Please install $COMMAND to continue"
    return 3
  fi
}

backup_file() 
{
  FILENAME=$1
  SOURCE_DIR=$2
  BACKUP_DIR=$3

  if [ -f "$SOURCE_DIR/$FILENAME" ]; then
    echo "$SOURCE_DIR/$FILENAME exists. Backing up to $BACKUP_DIR/$FILENAME"
  
    if [ -f "$BACKUP_DIR/$FILENAME" ]; then
      echo "There is already a backup of $SOURCE_DIR/$FILENAME. Please remove it."
      return 1
    fi
  
    mkdir -p $BACKUP_DIR
    mv "$SOURCE_DIR/$FILENAME" "$BACKUP_DIR/"
  fi
}

backup_directory()
{
  DIR=$1
  SOURCE_DIR=$2
  BACKUP_DIR=$3

  if [ -d "$SOURCE_DIR/$DIR" ]; then
    echo "$SOURCE_DIR/$DIR exists. Backing up to $BACKUP_DIR/$DIR"
  
    if [ -d "$BACKUP_DIR/$DIR" ]; then
      echo "There is already a backup of $SOURCE_DIR/$DIR. Please remove it."
      return 1
    fi
  
    mkdir -p "$BACKUP_DIR"
    mv "$SOURCE_DIR/$DIR" "$BACKUP_DIR/$DIR"
  fi
}


