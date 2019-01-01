#FROM p47phoenix/teamcity_oraclejdk-8
FROM resin/rpi-raspbian:stretch
RUN apt-get update
RUN apt-get install -y oracle-java8-jdk
RUN update-java-alternatives -s jdk-8-oracle-arm32-vfp-hflt
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-armhf

#FROM hypriot/rpi-java

RUN apt-get install -y wget curl build-essential gcc g++ make cmake doxygen tree astyle python python3 python-pip python3-pip

RUN pip install pytest
RUN pip install -U platformio


RUN wget -q -O TeamCity.tar.gz https://download.jetbrains.com/teamcity/TeamCity-2018.2.1.tar.gz && \
    tar -xzvf TeamCity.tar.gz && \
    rm TeamCity.tar.gz

EXPOSE 8111 9090

ENV TEAMCITY_DATA_PATH /data/teamcity_server/datadir
ENTRYPOINT [ "TeamCity/bin/teamcity-server.sh" , "run" ]
