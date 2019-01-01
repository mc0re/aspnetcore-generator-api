FROM image-repo:55000/teamcity

ADD buildAgent.properties /TeamCity/buildAgent/conf/
EXPOSE 8111 8090
ENTRYPOINT [ "/TeamCity/buildAgent/bin/agent.sh", "run" ]
