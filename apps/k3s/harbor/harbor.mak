# harbor
k3s-harbor-view: ## View harbor
	@apps/k3s/harbor/view.sh
k3s-harbor-generate: # Generate harbor
	@apps/k3s/harbor/generate.sh
k3s-harbor-restart: k3s-harbor-stop k3s-harbor-start # Restart harbor
k3s-harbor-start: # Start harbor
	@apps/k3s/harbor/start.sh
k3s-harbor-stop: # Stop harbor
	@apps/k3s/harbor/stop.sh || true
