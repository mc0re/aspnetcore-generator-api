docker build -t image-repo:55000/teamcity:armhf-latest common
docker push image-repo:55000/teamcity:armhf-latest

docker manifest create --insecure image-repo:55000/teamcity:latest image-repo:55000/teamcity:armhf-latest
docker manifest annotate image-repo:55000/teamcity:latest image-repo:55000/teamcity:armhf-latest --os linux --arch arm
docker manifest push image-repo:55000/teamcity:latest
