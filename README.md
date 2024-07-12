# Degen Token Smart Contract

This repository contains the smart contract code for the Degen Token, an ERC20 token deployed on the Avalanche network for Degen Gaming. The token is designed to reward players, allowing them to exchange tokens for in-game store items and trade tokens with other players.

## Overview

The Degen Token smart contract is built using Solidity and leverages the OpenZeppelin library for ERC20 token standards and ownership management. The contract includes functionalities for minting, transferring, and burning tokens.

## Features

- **ERC20 Standard**: Implements the ERC20 token standard with basic functionalities.
- **Minting**: The owner can mint new tokens.
- **Transfer**: Users can transfer tokens to other addresses.
- **Burning**: Users can burn their tokens.
- **Ownership**: Ownership functionalities to manage the contract.

## Contract Details

- **Name**: Degen Token
- **Symbol**: DEGEN
- **Decimals**: 18 (default for ERC20 tokens)
- **Initial Supply**: 1,000,000 DEGEN tokens

## Functions

### Constructor

```solidity
constructor(address initialOwner) ERC20("Degen Token", "DEGEN") Ownable(initialOwner) {
    _mint(msg.sender, 1000000 * 10 ** decimals());
}
```

Initializes the token with the name "Degen Token", symbol "DEGEN", and an initial supply of 1,000,000 tokens. The initial supply is minted to the deployer's address.

### Mint

```solidity
function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
```

Mints new tokens to the specified address. Only the contract owner can call this function.

### Transfer

```solidity
function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
    require(amount <= balanceOf(msg.sender), "Insufficient balance");
    _transfer(msg.sender, recipient, amount);
    return true;
}
```

Transfers tokens from the sender's address to the recipient's address. Ensures the sender has sufficient balance.

### Redeem

```solidity
function redeem(uint256 amount) public {
    _burn(msg.sender, amount);
}
```

Burns a specified amount of tokens from the caller's address. This can be used for redeeming tokens in exchange for in-game items or services.

### Burn

```solidity
function burn(uint256 amount) public {
    _burn(msg.sender, amount);
}
```

Allows users to burn their tokens. This reduces the total supply of the token.

### Balance Of

```solidity
function balanceOf(address account) public view virtual override returns (uint256) {
    return super.balanceOf(account);
}
```

Returns the balance of the specified address.

## Usage

1. **Deployment**: Deploy the contract using Remix or any Ethereum-compatible development environment.
2. **Minting Tokens**: The owner can mint new tokens to any address.
3. **Transferring Tokens**: Users can transfer tokens to other addresses.
4. **Burning Tokens**: Users can burn their tokens.

## Prerequisites

- Solidity ^0.8.20
- OpenZeppelin Contracts

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [OpenZeppelin](https://openzeppelin.com/) for their comprehensive library of secure smart contract templates.
