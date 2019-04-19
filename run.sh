#!/bin/bash

cd /usr/src/app/

# Run an image classification sample
python3 /usr/local/lib/python3.5/dist-packages/edgetpu/demo/classify_image.py \
--model mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
--label inat_bird_labels.txt \
--image parrot.jpg

sleep infinity
