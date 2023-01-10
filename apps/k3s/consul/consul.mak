# consul
k3s-consul-view: ## View consul
	@apps/k3s/consul/view.sh
k3s-consul-generate: # Generate consul
	@apps/k3s/consul/generate.sh
k3s-consul-restart: k3s-consul-stop k3s-consul-start # Restart consul
k3s-consul-start: # Start consul
	@apps/k3s/consul/start.sh
k3s-consul-stop: # Stop consul
	@apps/k3s/consul/stop.sh || true
