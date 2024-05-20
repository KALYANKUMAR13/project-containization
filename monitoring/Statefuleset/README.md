Deploy service, statefulset and secret by following commands
```
kubectl apply -f mysql-service.yaml
kubectl apply -f mysql-statefulset.yaml
kubectl apply -f mysql-secret.yaml
```

The follwing command shows the pods up
```
kubectl get pods -l app=mysql
```

To check mysql is running, go inside mysql pod, prompt will ask for password, enter 'password', that I kept in secret.yaml file in base64 encoded
```
kubectl exec -it mysql-0 -- mysql -u root -p
```
The below command will displays the database in mysql pod.
```
SHOW DATABASES;
```

To check persistant volumes is working, we are creating a db named example in pod-0 and deleting it. But statefulset recreate the pod and it should attach to particulat volume
```
kubectl exec -it mysql-0 -- mysql -u root -p -e "CREATE DATABASE example;"
```

Delete the pod-0
```
kubectl delete pod mysql-0
```

After recreating the new pod, that particular volume is attached to pod-0, pod-o will have less age.
check the pod's age 
```
kubectl get pods
```
Then check the db that we created before deletion is present or not. 
It should be there. 
```
kubectl exec -it mysql-0 -- mysql -u root -p -e "SHOW DATABASES;"
```
