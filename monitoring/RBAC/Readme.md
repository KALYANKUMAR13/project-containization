
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
gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:tester-service-account@[PROJECT_ID].iam.gserviceaccount.com" --role="roles/viewer"
```
