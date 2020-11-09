#!/bin/bash

kubectl get configmap kubevirt-provisioning 2>&1 > /dev/null
if [[ $? == 0 ]]; then
  kubectl delete configmap kubevirt-provisioning
fi

kubectl create configmap kubevirt-provisioning \
	--from-file grafana/provisioning/dashboards/kubevirt-components.json \
	--from-file grafana/provisioning/dashboards/kubevirt-vmis.json \
	--from-file grafana/provisioning/dashboards-provisioning.yml \
	--from-file grafana/provisioning/datasources-provisioning.yml
kubectl apply -f grafana/
