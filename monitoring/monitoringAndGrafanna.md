Add helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

Install helm for Prometheus
```
helm install prometheus prometheus-community/prometheus
```

Why monitoring?


Managing a Single cluster is easy. 
If multiple teams access the particular cluster, problems may arise 
We may have different ENVIRONMENTS such as dev, Prod and Staging

Alert manager gives alerts via mail, slack, etc

k8s has a metrics endpoint
3662 Default Prometheus port, from Grafanna
Prometheus - Stores in TIME SERIES DB
When we query, it will give (JSON) metrics

kubectl expose service prometus-server --type=NodePort --target-port=9090 --name=promethus-server-ext

kube state metrics -- It can be called and it will give beyond the k8s API Server 
kubectl expose service prometheus-kube-state-metrics --type=NodePort --target-port=8080 --name=kube-state-metrics-ext




Grafanna - Data visualization 
Gets the data(data source) from Prometheus and makes a visualization  

Add helm repo
helm repo add grafana https://grafana.github.io/helm-charts

Install helm 
helm install grafana grafana/grafana

kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafanna-ext


