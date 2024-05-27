**What** 
What is service mesh
Helps with traffic management of k8s cluster (East-West traffic), 

The traffic comes from outside the k8s cluster is know as North-South traffic.
The internal traffic between one service to another is called East-West traffic.

**Why**
istio provides MTLS,MutualTLS
A certificate is provided to each service in k8s cluster by istio for secure communication.

It provides advanced deployment strategies like canary, A-B, blue green.
canary - we are directing 10% of traffic to new version and checking, eventually we are increasing the traffice to new version based on the performance of new version.

Kiali is well integrated with istio, keep track of service to service communication.

**How**
Istio provides a container to all pod, whichever namespace it has access to. That container is called side-car container. 

The side-car container has Envoy proxy application.

This proxy service, manages the traffic of the pod(ALL inbound and outbound traffic) OBSERVABILITY.

All the side-car containers sends the information to the IstioD(primary component of Istio, keep track of this obervability.

Communication between Istio and API server in k8s cluster -> Admission Controller 
Whenever a user apply a deployment manifest to the k8s cluster, API server checks the auth and authorization, if it is valid request store the data in etcd.
Admisssion controller, after the auth is verified,  mutate or validates the objects.
If some necessary fields(not mandatory) are not present in the manifest, admission controller mutates  and creates it.
In case of resource qouta, if we restrict the Computations, this admission controller validates and throws the error.

Download the istio resource folder from the follosing link
```
https://github.com/istio/istio/releases/tag/1.22.0
```
For this installation, we use the demo configuration profile. It’s selected to have a good set of defaults for testing, but there are other profiles for production or performance testing.
```
istioctl install --set profile=demo -y
```

Add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy your application in default namespace:
```
 kubectl label namespace default istio-injection=enabled
```


[Link for the example , provided by Istio](https://istio.io/latest/docs/examples/bookinfo/)

Go to inside the Istio resource folder, where samples folder is present and deploy the application
```
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
```
If, you can't see the pods, the  automatic sidecar injection during installation is disabled and rely on manual sidecar injection, use the istioctl kube-inject command to modify the bookinfo.yaml file before deploying your application.
```
kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml)
```
if the folder does not have full access, the above command will be executed fully and sidecar injection is not done.

In Windows system, 
Run istioctl kube-inject and Save the Output Using Redirection:
```
istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml > bookinfo-injected.yaml
```
A new file is generated in the current folder. Deploy the current generated file to the k8s cluster, you can see sidecar container in each pod.

If you are using gke, auto pilot, we need to enable the service mesh capabalities to the k8s cluster by the following command .
```
gcloud container clusters update <ClusterName> --region <RegionName> --workload-policies=allow-net-admin
```

Now we can deploy the app.

By default istio, allow even though pods don't have mtls associated with it, we can access the services. 
If we defined a peer authentication of the service to strict, we can't access other pod without mtls.


Istio
Admission Controllers
Admission controllers in Kubernetes enforce policies on objects during their creation or modification. They intercept requests to the Kubernetes API server before objects are persisted and can modify or deny requests based on predefined rules.

Sidecar Containers
In Kubernetes, sidecar containers are auxiliary containers that run alongside the main application container within the same pod. They enhance or extend the functionality of the main container, such as handling networking, logging, or monitoring tasks.

What is a Service Mesh?
A service mesh is a dedicated infrastructure layer for handling service-to-service communication within a distributed application. It provides features like traffic management, observability, security, and resilience without requiring changes to the application code.

Why do you need a Service Mesh?
Service meshes address challenges in managing microservices architectures by offering centralized control over communication, improving reliability through features like circuit breaking and retries, enhancing security with mutual TLS, and providing visibility into service interactions.

Traffic Management
Traffic management in a service mesh involves controlling the flow of requests between services. This includes features such as load balancing, routing, traffic shaping, and fault tolerance mechanisms like retries and circuit breaking.

Virtual Services
Virtual services in Istio define how incoming requests to a service should be routed to different versions or subsets of that service. They enable sophisticated traffic management strategies like A/B testing and canary deployments.

Destination Rules
Destination rules in Istio configure the traffic policies applied to the traffic destined for a particular service version or subset. They define things like load balancing algorithms, circuit breaking settings, and TLS settings for communication between services.

Circuit Breaking
Circuit breaking is a pattern used to prevent cascading failures in distributed systems. In Istio, it involves setting thresholds for error rates or latency, and if these thresholds are exceeded, requests to a service are automatically stopped, preventing further damage.

mTLS (Mutual TLS)
Mutual TLS in Istio ensures secure communication between services by requiring both the client and the server to present a valid TLS certificate. It encrypts traffic and provides authentication, preventing unauthorized access or eavesdropping.

Gateways
Gateways in Istio allow external traffic to enter the service mesh. They act as ingress and egress points for traffic, enabling communication between services inside the mesh and external clients or services outside the mesh.

Observability
Observability in a service mesh refers to the ability to monitor, trace, and analyze the behavior and performance of services. It includes features like distributed tracing, metrics collection, and logging to provide insights into the health and operation of the system.

Service Mesh vs Ingress
A service mesh operates at the layer of service-to-service communication within a cluster, providing features like traffic management, security, and observability. In contrast, an ingress controller manages external access to services within the cluster, typically handling tasks like load balancing, SSL termination, and routing based on HTTP/HTTPS requests.
