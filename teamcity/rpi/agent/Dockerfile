FROM image-repo:55000/teamcity

RUN wget get.docker.com -O- | sh
RUN apt install -y git
RUN mkdir ~/compose &&\
    cd ~/compose &&\
    git clone https://github.com/docker/compose.git &&\
    cd compose &&\
    git checkout release &&\
    docker build -t docker-compose:armhf -f Dockerfile.armhf . &&\
    docker run --rm --entrypoint="script/build/linux-entrypoint" -v $(pwd)/dist:/code/dist -v $(pwd)/.git:/code/.git -v /var/run/docker.sock:/var/run/docker.sock "docker-compose:armhf" &&\
    docker image ls docker-compose -q | xargs -r docker image rm &&\
    sudo cp dist/docker-compose-Linux-armv7l /usr/local/bin/docker-compose &&\
    sudo chown root:root /usr/local/bin/docker-compose &&\
    sudo chmod 0755 /usr/local/bin/docker-compose &&\
    cd ~ &&\
    rm -rf compose

ADD buildAgent.properties /TeamCity/buildAgent/conf/
EXPOSE 8111 8090
ENTRYPOINT [ "/TeamCity/buildAgent/bin/agent.sh", "run" ]
