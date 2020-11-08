export KUBEVIRT_VERSION=$(curl -s https://api.github.com/repos/kubevirt/kubevirt/releases | grep tag_name | grep -v -- - | sort -V | tail -1 | awk -F':' '{print $2}' | sed 's/,//' | xargs)
echo "Lastest KubeVirt version: ${KUBEVIRT_VERSION}"
kubectl create -f https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-operator.yaml
sleep 5 ## There is a small delay between the POST to k8s API until the pods creation
kubectl rollout status -n kubevirt deployment virt-operator
kubectl create -f https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERSION}/kubevirt-cr.yaml
sleep 10
kubectl rollout status -n kubevirt deployment virt-api
kubectl rollout status -n kubevirt deployment virt-controller
kubectl rollout status -n kubevirt daemonset virt-handler
echo "Kubevirt components are ready!"

