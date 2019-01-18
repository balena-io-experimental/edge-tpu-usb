#!/bin/bash

cd python-tflite-source

if [[ BALENA_DEVICE_TYPE -eq fincm3 ]] ; then
	#if we are fincm3, run a sed to fake a pi3b platform
	sed -i "s/Raspberry Pi 3 Model B Rev/Raspberry Pi Compute Module 3/g" platform_recognizer.sh
fi

# The script has an interactive y/n question about raising the max
# frequency of the tpu. Pass N to the script.
yes n | ./install.sh

cd edgetpu

# Run an image classification sample
python3 demo/classify_image.py \
--model test_data/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
--label test_data/inat_bird_labels.txt \
--image test_data/parrot.jpg

sleep infinity
