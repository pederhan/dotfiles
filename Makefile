.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: ## install pre-dependencies needed to install everything
	PIP_REQUIRE_VIRTUALENV=false pip install -U pipx
	pipx install ansible


.PHONY: install
install: ## install everything
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --skip-tags sublime

# Tags

# .PHONY: dotfiles # NYI
# dotfiles: ## install dotfiles into home
# 	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags dotfiles

.PHONY: homebrew
homebrew: ## install homebrew packages
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags homebrew

.PHONY: homebrew-casks
homebrew-casks: ## install homebrew casks packages
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags homebrew-casks

# .PHONY: mas
# mas: ## install Mapp App Store packages
# 	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags mas

.PHONY: osx
osx: ## install osx configs
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags osx

.PHONY: python
python: ## install python essentials
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags python

.PHONY: python_deps
python_deps: ## install python system dependencies
	ANSIBLE_NOCOWS=1 ansible-playbook -i ./playbooks/hosts ./playbooks/main.yml -c local --tags python_deps
