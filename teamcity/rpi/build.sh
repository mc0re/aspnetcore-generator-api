docker build -t image-repo:55000/teamcity:armhf-latest common
docker push image-repo:55000/teamcity:armhf-latest

docker manifest create --insecure image-repo:55000/teamcity:latest image-repo:55000/teamcity:armhf-latest
docker manifest annotate image-repo:55000/teamcity:latest image-repo:55000/teamcity:armhf-latest --os linux --arch arm
docker manifest push image-repo:55000/teamcity:latest

docker build -t teamcity-server server

# Docker-in-docker does not work (missing "RUN --mount" option),
# so we build docker-compose locally.
if [ ! -f compose-dist/docker-compose ]; then
mkdir -p ~/compose
pushd .
cd ~/compose
git clone https://github.com/docker/compose.git
cd compose
git checkout release
docker build -t docker-compose:armhf -f Dockerfile.armhf .
popd
mkdir -p compose-dist

pwd
ls -al ~/compose/compose
docker run \
    --entrypoint="script/build/linux-entrypoint" \
    -v $(pwd)/compose-dist:/code/dist \
    -v ~/compose/compose/.git:/code/.git \
    -v /var/run/docker.sock:/var/run/docker.sock \
    "docker-compose:armhf"
rm -rf ~/compose
mv compose-dist/docker-compose-Linux-armv7l compose-dist/docker-compose
chmod 755 compose-dist/docker-compose
# docker image ls docker-compose -q | xargs -r docker image rm
fi

# Now docker-compose is in a subdirectory "compose-dist*"
docker build -t teamcity-agent agent
