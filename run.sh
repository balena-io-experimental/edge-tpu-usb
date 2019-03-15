#!/bin/bash

cd /usr/src/app/python-tflite-source/edgetpu

# Run an image classification sample
python3 demo/classify_image.py \
--model test_data/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
--label test_data/inat_bird_labels.txt \
--image test_data/parrot.jpg

sleep infinity
