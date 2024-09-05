Support for an issue, 

Management of workloads 

These 2 are managed by the companies, 

If we get particular error in the open-source, we need to wait to fix by the open-source community.

Enterprise K8s: Redhat(OpenShift), EKS, AKS, GKE, Rancher.

Openshift has 2 modes, 

1.Self-managed - This is similar to open-source k8s

---------------

RedHat 

Single Node OpenShift (SNO) cluster, if we have 70 concurrent users but 64 RAm and CPU

<img width="680" alt="image" src="https://github.com/user-attachments/assets/cacee92a-8ef8-4f13-89a6-8d954aeec83a">


Operation LifeCycle Manager.

Operators: 

ArgoCD, Prometheus, Grafana, Istio.

These 4 controllers can be installed through 
1. Plain yaml manifest
2. Helm Charts
3. Operators

Operators are robust way to install the controllers

Operators continuously monitor the entire manifest of the controller. and any user can NOT modify the resource like changing the manifest.

In OpenShift, everything installs through the operator, like Nodes in the cluster- kube-api so that the infra of the node is immutable.

If we want to change the manifest, we need to change the CRManifest of the operator.

Operator LifeCycle Management(OLM)- a new version of the operator will updated with a single click.

In a normal K8s cluster, we can install OLM

Routes in OpenShift

<img width="900" alt="image" src="https://github.com/user-attachments/assets/383c8678-6654-4aed-87b1-b72de60cfa55">



