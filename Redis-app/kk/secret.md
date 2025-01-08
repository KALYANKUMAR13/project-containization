```
kubectl create secret generic mysql-secret \
  --from-literal=root-password=rootpassword \
  --from-literal=user=myuser \
  --from-literal=password=mypassword \
  --from-literal=host=mysql-service \
  --from-literal=database=mydatabase
```
