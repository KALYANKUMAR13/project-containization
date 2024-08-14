helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update


 helm install promethus prometheus-community/prometheus -n monitoring


2py0YapridIw2SLrTSbAYaUlalggI709ppSHtz4c
ax7R9BnAEqY2WH1BKb4nUM5Aa2RRWvl1rHQMjRAK

 kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | % {[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($_))}
