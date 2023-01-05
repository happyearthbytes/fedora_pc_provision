# kubernetes-dashboard
k3s-kubernetes-dashboard-view: ## View kubernetes-dashboard
	@apps/k3s/kubernetes-dashboard/view.sh
k3s-kubernetes-dashboard-generate: # Generate kubernetes-dashboard
	@apps/k3s/kubernetes-dashboard/generate.sh
k3s-kubernetes-dashboard-restart: k3s-kubernetes-dashboard-stop k3s-kubernetes-dashboard-start # Restart kubernetes-dashboard
k3s-kubernetes-dashboard-start: # Start kubernetes-dashboard
	@apps/k3s/kubernetes-dashboard/start.sh
k3s-kubernetes-dashboard-stop: # Stop kubernetes-dashboard
	@apps/k3s/kubernetes-dashboard/stop.sh || true
