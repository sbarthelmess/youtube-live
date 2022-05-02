#!/bin/bash
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Absolutely FREE YouTube LIVE Streaming on Raspberry PI
# This is the heart of the beast, streams freely to your youtube
# channel, and if there is a disruption it maintains the video_id for you.
# 
# Recommend 32-bit RPI3b, only pre-requisite is FFMPEG installed
#   NOTE: We've run our puppycam off this for years now without issue.
#
# Written and maintained by Sebastian Barthelmess, seb@latestlinux.com 
# go ahead improve it (I dare you)
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

RTMP_URL="rtmp://a.rtmp.youtube.com/live2"
# Put your channel ID here from Studio LIVE! channel dashboard where you set up your stream
# aka: https://studio.youtube.com/
CHANNEL="XXXXXXXXXXXX_XXXXXXXXXXX"
# Get this from the stream "Go Live!" stream key (paste in encoder)
STREAM_KEY="XXXX-XXXX-XXXX-XXXX-XXXX"
OUTPUT=$RTMP_URL/$STREAM_KEY

# Stream WEBCAM (ensure you are using the OLD/deprecated Camera in raspi-config)
# this streams our webcam at 720p, feel free to bump up size and bitrate on first line 
raspivid -w 1280 -h 720 -o - -t 0 -fps 24 -b 250000 | \
 ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero \
 -f h264 -thread_queue_size 256 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental \
 -flags +global_header -preset veryfast -f flv $OUTPUT 

# Update URL, clever means to get this WITHOUT using throttled Youtube APIs, pulls the video_id from the channel id
VIDEO_ID=`wget -q -O- https://www.youtube.com/embed/live_stream?channel=$CHANNEL | grep -oP '"video_id":\s*\K[^\s,]*(?=\s*})' | xargs`
wget -q -O- "https://monadnockbreeders.com/stream.php?stream_id=${VIDEO_ID}"
