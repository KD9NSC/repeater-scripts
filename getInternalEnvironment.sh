TEMPHUM="$(./dht22.out)"
IFS=' - ' read -r TEMP HUMIDITY <<< "$TEMPHUM"

if [[ $TEMPHUM =~ "x_x" ]]; then
  NTEMPHUM="$(./dht22.out)"
  NIFS=' - ' read -r NTEMP NHUMIDITY <<< "$NTEMPHUM"

  
  asl-tts -n 1000 -t "Internal Temperature is ${NTEMP:0:4} degrees fahrenheit." -v "en_US-kathleen-low.onnx"
  asl-tts -n 1000 -t "Internal humidity is ${NHUMIDITY:0:2} percent." -v "en_US-kathleen-low.onnx"
else
  asl-tts -n 1000 -t "Internal Temperature is ${TEMP:0:4} degrees fahrenheit." -v "en_US-kathleen-low.onnx"
  asl-tts -n 1000 -t "Internal humidity is ${HUMIDITY:0:2} percent." -v "en_US-kathleen-low.onnx"
fi
