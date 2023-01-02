PROJECT_NAME := "my-proj" ## The name of the project - TODO parse from file
VERSION := "0.x.0" ## A string name of the version - TODO parse from file
USERNAME := $(shell id -un) ## The username to use - TODO set in include
ARGS := ## Generic interface for inputing arguments - TODO set in include
include scripts/make/common.mak
include scripts/make/basic.mak
include scripts/make/extras.mak

.PHONY: help

test: # test Provision
	@./provision/ansible/scripts/test.sh
provision-build: # Provision build image
	@./provision/ansible/scripts/build.sh
provision-init: # Provision init
	@./provision/ansible/scripts/init.sh
provision-view-config: provision-generate # view ansible config
	@./provision/ansible/scripts/view_config.sh
provision-generate: # Provision generate
	@./provision/ansible/scripts/generate.sh
provision: ## Provision
	@./provision/ansible/scripts/provision.sh

run_an_advanced_command: # Run an advanced command
	@echo todo
