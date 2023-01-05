# fluentd
k3s-fluentd-view: ## View fluentd
	@apps/k3s/fluentd/view.sh
k3s-fluentd-generate: # Generate fluentd
	@apps/k3s/fluentd/generate.sh
k3s-fluentd-restart: k3s-fluentd-stop k3s-fluentd-start # Restart fluentd
k3s-fluentd-start: # Start fluentd
	@apps/k3s/fluentd/start.sh
k3s-fluentd-stop: # Stop fluentd
	@apps/k3s/fluentd/stop.sh || true
