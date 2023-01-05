# artifactory
k3s-artifactory-view: ## View artifactory
	@apps/k3s/artifactory/view.sh
k3s-artifactory-generate: # Generate artifactory
	@apps/k3s/artifactory/generate.sh
k3s-artifactory-restart: k3s-artifactory-stop k3s-artifactory-start # Restart artifactory
k3s-artifactory-start: # Start artifactory
	@apps/k3s/artifactory/start.sh
k3s-artifactory-stop: # Stop artifactory
	@apps/k3s/artifactory/stop.sh || true
