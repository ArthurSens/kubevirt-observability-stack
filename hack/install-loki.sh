helm repo add loki https://grafana.github.io/loki/charts
helm repo update 
helm upgrade --install loki loki/loki-stack
