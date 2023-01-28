.PHONY: provision

THIS_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
REL_DIR:=$(shell dirname $(realpath $(THIS_DIR)/.))

provision: provision-configure_ansible_user ## Provision
	@./provision/ansible/scripts/provision.sh
provision-build_ansible_image: # Provision build_ansible_image
	@./provision/ansible/scripts/build_ansible_image.sh
provision-create_default_config_template: ${REL_DIR}/ansible.cfg.in # Provision create_default_config_template
${REL_DIR}/ansible.cfg.in:
	@./provision/ansible/scripts/create_default_config_template.sh
provision-generate_config_file: provision-create_default_config_template # Provision generate_config_file
	@./provision/ansible/scripts/generate_config_file.sh
provision-configure_ansible_user: /home/ansible # configure_ansible_user
/home/ansible:
	@./provision/ansible/scripts/configure_ansible_user.sh


provision-view-config: provision-generate # view ansible config
	@./provision/ansible/scripts/view_config.sh
provision-test: # Test Provision
	@./provision/ansible/scripts/test.sh
