#!/bin/bash

# Dynamic values
IN=$1
VIDEOQUALITY=$2
AUDIOQUALITY=$3
RESOLUTION=$4
OUT=$(echo $1 | sed 's/^\(.*\)\.[a-zA-Z0-9]*$/\1/')

# Video quality values
QMAX=$(echo "63-($VIDEOQUALITY/1.7)" | bc)
QMIN=$(echo "$QMAX - 1" | bc)
QSCALE=$(echo "31-($VIDEOQUALITY/3.3)" | bc)

# Print out variables received
echo "Creating videos using IN=$IN OUT=$OUT VIDEOQUALITY=$VIDEOQUALITY AUDIOQUALITY=$AUDIOQUALITY"
echo "QMAX = $QMAX"
echo "QMIN = $QMIN"
echo "QSCALE = $QSCALE"

# Hardcoded Values
THREADS='2'
VIDEOCONSTANTRATEFACTOR=$(echo "51-($VIDEOQUALITY/2)" | bc) #this is only for x254 video encoding
AUDIOCHANNELS='2'

# webm
ffmpeg -i $IN -acodec libvorbis -vcodec libvpx -b 1M -aq $AUDIOQUALITY -ac $AUDIOCHANNELS -qmin $QMIN -qmax $QMAX -qscale $QSCALE -threads $THREADS -s $RESOLUTION $OUT.webm

# mp4
ffmpeg -i $IN -acodec aac -strict experimental -vcodec libx264 -crf $VIDEOCONSTANTRATEFACTOR -aq $AUDIOQUALITY -ac $AUDIOCHANNELS -qmin $QMIN -qmax $QMAX -qscale $QSCALE -threads $THREADS -s $RESOLUTION $OUT.mp4

# ogg (if you want to support older Firefox)
ffmpeg -i $IN -acodec libvorbis -vcodec libtheora -aq $AUDIOQUALITY -ac $AUDIOCHANNELS -qmin $QMIN -qmax $QMAX -qscale $QSCALE -threads $THREADS -s $RESOLUTION $OUT.ogv
