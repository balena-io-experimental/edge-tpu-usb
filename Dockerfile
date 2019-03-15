# Built using https://coral.withgoogle.com/tutorials/accelerator/
FROM balenalib/rpi-raspbian

# Install some utilities we will need
RUN apt-get update && apt-get install build-essential wget feh

# Set our working directory
WORKDIR /usr/src/app

# Need udev for some dynamic dev nodes
ENV UDEV=1

RUN wget http://storage.googleapis.com/cloud-iot-edge-pretrained-models/edgetpu_api.tar.gz

RUN tar xzf edgetpu_api.tar.gz

WORKDIR /usr/src/app/python-tflite-source

# Bypass platform checks as we build on our cloud arm builders and not on device
RUN sed -i "s|source ./platform_recognizer.sh|#source ./platform_recognizer.sh|g" install.sh
# Set platform as pi3b
ENV platform raspberry_pi_3b

# Pass N to the prompt in the install script if we want to overclock the tpu
RUN yes n | ./install.sh

ADD run.sh /usr/src/app/run.sh

CMD ["/usr/src/app/run.sh"]
