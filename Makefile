export PROJECT_ROOT ?= $(PWD)
export ANSIBLE_CONFIG ?= $(PROJECT_ROOT)/ansible.cfg
export ANSIBLE_INVENTORY ?= $(PROJECT_ROOT)/inventory.ini

export PROVIDER_PLAYBOOK ?= $(PROJECT_ROOT)/provider.yml
export SERVER_PLAYBOOK ?= $(PROJECT_ROOT)/server.yml

ansible:
	sh ./scripts/ansible

ping:
	ansible all -m ping

install-ollama-provider:
	ansible-playbook $(PROVIDER_PLAYBOOK) -t install-ollama

uninstall-ollama-provider:
	ansible-playbook $(PROVIDER_PLAYBOOK) -t uninstall-ollama
