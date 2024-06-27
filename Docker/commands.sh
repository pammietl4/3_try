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

#container creation
docker run -d --name app1 nginx

#list conatiners
docker container ls



