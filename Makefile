PROJECT_NAME := "PC Provisioning" ## The name of the project - TODO parse from file
VERSION := "0.1.0" ## A string name of the version - TODO parse from file
USERNAME := $(shell id -un) ## The username to use - TODO set in include
ARGS := ## Generic interface for inputing arguments - TODO set in include
include scripts/make/common.mak
include scripts/make/basic.mak
include scripts/make/extras.mak
include provision/ansible/scripts/provision.mak
include apps/k3s/scripts/k3s.mak
include apps/stable-diffusion/scripts/stable-diffusion.mak

.PHONY: help

run_a_top_level_command: ## Run a top level command
	@echo todo
run_an_advanced_command: # Run an advanced command
	@echo todo

install_pc: ## Install PC provisioning
	@./apps/setup_scripts/install.sh
diagnose_pc: ## Install PC provisioning
	@./apps/diagnose_pc/run.sh