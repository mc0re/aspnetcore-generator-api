# Keep only the last 3 images
# Assumptions:
# - The registry container is called "registry"
# - The volume is mapped to /mnt/mycloud/Work/DockerRegistry/
# - The registry host name is "image-repo"
# - The script is executed on the registry host
export REPO=generator
for hash in `ls /mnt/mycloud/Work/DockerRegistry/docker/registry/v2/repositories/$REPO/_manifests/revisions/sha256/ -t | tail -n +3`; do
    curl -X DELETE http://image-repo:55000/v2/$REPO/manifests/sha256:$hash
done
docker exec `docker ps -f name=^registry$ -q` /bin/registry garbage-collect /etc/docker/registry/config.yml
