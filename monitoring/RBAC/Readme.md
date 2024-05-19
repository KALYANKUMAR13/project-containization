
By default, service account is created, 
With default service account we are accessing the api server.

K8s does not manage user management, service account takes care of that.
Role will tell the permissions and
Role Binding will bind the service account and role.

----

Creating a service account in gcp for tester ,
```
gcloud iam service-accounts create tester-service-account --display-name="Tester Service Account"
```

Command to get the PROJECT_ID from cli:
```
gcloud config get-value project
```

next, We can grant view role to that.
```
gcloud projects add-iam-policy-binding [PROJECT_ID] \
--member="serviceAccount:tester-service-account@[PROJECT_ID].iam.gserviceaccount.com" \
--role="roles/viewer"

```
Create a tester-read-only-role.yaml and deploy it 
```
kubectl apply -f tester-read-only-role.yaml
```

Then create roleBinding manifest, tester-read-only-rolebinding.yaml and deploy it 
```
kubectl apply -f tester-read-only-rolebinding.yaml
```

Command to view role and rolebinding 
```
kubectl get roles
kubectl get rolebindings
```

If the service account needs to interact directly with the Kubernetes API, we should create a corresponding Kubernetes service account and bind it to the IAM service account.
```
kubectl create serviceaccount tester-service-account --namespace=default
```

Then, 
Annotate the Kubernetes Service Account with the IAM service account in CLI:
```
kubectl annotate serviceaccount tester-service-account \
--namespace=default \
iam.gke.io/gcp-service-account=tester-service-account@[PROJECT_ID].iam.gserviceaccount.com
```

To use this service account, the tester will need the credentials. You can create and download a key for the service account and provide it to them:
```
gcloud iam service-accounts keys create tester-service-account-key.json \
--iam-account=tester-service-account@[PROJECT_ID].iam.gserviceaccount.com
```

----------------
the tester, should install Google cloud SDK and authenticate by 
```
gcloud auth activate-service-account --key-file=path/to/tester-service-account-key.json
```

Set the project ID 
```
gcloud config set project [PROJECT_ID]
```

Get Credentials for the GKE Cluster name and location
```
gcloud container clusters get-credentials [CLUSTER_NAME] --zone [CLUSTER_ZONE]
```

Then, if try to deploy a manifest, you can't do it , warning appears.

-----

To return to default service account, we need to login with gcp
```
gcloud auth login
```

Select the particular project 
```
gcloud config set project [PROJECT_ID]
```

To get the Cluster, enter the credentials,
```
gcloud container clusters get-credentials [CLUSTER_NAME] --zone [CLUSTER_ZONE]
```
