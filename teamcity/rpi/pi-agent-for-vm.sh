docker container prune -f
docker run -d --name teamcity-agent -v /var/run/docker.sock:/var/run/docker.sock image-repo:55000/teamcity-agent
echo "Press Ctrl-C to stop the logs (not the agent)"
docker logs -f teamcity-agent
