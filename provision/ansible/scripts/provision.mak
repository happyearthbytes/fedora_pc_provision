.PHONY: provision

provision: ## Provision
	@./provision/ansible/scripts/provision.sh
provision-test: # Test Provision
	@./provision/ansible/scripts/test.sh
provision-build: # Provision build image
	@./provision/ansible/scripts/build.sh
provision-init: # Provision init
	@./provision/ansible/scripts/init.sh
provision-view-config: provision-generate # view ansible config
	@./provision/ansible/scripts/view_config.sh
provision-generate: # Provision generate
	@./provision/ansible/scripts/generate.sh
