#Imagine if some reason Database container failed, we will loose all the data to avoild this Problem Volumes came into picture ( we can take the snapshot of the volume)

#command to enter into Database container
docker exec -t <Image_name/container_id> mongosh

#command to enter into nginx container
docker exec -t <Image_name/container_id> bash

