#!/bin/bash

crds_installed=1

kubectl api-resources | grep -w ServiceMonitor 2>&1 > /dev/null
if [[ $? == 1 ]]; then
  crds_installed=0
fi

kubectl api-resources | grep -w Prometheus 2>&1 > /dev/null
if [[ $? == 1 ]]; then
  crds_installed=0
fi

kubectl api-resources | grep -w PrometheusRule 2>&1 > /dev/null
if [[ $? == 1 ]]; then
  crds_installed=0
fi

if [[ $crds_installed == 0 ]]; then
  echo "Prometheus CRDs not found. Installing operator CRDs"
  make prometheus-operator
fi

kubectl apply -f prometheus/
