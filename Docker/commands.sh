#Install tools
apt update && apt install jq net-tools

#Docker Installation
curl https://get.docker.com/ |bash

#Docker version
docker version

#download image
docker pull nginx

#list available images
docker images
docker image ls



