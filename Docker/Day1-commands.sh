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

#delete the un-used images
docker 

#container creation
docker run -d --name app1 nginx

#list containers
docker container ls

#list running containers
docker ps -aq

#stop running conatiner
docker stop < container_id >

#restart running conatiner
docker restart < container_id >

#list running containers
docker ps -aq

#list stopped & running containers
docker ps -a











