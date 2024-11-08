ifeq (,$(wildcard .env))
  $(error "The file .env doesn't exists")
else
  include .env
  export
endif

# Variables
SEPOLIA_WALLET_PK_NAME=sepoliaKey
SEPOLIA_SENDER_ADDRESS=0x589605619b607c9ebf8520ce75d3007f4dafd3d9

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

deploy-sepolia:
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --account $(SEPOLIA_WALLET_PK_NAME) --sender $(SEPOLIA_SENDER_ADDRESS) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv


PHONY: run-tests