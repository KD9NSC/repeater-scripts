TEMPHUM="$(./dht22.out)"

IFS=' - ' read -r TEMP HUMIDITY <<< "$TEMPHUM"

asl-tts -n 1000 -t "Internal Temperature is ${TEMP:0:4} degrees fahrenheit." -v "en_US-kathleen-low.onnx"
