KIND - k8s inside docker
Runs inside a docker container 

The kubectl logs command is used to fetch the logs from a running container in a pod.
The kubectl describe command provides detailed information about a specific Kubernetes resource. This includes configuration details, events, and status information.

to point to a particular config of a k8s cluster because , we may have development cluster, prod cluster so we need to point to particular cluster
```
kubectl config use-context <CLusterName>
```

Node Selector, 
If we mention node selector, cluster will deploy a pods in that particular node only.
Why this --> if we have an application that works more efficiently on windows system, so we will create a node with windows os, If we deploy there, we can able to deliver the app seamlessly.

How to name a node
So 
```
kubectl edit node <NodeName>
```
After going inside, add a LABEL under metadata and save 

Node Affinity
1. Preferred -> if label is not there, go with another nodes, eventhough node name is differenrt.
2. Required -> works same as node selector


Taint
We have a nodes in cluster, If we don't want to deploy a particular node, that is taint.
Purpose, We have mulltiple node for prod, 
A new k8s version has been released, if want to update the node, we will be doing each node, so that production is not distrubed

1. noscehedule - while updates (control plane have this)
2. no execute - all deploypemnts will stop (if something is runnning)
3. prefered noschedule - the performance of the node is not good, 

Tolerations 
An exception, given to certain pods 
when we set tolearations, we can scedule the pods during taint
  
