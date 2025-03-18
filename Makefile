DEFAULT_GOAL := help

test: ## Run chart-tester lint
	@docker run -it --rm --workdir=/data --volume $(shell pwd)/ct.yaml:/ct.yaml --volume ~/.kube/config:/root/.kube/config:ro --volume $(shell pwd):/data quay.io/helmpack/chart-testing:v3.10.1 ct lint --all --config /ct.yaml

docs: ## Run helm-docs
	@docker run --rm -v $(shell pwd):/helm-docs jnorwood/helm-docs:v1.14.2 --chart-search-root=. --template-files=./.github/helm-docs/_templates.gotmpl --template-files=README.md.gotmpl

install-pre-commit: ## Install pre-commit hooks
	@pre-commit install
	@pre-commit install-hooks

pre-commit: ## Run pre-commit hooks
	@pre-commit run --all-files

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
