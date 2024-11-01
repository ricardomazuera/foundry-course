# Loading environment variables 
ifeq (,$(wildcard .env))
  $(error "The file .env doesn't exists")
else
  include .env
  export
endif

# variables
RPC_URL=http://localhost:8545
CAST_WALLET_PK_NAME=localPK
SENDER_ADDRESS=0x90f79bf6eb2c4f870365e785982e1f101e93b906
CONTRACT_ADDRESS=0x057ef64E23666F000b34aE31332854aCBd1c8544
SEPOLIA_WALLET_PK_NAME=sepoliaKey
SEPOLIA_SENDER_ADDRESS=0x589605619b607c9ebf8520ce75d3007f4dafd3d9


# Run anvil to run blockchain locally
anvil:
	anvil

# To simulate our contract in the blockchain locally
simulate:
	forge script script/DeploySimpleStorage.s.sol --rpc-url $(RPC_URL)

# To deploy our contract to the blockchain locally
local-deploy:
	forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url $(RPC_URL) --account $(CAST_WALLET_PK_NAME) --sender $(SENDER_ADDRESS) --broadcast -vvvv

# To deploy our contract to the blockchain using Sepolia on Alchemy
sepolia-deploy:
	forge script script/DeploySimpleStorage.s.sol:DeploySimpleStorage --rpc-url $(SEPOLIA_RPC_URL) --account $(SEPOLIA_WALLET_PK_NAME) --sender $(SEPOLIA_SENDER_ADDRESS) --broadcast

# To send a value in a transaction to the contract
send:
	cast send $(CONTRACT_ADDRESS) "store(uint256)" 42 --rpc-url $(RPC_URL) --account $(CAST_WALLET_PK_NAME)

# To get the value stored in the contract
get:
	@echo "Calling retrieve() function in the contract to get the value stored in hexadecimal and decimal"
	@HEX_VALUE=$$(cast call $(CONTRACT_ADDRESS) "retrieve()" --rpc-url $(RPC_URL) --account $(CAST_WALLET_PK_NAME)); \
	echo "Hexadecimal value: $$HEX_VALUE"; \
	DEC_VALUE=$$(cast --to-base $$HEX_VALUE dec); \
	echo "Decimal value: $$DEC_VALUE"

