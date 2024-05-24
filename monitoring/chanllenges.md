In a microservice application, 

Each microservice is deployed in a namespace,  
if a pod has an issue, with out of memory error, then the other services can't utilize the cluster resource.
So, for each namespace, we need to allocate the memory --Resource Quota (ram and cpu)

The developer should do performance benchmarking, and then come up with a utilization of ram and cpu for the application(for each microservice)
blast radius
Resource request/ resource limit- minimum computation needed for the pod to run 


OOM killed 
We can get thread dump and heap dump and share with dev team


Upgrades
We need to update the k8s entire cluster. 

manual
Backup
release notes
control plane components  and data plane
