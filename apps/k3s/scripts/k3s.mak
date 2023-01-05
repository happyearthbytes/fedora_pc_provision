# traefik
k3s-traefik-view: ## View traefik
	@apps/k3s/traefik/view.sh
k3s-traefik-restart: k3s-traefik-stop k3s-traefik-start # Restart traefik
k3s-traefik-start: # Start traefik
	@apps/k3s/traefik/start.sh
k3s-traefik-stop: # Stop traefik
	@apps/k3s/traefik/stop.sh || true

# kubernetes-dashboard
k3s-kubernetes-dashboard-start: # Start kubernetes-dashboard
	@apps/k3s/traefik/start.sh
k3s-kubernetes-dashboard-stop: # Stop kubernetes-dashboard
	@apps/k3s/traefik/stop.sh || true

# Registry
k3s-registry-start: # Start registry
	@apps/k3s/traefik/start.sh
k3s-registry-stop: # Stop registry
	@apps/k3s/traefik/stop.sh || true

# General
k3s-watch: ## watch k3s
	@apps/k3s/scripts/watch.sh
k3s-new: # Create a new k3s module from helm
	@apps/k3s/scripts/get_helm.sh
