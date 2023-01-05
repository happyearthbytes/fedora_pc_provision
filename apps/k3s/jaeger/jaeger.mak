# jaeger
k3s-jaeger-view: ## View jaeger
	@apps/k3s/jaeger/view.sh
k3s-jaeger-generate: # Generate jaeger
	@apps/k3s/jaeger/generate.sh
k3s-jaeger-restart: k3s-jaeger-stop k3s-jaeger-start # Restart jaeger
k3s-jaeger-start: # Start jaeger
	@apps/k3s/jaeger/start.sh
k3s-jaeger-stop: # Stop jaeger
	@apps/k3s/jaeger/stop.sh || true
