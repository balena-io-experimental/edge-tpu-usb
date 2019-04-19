# Built using https://coral.withgoogle.com/tutorials/accelerator/
FROM balenalib/raspberrypi3-debian

# Install some utilities we will need
RUN apt-get update && apt-get install build-essential wget feh

# Set our working directory
WORKDIR /usr/src/app

# Need udev for some dynamic dev nodes
ENV UDEV=1

RUN wget https://dl.google.com/coral/edgetpu_api/edgetpu_api_latest.tar.gz -O edgetpu_api.tar.gz --trust-server-names && \
    tar xzf edgetpu_api.tar.gz && rm edgetpu_api.tar.gz

WORKDIR /usr/src/app/edgetpu_api

ENV MODEL="Raspberry Pi 3 Model B Rev"
RUN sed -i "s|MODEL=|#MODEL=|g" install.sh


# Pass N to the prompt in the install script if we want to overclock the tpu
RUN yes n | ./install.sh

# Set our working directory
WORKDIR /usr/src/app

RUN wget https://storage.googleapis.com/cloud-iot-edge-pretrained-models/canned_models/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
http://storage.googleapis.com/cloud-iot-edge-pretrained-models/canned_models/inat_bird_labels.txt \
https://coral.withgoogle.com/static/images/parrot.jpg

COPY run.sh run.sh

CMD ["bash","run.sh"]
