#Imagine if some reason Database container failed, we will loose all the data to avoild this Problem Volumes came into picture ( we can take the snapshot of the volume)

#list volumes
docker volume ls

#create volume
docker volume create mongodb-vol

#Create container & attach volume to it
docker run --rm -d --name mongodb -v mongodb-vol:/data/db -p 27017:27017 mongo:latest

#command to enter inside Database container
docker exec -t <Image_name/container_id> mongosh

#command to enter inside nginx container
docker exec -it <Image_name/container_id> bash

#Once entered into the mongodb container, check the tables
show dbs;

#create a table with sample data

db.helo.insertMany([
{ "_id" : 1, "name" : "Matt", "status": "active", "level": 12, "score":202},
        	{ "_id" : 2, "name" : "Frank", "status": "inactive", "level": 2, "score":9},
        	{ "_id" : 3, "name" : "Karen", "status": "active", "level": 7, "score":87},
        	{ "_id" : 4, "name" : "Katie", "status": "active", "level": 3, "score":27, "status": "married", "emp": "yes", "kids": 3},
        	{ "_id" : 5, "name" : "Matt1", "status": "active", "level": 12, "score":202},
        	{ "_id" : 6, "name" : "Frank2", "status": "inactive", "level": 2, "score":9},
        	{ "_id" : 7, "name" : "Karen3", "status": "active", "level": 7, "score":87},
        	{ "_id" : 8, "name" : "Katie4", "status": "active", "level": 3, "score":27, "status": "married", "emp": "yes", "kids": 3}
        	])
db.helo.find({name: "Katie"})

#validate the newly created table
show dbs;
db.helo.find()

#Exit from the database
exit

#stop the database container
docker stop mongodb

#create new container & attach the same volume
docker run --rm -d --name mongodatabase -v mongodb-vol:/data/db -p 27017:27017 mongo:latest

#enter into the conatiner
docker exec -it mongodatabase mongosh

#validate the old files are exit/ not
show dbs
db.helo.find()
exit

#validate the same from folder path
cd /dockerdata/volumes/mongodb-vol/_data

#Create snapshot of this volume
Go to GUI -->Volume -->create snapshot

#list the networks
docker network ls

#Create container with none network
docker run --rm -d --name app1 --network none kiran2361993/troubleshootingtools:v1

#command to Enter inside the container
docker exec -it app1 bash

#once you are in inside the container & try to execute thr below commands (it will fail)
root@05cb86949637:/# docker ps
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
root@05cb86949637:/# docker images
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

#container does not know what the containers are running on the Host

How to fix the attached error (how to get the details of the host from container) by using docker socket

#Assigning docker socket to container
docker run --rm -d --name app1 -v /var/run/docker.sock:/var/run/docker.sock --network none kiran2361993/troubleshootingtools:v1

#docker exec -it app1 bash
#docker ps  (you will get the details of host in container)
#docker images (you will get the details of host in container)

#None network doesn't contain ip address
docker inspect app1 | grep -ie 'IPAddress'












