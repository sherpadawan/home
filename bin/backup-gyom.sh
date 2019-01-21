#!/bin/bash

SRC_DIR=/home/guillaume
DEST_DIR=/media/guillaume

instances="documents googledrive music audio video"

documents_vol="Backup_Documents"
googledrive_vol="Backup_Documents"
music_vol="Backup_Documents"
audio_vol="Backup_Documents"
video_vol="PROMEDIA1"


for instance in $instances
do
  if [[ "$1" == "--full" || "$1" == "--audio" ]];then 
    rsync -av $SRC_DIR/Documents/Musique/ardour/* $DEST_DIR/$audio_vol/Documents/Musique/ardour/
    rsync -av $SRC_DIR/Documents/Musique/audacity/* $DEST_DIR/$audio_vol/Documents/Musique/audacity/
  elif [[ "$1" == "--full" || "$1" == "--video"  ]]
  then
    rsync -av $SRC_DIR/Documents/Vidéos/kdenlive/* $DEST_DIR/$video_vol/kdenlive/
  elif [[ "$1" == "--full" || "$1" == "--documents" ]]
  then
    rsync -av $SRC_DIR/Documents/* $DEST_DIR/$document_vol/Documents/
  elif [[ "$1" == "--full" || "$1" == "--googledrive" ]]
  then
    rsync -av $SRC_DIR/GoogleDrive/* $DEST_DIR/$googledrive_vol/GoogleDrive/

  elif [[ "$1" == "--full" || "$1" == "--music"  ]]
  then
    rsync -av $SRC_DIR/Musique/* $DEST_DIR/$music_vol/Music/
  fi
done
