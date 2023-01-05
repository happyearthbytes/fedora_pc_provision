# grafana
k3s-grafana-view: ## View grafana
	@apps/k3s/grafana/view.sh
k3s-grafana-generate: # Generate grafana
	@apps/k3s/grafana/generate.sh
k3s-grafana-restart: k3s-grafana-stop k3s-grafana-start # Restart grafana
k3s-grafana-start: # Start grafana
	@apps/k3s/grafana/start.sh
k3s-grafana-stop: # Stop grafana
	@apps/k3s/grafana/stop.sh || true
