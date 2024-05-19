To ge the nodes and its IP address, 
```
kubectl get nodes -o wide
```

Open particular port, when ever accessing with the browser.
In AWS, -> Security Groups 
In GCP, -> Firewall Rule

Install ingress controller(nginx ingress controller) through helm OR Directly ,
First add the repo
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
```

Then update the helm repo
```
helm repo update
```
The below command creates a helm chart named nginx-ingress and namespace
```
helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```


To install directly 
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```


To know the paths that we wrote manifest for ingress and nginx-controller able to identify the ingress resources or not(mapped Correctly)
```
kubectl describe ingress ingress
```


to Delete all resources in a particular namespace
```
kubectl delete all --all -n <Namespace>
```
