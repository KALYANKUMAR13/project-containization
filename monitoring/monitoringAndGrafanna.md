Why monitoring?
Managing a Single cluster is easy. 
If multiple teams access the particular cluster, problem may arise 
We may have different EENVIRONMENTS such as dev, Prod and Staging

Alert manager gives alert via mail, slack etc

k8s has metrics endpoint
3662 Default Promethus port, from Grafanna
Promethus - Stores in TIME SERIES DB
When we query, it will give (json) metrics

kubectl expose service prometus-server --type=NodePort --target-port=9090 --name=promethus-server-ext

kube state metrics -- It can be called and it will give beyond the k8s API Server 
kubectl expose service prometheus-kube-state-metrics --type=NodePort --target-port=8080 --name=kube-state-metrics-ext




Grafanna - Data visualization 
Gets the data(data source) from Promethus and makes a visualization  

kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafanna-ext


