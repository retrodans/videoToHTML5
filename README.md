# Developer Notes
* Written for Ubuntu
* Originally based on https://gist.github.com/yellowled/1439610
* Useful reading (webm):
  * https://gist.github.com/yellowled/1439610
  * http://daniemon.com/blog/how-to-convert-videos-to-webm-with-ffmpeg/
  * http://stackoverflow.com/questions/5603825/ffmpeg-terrible-conversion-quality-when-using-sameq-same-quantizer-as-source

## Requirements
* ffmpeg
* ffmpeg2theora

## Usage
Ensure the script has the executable bit set then simply run it using a command such as
```./videoToHTML5.sh original_video.mov 70 5 640x360```
* Param1 = the video file
* Param2 = The video quality to use
* Param3 = The audio quality to use

If you want a more high-res video for desktop use (the above could look grainy when full-screen) then try these settings
```./videoToHTML5.sh original_video.mov 80 5 1280x720```

## Troubleshooting
*No known bugs as yet*

## Notes
You may already know that with video compression, fine tuning is often required.  This script may then be just a good starting point for you to jump in and tweak a few of the settings yourself to get exactly the filesize and quality you desire.
