#!/bin/bash

cd /usr/share/edgetpu/examples/

python3 classify_image.py \
--model models/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
--label models/inat_bird_labels.txt \
--image images/parrot.jpg

sleep infinity
