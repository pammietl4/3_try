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

#creation of containers via shell scrip
for i in {1..6}
do
docker run -d nginx
done

#list containers
docker container ls

#list running containers
docker ps -aq

#stop single/all running conatiner
docker stop < container_id >
docker stop $(docker ps -aq)

#start single/all running conatiner
docker start < container_id >
docker start $(docker ps -aq)

#restart singe/all running conatiner
docker restart < container_id >
docker restart $(docker ps -aq)

#list running containers
docker ps -aq

#list stopped & running containers
docker ps -a

#delete single/all running conatiner
docker rm -f < container_id >
docker rm -f $(docker ps -aq)

#delete single/all stopped container
docker rm < container_id >
docker rm $(docker ps -aq)











