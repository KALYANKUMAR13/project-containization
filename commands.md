 
To run mysql container
```
docker run -d --network app --name mysql  -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=sys --mount source=vol,target=/var/lib/mysql  -p 3308:3306 mysql
```

To run a app(Soring boot, that needs mysql, So mysql is as a docker container in the previous step
```
docker run --network app -e MYSQL_HOST=mysql -e MYSQL_PORT=3306 -p 8080:8080 -d project-app
```
------------------------------------
For Docker Swarm Implementation of the same application
```
docker swarm init 
```
To deploy the file 
```
docker stack deploy -c <filename> <stack_name>
```

To leave from the cluster
```
docker swarm leave --force
```

---------------------------
ArgoCD in minikube,
Create a namespace for all the services
```
kubectl create namespace argocd
```

Install the manifest
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```


To list the service in namespace argocd:
```
minikube service list -n argocd
```

Port-forwarding the service with Minikube
```
minikube service argocd-server -n argocd
```

list the file name, to get the secret
```
kubectl get secret -n argocd
```
Password for Argocd login
```
kubectl edit secret argocd-initial-admin-secret -n argocd
```


--------------------


 helm install wordpress-db . -n wpdb -f dev/values.yaml --create-namespace

helm install <helm name> 

-----------------------------------------------------


In Docker, 
CMD vs RUN
RUN - while building the image
CMD - WHile running the image that( in Dockerfile)

ENTRYPOINT - This one has high preference, when compared to CMD. So If we give mutiple commands, ENTRYPOINT will take highest preference.

ENV - values can't be over riden in CLi, 
In ARG, we can override the values in CLi, while running the image.


Precedence Rules

When both ENTRYPOINT and CMD are specified in a Dockerfile, **CMD serves as the default arguments to the ENTRYPOINT instruction**.
If you run the container with additional arguments, those arguments will override the CMD instruction but will be appended to the ENTRYPOINT.


Distroless Images, -> it has only runtime. When we use this, we are not having any vulnerability with other stuffs to the image.

https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/

**Distroless Images**

These are minimal docker images, that have NECESSARY dependencies to run the applications.  For example, for a python distro-less image, the image has only python run-time, Not even other basic dependencies like curl, wget.

