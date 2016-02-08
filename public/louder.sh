ffmpeg -i $1 $1.wav
#sox $1.wav $1.loud.wav loudness 12 fade 0.1
sox $1.wav $1.loud.wav loudness 3 fade 0.1
#sox $1.wav $1.loud.wav loudness 12
lame $1.loud.wav $1.loud.mp3
rm $1.wav $1.loud.wav
