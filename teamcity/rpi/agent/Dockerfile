FROM image-repo:55000/teamcity

COPY compose-dist/docker-compose /usr/local/bin/docker-compose
RUN chmod 0755 /usr/local/bin/docker-compose
RUN wget get.docker.com -O- | sh

ADD buildAgent.properties /TeamCity/buildAgent/conf/
EXPOSE 8111 8090
ENTRYPOINT [ "/TeamCity/buildAgent/bin/agent.sh", "run" ]
