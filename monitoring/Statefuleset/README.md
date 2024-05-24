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

To check persistant volumes is working, we are creating a db named example in pod-0 and deleting it. But statefulset recreate the pod and it should attach to particular volume
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
If you deleted statefulset, persistent volumes and persistent volume cliams will not deleted unlike deployment, 
So get persistent volume  and delete it
```
kubectl get pvc
kubectl get pv
```
To delete all pvc and pv or else, delete by name based on needs
```
kubectl delete pvc --all
kubectl delete pv --all
```

A Persistent Volume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using StorageClasses. PVs are a cluster resource, similar to a node, and they have a lifecycle that is independent of any individual pod that uses the PV.

A Persistent Volume Claim (PVC) is a request for storage by a user. PVCs are used by pods to request specific amounts and types of storage. The PVC specifies the desired storage capacity, access modes, and optionally the storage class. When a PVC is created, Kubernetes looks for a suitable PV that meets the claim's requirements and binds the PVC to that PV.

Statefulset -> PVC -> StorageClass -> Provisioner -> PV
