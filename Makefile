prometheus-operator: 
	hack/install-prometheus-crds.sh

prometheus: 
	hack/install-prometheus.sh

kube-state-metrics: 
	kubectl apply -f kube-state-metrics/

loki: 
	hack/install-loki.sh

grafana: 
	hack/install-grafana.sh

kubevirt-o11y-stack:
	$(MAKE) prometheus
	$(MAKE) kube-state-metrics
	$(MAKE) loki
	$(MAKE) grafana

kubevirt: 
	hack/install-kubevirt.sh


.PHONY: \
	prometheus \
	grafana \
	kube-state-metrics \
	prometheus-operator
