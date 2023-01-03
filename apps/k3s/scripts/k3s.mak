k3s-traefik: ## start traefik
	@apps/k3s/traefik/start.sh
k3s-watch: ## watch k3s
	@apps/k3s/scripts/watch.sh
k3s-new: # Create a new k3s module from helm
	@apps/k3s/scripts/get_helm.sh
