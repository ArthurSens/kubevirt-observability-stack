#!/bin/bash

kubectl get configmap kubevirt-provisioning 2>&1 > /dev/null
if [[ $? == 0 ]]; then
  kubectl delete configmap kubevirt-provisioning
fi

kubectl create configmap kubevirt-provisioning --from-file grafana/dashboards/kubevirt-components.json --from-file grafana/dashboards/kubevirt-vmis.json
kubectl apply -f grafana/
