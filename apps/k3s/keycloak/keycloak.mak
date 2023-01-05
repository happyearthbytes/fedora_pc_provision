# keycloak
k3s-keycloak-view: ## View keycloak
	@apps/k3s/keycloak/view.sh
k3s-keycloak-generate: # Generate keycloak
	@apps/k3s/keycloak/generate.sh
k3s-keycloak-restart: k3s-keycloak-stop k3s-keycloak-start # Restart keycloak
k3s-keycloak-start: # Start keycloak
	@apps/k3s/keycloak/start.sh
k3s-keycloak-stop: # Stop keycloak
	@apps/k3s/keycloak/stop.sh || true
