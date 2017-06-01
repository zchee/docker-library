FROM resin/rpi-raspbian

LABEL maintainer zchee <https://github.com/zchee>
LABEL description="Docker image for mjpg_streamer on Raspberry Pi"

# Need to run container with the device: docker run -t -i -p 8080:8080/tcp --device=/dev/video0 image:tag
RUN apt-get update \
    && apt-get install --no-install-recommends \
      build-essential \
      cmake \
      git \
      libjpeg8-dev \
      pkg-config \
    && rm -rf /var/lib/apt/lists/* \
    \
    && git clone https://github.com/jacksonliam/mjpg-streamer.git \
    && cd /mjpg-streamer/mjpg-streamer-experimental \
    \
    && make \
    && make install \
    && chmod +x docker-start.sh

WORKDIR /mjpg-streamer/mjpg-streamer-experimental

EXPOSE 8080/TCP

ENTRYPOINT ["/mjpg-streamer/mjpg-streamer-experimental/docker-start.sh", "output_http.so -w ./www"]

CMD ["input_raspicam.so"]
