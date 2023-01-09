# cert-manager
k3s-cert-manager-view: ## View cert-manager
	@apps/k3s/cert-manager/view.sh
k3s-cert-manager-generate: # Generate cert-manager
	@apps/k3s/cert-manager/generate.sh
k3s-cert-manager-restart: k3s-cert-manager-stop k3s-cert-manager-start # Restart cert-manager
k3s-cert-manager-start: # Start cert-manager
	@apps/k3s/cert-manager/start.sh
k3s-cert-manager-stop: # Stop cert-manager
	@apps/k3s/cert-manager/stop.sh || true
