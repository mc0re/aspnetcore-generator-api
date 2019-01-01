FROM resin/rpi-raspbian:stretch AS java-img

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y oracle-java8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-armhf

FROM java-img AS python3-img

RUN apt-get install -y wget curl
RUN apt-get install -y build-essential gcc g++ make cmake doxygen tree astyle
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-dev

FROM python3-img

RUN pip3 install pytest
RUN wget -q -O TeamCity.tar.gz https://download.jetbrains.com/teamcity/TeamCity-2018.2.1.tar.gz && \
    tar -xzvf TeamCity.tar.gz && \
    rm TeamCity.tar.gz
