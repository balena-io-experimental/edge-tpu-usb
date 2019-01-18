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

ADD run.sh /usr/src/app/run.sh

CMD ["/usr/src/app/run.sh"]
