apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: app1
  name: app1
spec:
  replicas: 4
  selector:
    matchLabels:
      app: app1
  #strategy: {}
  template:
    metadata:
      labels:
        app: app1
    spec:
      containers:
      - image: sreeharshav/testcontainer:v1
        name: testcontainer
#        resources: {}
#status: {}

#to get the above code
kubectl create deployment app1 --image nginx --replicas 4 --dry-run -o yaml
#deployment delete
kubectl delete deployment app1

