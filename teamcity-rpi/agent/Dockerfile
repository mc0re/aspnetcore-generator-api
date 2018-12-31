FROM p47phoenix/teamcity_oraclejdk-8
#FROM hypriot/rpi-java

#RUN apt-get update && \
#	apt-get install -y wget curl build-essential gcc g++ make cmake doxygen tree astyle python python3 python-pip python3-pip

#RUN pip install pytest

#RUN pip install -U platformio

RUN wget -q -O TeamCity.tar.gz https://download.jetbrains.com/teamcity/TeamCity-2018.2.1.tar.gz && \
    tar -xzvf TeamCity.tar.gz && \
    rm TeamCity.tar.gz

ADD buildAgent.properties TeamCity/buildAgent/conf/

EXPOSE 8111 8090

ENTRYPOINT [ "TeamCity/buildAgent/bin/agent.sh", "run" ]
