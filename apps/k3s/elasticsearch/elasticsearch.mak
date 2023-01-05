# elasticsearch
k3s-elasticsearch-view: ## View elasticsearch
	@apps/k3s/elasticsearch/view.sh
k3s-elasticsearch-generate: # Generate elasticsearch
	@apps/k3s/elasticsearch/generate.sh
k3s-elasticsearch-restart: k3s-elasticsearch-stop k3s-elasticsearch-start # Restart elasticsearch
k3s-elasticsearch-start: # Start elasticsearch
	@apps/k3s/elasticsearch/start.sh
k3s-elasticsearch-stop: # Stop elasticsearch
	@apps/k3s/elasticsearch/stop.sh || true
