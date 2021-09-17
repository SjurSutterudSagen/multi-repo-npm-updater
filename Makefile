SHELL=/bin/bash +x

.PHONY: default
default: | help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: update-git-repos
update-git-repos: ## Checkout/pull code modules from git
	@./git-update.sh

.PHONY: check-dependencies
check-dependencies: ## Check the repositories for outdated dependencies
	@./dependency-check.sh

.PHONY: update-dependencies
update-dependencies: ## Update the outdated dependencies of the repositories
	@./dependency-update.sh
