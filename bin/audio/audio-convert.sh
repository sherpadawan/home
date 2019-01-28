#!/bin/bash
ext=$1

find . -name "*.$ext" -exec ffmpeg -i {} -c:a libmp3lame -ac 2 -b:a 190k {}.mp3 \;
