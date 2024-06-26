#Run this command to get the below code
kubectl create deployment app1 --image nginx --replicas 4 --dry-run -o yaml


apiVersion: apps/v1
kind: Deployment
metadata:  
  labels:
    app: app1
  name: app1
spec:
  minReadyseconds: 10
  replicas: 6
  selector:
    matchLabels:
      app: app1
  strategy:    
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  template:
    metadata:      
      labels:
        app: app1
    spec:
      containers:
      - image: nginx
        name: nginx

# copy above code into a txt file(app.yml) & use the below command to execute it
kubectl apply -f app.yml


#to modify images/env/replicas use the below code
kubectl edit deployment.app app1

# deployment list
kubectl get deployments -o wide

# Replicaset list
kubectl get replicaset -o wide

#pods list
kubectl get pods --show-labels

#deployment delete
kubectl delete deployment app1




