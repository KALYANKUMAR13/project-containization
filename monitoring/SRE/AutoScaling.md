**Horizontal Pod AutoScaler(HPA):**
Horizontal Pod Autoscaler (HPA) in Kubernetes is a feature that automatically scales the number of pods in a deployment, replica set, or stateful set based on observed metrics like CPU utilization, memory usage, or custom metrics. The goal of HPA is to ensure that your application can handle varying loads efficiently by scaling out when demand increases and scaling in when it decreases.
<img width="938" alt="image" src="https://github.com/user-attachments/assets/8e141a77-df49-4c99-afbc-f3ed5d3643ec">

HPA calculation by cluster
<img width="951" alt="image" src="https://github.com/user-attachments/assets/bcce3612-2277-48cf-bb48-b6e38969675c">


**Vertical Pod AutoScaler (VPA)**
Vertical Pod Autoscaler (VPA) in Kubernetes is a mechanism that automatically adjusts the resource requests and limits (CPU and memory) for containers in your pods. Unlike Horizontal Pod Autoscaler (HPA), which scales the number of pods, VPA focuses on scaling the resources allocated to individual pods, ensuring they have the right amount of resources to handle their workloads efficiently.

**Cluster AutoScaler**
This feature will be availiable in Cloud clusters, if the node does not have any resources, cloud will autoscale it.
