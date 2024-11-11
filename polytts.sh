# ./polytts.sh <inputfile with extension> <output file without extension>

outputfile=$2
textinput=$(<$1)

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=

aws polly synthesize-speech --output-format mp3 --voice-id Joanna --text "$textinput" $outputfile.mp3
ffmpeg -i $filename.mp3 -ar 8000 -ac 1 -ab 64 -f mulaw $outputfile.pcm -map 0:0 -map 0:0 -y
/usr/sbin/asterisk -rvx "rpt localplay 52318 $(pwd)/$outputfile"
