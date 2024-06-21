Imperative format (command execution)
#Creation of pod 
kubectl run testpod1 --image=nginx
#deletion of pod

kubectl port-forward testpod1 --address 80:80  (is used only for testing purpose not for production scenarios)