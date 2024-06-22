Imperative format (command execution)
#Creation of pod 
kubectl run testpod1 --image=nginx
#deletion of pod

#port-forwarding
kubectl port-forward testpod1 80:80  (is used only for testing purpose not for production scenarios)
kubectl port-forward testpod1 --address 0.0.0.0 80:80
kubectl port-forward testpod1 --address 0.0.0.0 80:80 &  (background run)
kubectl port-forward testpod1 --address 0.0.0.0 8080:80  (localhost)