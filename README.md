# Foundry Fundamentals Course

This is knowledge learned in the [Foundry Fundamentals](https://updraft.cyfrin.io/courses/foundry/) course by Cyfrin Updraft.

Foundry Documentation: [https://book.getfoundry.sh/](https://book.getfoundry.sh/)

## Store our private key in the local encrypted wallet

For this we use the [ERC-2335](https://eips.ethereum.org/EIPS/eip-2335) protocol. This is the [documentation](https://github.com/foundry-rs/book/blob/master/src/reference/cast/cast-wallet-import.md) on how you can do it.

## Deploy to your local blockchain

To deploy the contract to your local blockchain, you first need run the `anvil` command in your terminal and then in another terminal you can use the following command:

    forge script script/DeploySimpleStorage.s.sol --rpc-url <your_rpc_url> --account <you_private_key_name_in_cast-wallet> --sender <your_sender_address>
