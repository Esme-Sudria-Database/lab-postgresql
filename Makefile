.PHONY: help
help: ## provides cli help for this make file (default)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: ansible_documentation
ansible_documentation: ## show the task list ansible will execute
	ansible-playbook --list-tasks -i "localhost," site.yml

.PHONY: tests
tests: ## check ansible playbooks syntax
	ansible-playbook --syntax-check -i "localhost," playbooks/lab-postgres.yml
	ansible-lint -x ANSIBLE0016,ANSIBLE0006 playbooks/lab-postgres.yml
	cd playbooks/roles/docker; molecule test
	cd playbooks/roles/esme_database.postgres; molecule test
