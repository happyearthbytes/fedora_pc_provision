# traefik
k3s-traefik-view: ## View traefik
	@apps/k3s/traefik/view.sh
k3s-traefik-generate: # Generate traefik
	@apps/k3s/traefik/generate.sh
k3s-traefik-restart: k3s-traefik-stop k3s-traefik-start # Restart traefik
k3s-traefik-start: # Start traefik
	@apps/k3s/traefik/start.sh
k3s-traefik-stop: # Stop traefik
	@apps/k3s/traefik/stop.sh || true
