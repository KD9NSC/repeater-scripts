#! /bin/bash

# Get and parse data from DHT22
temphum=$(/etc/asterisk/scripts/dht22.out)
IFS=' - ' read -r TEMP HUMIDITY <<< "$temphum"

# Say output
/usr/bin/asl-tts -n 1000 -t "Repeater cabinet internal humidity is ${HUMIDITY:0:2} percent." -v "en_US-kathleen-low.onnx"
