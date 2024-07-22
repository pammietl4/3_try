# list Manager/worker nodes
docker node ls

# Create nginx conatiner using swarm
docker service create --name app1 --replicas 6 --publish 8000:80 nginx
docker service create --name app2 --replicas 2 --publish 8001:80 httpd

# list services
docker service ls

# list the replicas of the service
docker service ps app1

# increase/ decrease of the replicas
docker service scale app1=3
docker service scale app1=6

#change node status
docker node update ip-172-31-24-209 --availability pause/active/drain
