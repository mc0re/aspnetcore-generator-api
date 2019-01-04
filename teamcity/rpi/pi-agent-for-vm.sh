docker run -d --name teamcity-agent -v /var/run/docker.sock:/var/run/docker.sock teamcity-agent
echo "Press Ctrl-C to stop the logs (not the agent)"
docker logs teamcity-agent -f
