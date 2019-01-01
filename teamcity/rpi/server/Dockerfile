FROM image-repo:55000/teamcity
EXPOSE 8111 9090

ENV TEAMCITY_DATA_PATH /data/teamcity_server/datadir
ENTRYPOINT [ "/TeamCity/bin/teamcity-server.sh" , "run" ]
