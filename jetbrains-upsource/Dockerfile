FROM debian:wheezy

EXPOSE 8080
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install unzip wget openjdk-7-jdk
RUN wget -q http://download-cf.jetbrains.com/upsource/upsource-1.0.12566.zip && unzip upsource-1.0.12566.zip
RUN cd Upsource && ./bin/upsource.sh start
