#!/bin/bash

# Dynamic values
IN=$1
VIDEOQUALITY=$2
AUDIOQUALITY=$3
OUT=$(echo $1 | sed 's/^\(.*\)\.[a-zA-Z0-9]*$/\1/')

# Print out variables received
echo "Creating videos using IN=$IN OUT=$OUT VIDEOQUALITY=$VIDEOQUALITY AUDIOQUALITY=$AUDIOQUALITY"

# Hardcoded Values
RESOLUTION='640x360'
THREADS='2'
VIDEOCONSTANTRATEFACTOR='22' #this is only for x254 video encoding
AUDIOCHANNELS='2'

# webm
ffmpeg -i $IN -acodec libvorbis -aq $AUDIOQUALITY -ac $AUDIOCHANNELS -qmax $VIDEOQUALITY -qscale $VIDEOQUALITY -threads $THREADS -s $RESOLUTION $OUT.webm

# mp4
ffmpeg -i $IN -acodec aac -strict experimental -vcodec libx264 -crf $VIDEOCONSTANTRATEFACTOR -aq $AUDIOQUALITY -ac $AUDIOCHANNELS -qmax $VIDEOQUALITY -qscale $VIDEOQUALITY -threads $THREADS -s $RESOLUTION $OUT.mp4

# ogg (if you want to support older Firefox)
ffmpeg -i $IN -acodec libvorbis -vcodec libtheora -aq $AUDIOQUALITY -ac $AUDIOCHANNELS -qmax $VIDEOQUALITY -qscale $VIDEOQUALITY -threads $THREADS -s $RESOLUTION $OUT.ogv
