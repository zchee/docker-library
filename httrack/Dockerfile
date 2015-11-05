FROM buildpack-deps:trusty
MAINTAINER zchee <zchee.io@gmail.com>

RUN git clone https://github.com/xroche/httrack.git --recurse
RUN cd httrack && \
      ./configure --disable-dependency-tracking && make -j$(nproc) && make install

ENTRYPOINT ["httrack"]
