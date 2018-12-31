FROM teamcity_oraclejdk-8
LABEL MAINTAINER pixelistik <code@pixelistik.de>

RUN wget -v https://download.jetbrains.com/teamcity/TeamCity-10.0.4.tar.gz && \
    tar -xzvf TeamCity-10.0.4.tar.gz && \
    rm TeamCity-10.0.4.tar.gz

EXPOSE 8111 9090

ENV TEAMCITY_DATA_PATH /data/teamcity_server/datadir
ENTRYPOINT [ "TeamCity/bin/teamcity-server.sh" , "run" ]
