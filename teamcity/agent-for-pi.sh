# teamcity-pi-server shall point to the server
# image-repo points to image repository
export AGENT_NAME=agent-vm
docker ps -f name=$AGENT_NAME -q | xargs -r docker stop
docker container rm $AGENT_NAME > /dev/null
docker run -d \
    --network="host" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e SERVER_URL=http://teamcity-pi-server:8111 \
    --name $AGENT_NAME \
    jetbrains/teamcity-agent:latest
