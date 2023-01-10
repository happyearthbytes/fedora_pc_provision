include apps/k3s/consul/consul.mak
include apps/k3s/cert-manager/cert-manager.mak
include apps/k3s/traefik/traefik.mak
include apps/k3s/artifactory/artifactory.mak
include apps/k3s/elasticsearch/elasticsearch.mak
include apps/k3s/fluentd/fluentd.mak
include apps/k3s/grafana/grafana.mak
include apps/k3s/harbor/harbor.mak
include apps/k3s/jaeger/jaeger.mak
include apps/k3s/kubernetes-dashboard/kubernetes-dashboard.mak
include apps/k3s/prometheus/prometheus.mak
include apps/k3s/keycloak/keycloak.mak

# General
k3s-watch: ## watch k3s
	@apps/k3s/scripts/watch.sh
k3s-new: # Create a new k3s module from helm
	@apps/k3s/scripts/get_helm.sh
k3s-start: ## Start
	@apps/k3s/scripts/k3s-start.sh
k3s-stop: ## Stop
	@apps/k3s/scripts/k3s-stop.sh
k3s-restart: k3s-stop k3s-start ## Restart
k3s-generate-all: # generate all
	@apps/k3s/scripts/k3s-generate-all.sh
k3s-clean-all: # clean all
	@apps/k3s/scripts/k3s-clean-all.sh
