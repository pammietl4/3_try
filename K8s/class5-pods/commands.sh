#Before creatring cluster, we need to fill the below details in .bashrc path
# open this file & paste the below details
vim .bashrc  

export CLUSTER_NAME=lmlfinance.xyz
export AWS_REGION=ap-southeast-2
export NAME=lmlfinance.xyz
export KOPS_STATE_STORE=s3://lmlfinance.xyz
export KUBE_EDITOR=nano

#once you update the .bashrc file use below command to sync
source .bashrc

#cluster creation
kops create cluster --name=lmlfinance.xyz \
  --state=s3://lmlfinance.xyz \
  --zones=ap-southeast-2a,ap-southeast-2b \
  --node-count=2 \
  --control-plane-count=1 \
  --control-plane-size=t3.medium \
  --control-plane-zones=ap-southeast-2a \
  --control-plane-volume-size 10 \
  --node-volume-size 10 \
  --node-size=t3.medium \
  --ssh-public-key ~/.ssh/id_rsa.pub \
  --dns-zone=lmlfinance.xyz \
  --networking calico  --yes

# cluster creation via file! copy above code into file(lmlfinance.yaml)
kops create -f lmlfinance.yaml

#cluster information
kubectl cluster-info

#update cluster
kops update cluster --name lmlfinance.xyz --yes –admin

#node information
kubectl get nodes
kubectl get nodes -o wide


#Creation of pod
#Imperative format (command execution)
kubectl run testpod1 --image=nginx
#deletion of pod

#port-forwarding (testing purpose only not for prod use cases)
kubectl port-forward testpod1 80:80  (is used only for testing purpose not for production scenarios)
kubectl port-forward testpod1 --address 0.0.0.0 80:80    (localhost)
kubectl port-forward testpod1 --address 0.0.0.0 80:80 &  (background run)
kubectl port-forward testpod1 --address 0.0.0.0 8080:80  (anyone can access from internet)

#logs
kubectl logs testpod1
kubectl logs testpod1 -f  (latest logs)

#enter into pods
kubectl exec -it testpod2 -- env
kubectl exec -it testpod2 -- ls -al
kubectl exec -it testpod2 -- bash

#pod describe
kubectl describe pod testpod1

#pod delete
kubectl delete pod testpod1

#forcefully pod deletion
kubectl delete pod testpod1 --force --grace-period 0

#linux command to split screen
tmux --> ctrl b + shift "  (you will see 2 windows in 1 screen)
#how to move the cursor in this case 
ctrl v + up arrow / ctrl v + down arrow

watch -n 1 kubectl get pods


