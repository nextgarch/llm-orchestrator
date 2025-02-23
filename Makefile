export PROJECT_ROOT ?= $(PWD)
export ANSIBLE_CONFIG ?= $(PROJECT_ROOT)/ansible.cfg
export ANSIBLE_INVENTORY ?= $(PROJECT_ROOT)/inventory.ini

export PROVIDER_PLAYBOOK ?= $(PROJECT_ROOT)/provider.yml
export SERVER_PLAYBOOK ?= $(PROJECT_ROOT)/server.yml
export NETWORKING_PLAYBOOK ?= $(PROJECT_ROOT)/networking.yml

ansible:
	sh ./scripts/ansible

ping:
	ansible all -m ping

install-ollama-provider:
	ansible-playbook $(PROVIDER_PLAYBOOK) -t install-ollama

uninstall-ollama-provider:
	ansible-playbook $(PROVIDER_PLAYBOOK) -t uninstall-ollama

start-anythingllm-server:
	ansible-playbook $(SERVER_PLAYBOOK) -t start-anythingllm

stop-anythingllm-server:
	ansible-playbook $(SERVER_PLAYBOOK) -t stop-anythingllm

setup-port-forwarding:
	ansible-playbook $(NETWORKING_PLAYBOOK) -t setup-port-forwarding -vvv

teardown-port-forwarding:
	ansible-playbook $(NETWORKING_PLAYBOOK) -t teardown-port-forwarding