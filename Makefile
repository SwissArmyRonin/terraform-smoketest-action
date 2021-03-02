.PHONY: smoke

smoke:
	@terraform init -no-color
	@terraform validate -no-color
	@if [ -f ".pre-commit-config.yaml" ]; then pre-commit run -a; fi
