FROM p47phoenix/teamcity_oraclejdk-8

RUN wget -q -O TeamCity.tar.gz https://download.jetbrains.com/teamcity/TeamCity-2018.2.1.tar.gz && \
    tar -xzvf TeamCity.tar.gz && \
    rm TeamCity.tar.gz

EXPOSE 8111 9090

ENV TEAMCITY_DATA_PATH /data/teamcity_server/datadir
ENTRYPOINT [ "TeamCity/bin/teamcity-server.sh" , "run" ]
