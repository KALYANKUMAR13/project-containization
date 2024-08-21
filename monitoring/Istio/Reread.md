The traffic comes from outside the cluster is know as **North-South traffic**.

Internal service to service traffic is know as **East-West traffic**

Istio helps to east-west traffic management, Like one service talk to another.

**Benefits**:
1. Istio provides MTLS,MutualTLS A certificate is provided to each service in k8s cluster by istio for secure communication.
2. Provides more deployment strategies like canary(traffic % increasing), blue-green, A-B
3. Kiali - Observability tool between services.
4. Traffic management, Circuit breaking  and traffic splitting and N more

   <img width="847" alt="image" src="https://github.com/user-attachments/assets/77e47be6-8d9b-4605-955e-6820ef660818">


**How**
In a each pod, of all namespaces, which ever Istio has access to it,Istio add a new container to the existing pod i.e SIdeCar Container.
This sidecar container has **envoy proxy** application(Proxy server). It handles the traffic managemnet of k8s pods

Any ingress or egress traffic comes to a pod is handled by this side-car container which has envoy proxy.

Normal FLow, 
Login pod gets the service url of product service by configmap or args, 

Istio Flow:
API call from the login pod is intercepted by the side-car container and calls the products pod and over there, side-car container get the request and then goes to the application contiainer


<img width="808" alt="image" src="https://github.com/user-attachments/assets/f562f789-567c-4efc-8cdb-639ca81ae3fd">


How Istio get all pods -> **Admission controller** 

There are 30+ admission controller in the k8s cluster by default, preinstalled through API server of k8s 

these controllers, before storing pod in the etcd, admission controller intercepted and modified the pod resource.

  
