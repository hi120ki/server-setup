all: help

help: ## Print this help message
	@grep -E '^[a-zA-Z._-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install:  ## Apply ansible playbook
	ansible-playbook -i local, local.yml --ask-become-pass

.PHONY: ansible
ansible:  ## Install ansible
	sudo apt-add-repository -y -u ppa:ansible/ansible ; sudo apt install -y ansible
