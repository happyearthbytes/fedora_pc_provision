# prometheus
k3s-prometheus-view: ## View prometheus
	@apps/k3s/prometheus/view.sh
k3s-prometheus-generate: # Generate prometheus
	@apps/k3s/prometheus/generate.sh
k3s-prometheus-restart: k3s-prometheus-stop k3s-prometheus-start # Restart prometheus
k3s-prometheus-start: # Start prometheus
	@apps/k3s/prometheus/start.sh
k3s-prometheus-stop: # Stop prometheus
	@apps/k3s/prometheus/stop.sh || true
