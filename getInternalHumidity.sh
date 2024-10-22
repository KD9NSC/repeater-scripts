TEMPHUM="$(./dht22.out)"
IFS=' - ' read -r TEMP HUMIDITY <<< "$TEMPHUM"

if [[ $TEMPHUM == *"x_x"* ]]; then
  asl-tts -n 1000 -t "Unable to read the humidity. Please try again in a minute" -v "en_US-kathleen-low.onnx"
else
  asl-tts -n 1000 -t "Internal humidity is ${HUMIDITY:0:2} percent." -v "en_US-kathleen-low.onnx"
fi
