ifeq (,$(wildcard .env))
  $(error "The file .env doesn't exists")
else
  include .env
  export
endif

run-unittests:
	@echo "Running unit tests..."
	forge test -vvv

run-forked-tests:
	@echo "Running tests..."
	forge test -vvv --fork-url $$SEPOLIA_RPC_URL

run-script:
	@echo "Running script..."
	forge script script/DeployFundMe.s.sol

run-coverage:
	@echo "Running coverage..."
	forge coverage

PHONY: run-tests