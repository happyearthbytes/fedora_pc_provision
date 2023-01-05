# traefik
k3s-traefik-view: ## View
	@apps/k3s/traefik/view.sh
k3s-traefik-restart: k3s-traefik-stop k3s-traefik-start # Restart
k3s-traefik-start: # Start
	@apps/k3s/traefik/start.sh
k3s-traefik-stop: # Stop
	@apps/k3s/traefik/stop.sh || true

# kubernetes-dashboard
k3s-kubernetes-dashboard-view: ## View
	@apps/k3s/kubernetes-dashboard/view.sh
k3s-kubernetes-dashboard-restart: k3s-kubernetes-dashboard-stop k3s-kubernetes-dashboard-start # Restart
k3s-kubernetes-dashboard-start: # Start
	@apps/k3s/kubernetes-dashboard/start.sh
k3s-kubernetes-dashboard-stop: # Stop
	@apps/k3s/kubernetes-dashboard/stop.sh || true

# Registry
k3s-registry-view: ## View
	@apps/k3s/registry/view.sh
k3s-registry-restart: k3s-registry-stop k3s-registry-start # Restart
k3s-registry-start: # Start
	@apps/k3s/registry/start.sh
k3s-registry-stop: # Stop
	@apps/k3s/registry/stop.sh || true

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
