Whenever a new node is created, a pod mentioned in the manifest will be created for all new node.
Usecase:
Monitoring 
logging
security agent

Node Coverage: DaemonSets ensure that all or a subset of nodes run a copy of a specific Pod. If new nodes are added to the cluster, Pods are automatically added to them.

Lifecycle Management: When nodes are removed or Pods are deleted, the DaemonSet ensures that Pods are recreated on remaining nodes.

```
kubectl apply -f daemonset.yaml
```

When you are using gke auto pilot, for daemon manifest resources will not be created, If we deploy some other manifest, nodes will create and daemonset will create automatically
