# containers are stateless ---> imagine if a running containers is failed & cameback (ip address will be changed)

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

#delete images
docker rmi <image_name>

#delete un-used images/volumes/networks
docker system prune -a

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

#docker port-forwarding (imagine we have 3 containers frontend/backend/database)
docker run --rm -d --name frontend -p 8000:80 nginx:latest
docket run --rm -d --name backend -p 8001:80 kiran2361993/rollingupdate:v10
docket run --rm -d --name database -p 8002:80 nginx

#Port no details
docker port < container_id >

#detailed information of container
docker inspect < container_id >

#enter into a container bash
docker exec -t < container_id > bash

#come out of container without exit
ctrl+p , ctrl+q

#again you want to enter into exited container
docker attach < container_id >

#containers path
cd /var/lib/docker/containers/

#Once containers are created login to it & get the logs
cd /var/lib/docker/containers/<container_id> 
ll
cat a2036bd1660840fec44567f27d5f53e5b6ae776c2c56d83f150d880af98b1cf6-json.log | jq
cat a2036bd1660840fec44567f27d5f53e5b6ae776c2c56d83f150d880af98b1cf6-json.log | jq > INC01478528.log














