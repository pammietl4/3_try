#Basic pod creation via command line
kubectl run <name_of_the_pod> --image=nginx

#Pod creation via yaml file
kubectl create -f testpod1.yml

#Steps to create testpod1.yml file
kubectl run testpod1 -n alpha --image kiran2361993/kubegame:v1 --dry-run -o yaml    #deploying pod in a specific name space
kubectl run testpod1 --image nginx --dry-run -o yaml (below code will be displayed copy it & save it into new file)

apiVersion: v1
kind: Pod
metadata:
  labels:
    run: testpod1
  name: testpod1
spec:
  containers:
  - image: nginx
    name: testpod1

#save the above code into new file
nano testpod1.yml

# validate the newly created file by using the below command
kubectl apply -f testpod1.yml --dry-run

# if the above command is success then please use the below command to create pod
kubectl apply -f testpod1.yml


steps to create pod directly
#without creating any file you can directly copy & paste above code in linux by placing "echo" command

echo 'apiVersion: v1
kind: Pod
metadata:
  labels:
    run: testpod3
  name: testpod3
spec:
  containers:
  - image: nginx
    name: testpod3' | kubectl create -f -


#list the pods
kubectl get pods
kubectl get pods -o wide

#know the pod details like cpu memory from main server only
kubectl exec -it testpod2 -- env
kubectl exec -it testpod2 -- ls -al

#swith from Mainserver to pod 
kubectl exec -it testpod2 -- bash

#pod describe
kubectl describe pods
kubectl describe pod testpod1

#pod delete
kubectl delete pod testpod1

#forcefully pod deletion
kubectl delete pod testpod1 --force --grace-period 0

#port-forwarding (testing purpose only not for prod use cases)
kubectl port-forward testpod1 80:80  (is used only for testing purpose not for production scenarios)
kubectl port-forward testpod1 --address 0.0.0.0 80:80    (localhost)
kubectl port-forward testpod1 --address 0.0.0.0 80:80 &  (background run)
kubectl port-forward testpod1 --address 0.0.0.0 8080:80  (anyone can access from internet)

#logs
kubectl logs testpod1
kubectl logs testpod1 -f  (latest logs)

#linux command to split screen
tmux --> ctrl b + shift "  (you will see 2 windows in 1 screen)
#how to move the cursor in this case 
ctrl b + up arrow / ctrl b + down arrow

watch -n 1 kubectl get pods






    
