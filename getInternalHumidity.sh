TEMPHUM="$(./dht22.out)"

IFS=' - ' read -r TEMP HUMIDITY <<< "$TEMPHUM"

asl-tts -n 1000 -t "Internal humidity is ${HUMIDITY:0:2} percent" -v "en_US-kathleen-low.onnx"
