git clone https://github.com/prometheus-operator/prometheus-operator
cd prometheus-operator && kubectl apply -f bundle.yaml
cd ../ && rm -rf prometheus-operator
