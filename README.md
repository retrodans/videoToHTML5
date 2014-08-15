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
```./videoToHTML5.sh original_video.mov 25 5```
* Param1 = the video file
* Param2 = The video quality to use
* Param3 = The audio quality to use

## Troubleshooting
*No known bugs as yet*
