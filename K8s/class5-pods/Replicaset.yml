#to secure the pod from failure/termination/deletion 

apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modify replicas according to your case
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: app
        image: sreeharshav/rollingupdate:v1

#linux command to split screen
tmux --> ctrl b + shift "  (you will see 2 windows in 1 screen)
#how to move the cursor in this case 
ctrl b + up arrow / ctrl b + down arrow

watch -n 1 kubectl get pods

#delete pods
kubectl delete pods --all
kubectl delete pod frontend-7wpmr
ku delete pod flipkart-ltzcc flipkart-mkpr5 flipkart-r4v66

#forceful deletion of pod
kubectl delete pod frontend-f2wt5 --force --grace-period 0

#Label pods
kubectl get pods --show-labels

#pod information
kubectl get pods -o wide (detailed information of pods)

#scale pods
kubectl scale ReplicaSet flipkart --replicas 8







