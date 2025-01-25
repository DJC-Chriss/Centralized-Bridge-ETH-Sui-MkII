# Centralized-Bridge-ETH-Sui-MkII

Comprehensive walkthrough of the steps taken to set up and manage a token bridge between Ethereum and Sui blockchains. It focuses on key actions, tools, and strategies used throughout the project.

---

## Table of Contents
1. [Extracting Private Keys and Setting Up Wallets](#extracting-private-keys-and-setting-up-wallets)
2. [Ethereum Workflow](#ethereum-workflow)
   - [Deploying the Contract](#deploying-the-contract)
   - [Minting Tokens](#minting-tokens)
   - [Burning Tokens](#burning-tokens)
3. [Sui Workflow](#sui-workflow)
   - [Setting Up the Sui CLI and Wallet](#setting-up-the-sui-cli-and-wallet)
   - [Publishing the Module](#publishing-the-module)
   - [Minting and Burning Tokens](#minting-and-burning-tokens)
4. [Key Details Extraction](#key-details-extraction)
5. [Building the Bridge Workflow](#building-the-bridge-workflow)

---

## Extracting Private Keys and Setting Up Wallets

### Ethereum

- **Extracting Private Key**:
  - Used **Anvil** to extract the private key for the Ethereum account for the start, then imported the private key and account to Metamask extension wallet.
  - Stored the private key securely for signing transactions.

### Sui

- **Importing Account**:
  - Created a JSON file for the keypair in the format required by the Sui CLI.
    ```json
    {
      "schema": "ED25519",
      "privateKey": "your_private_key_in_base64_format"
    }
    ```
  - Imported the account:
    ```bash
    sui keytool list
    ```
  - Verified the imported address:
    ```bash
    sui client addresses
    ```

- **Gas Management**:
  - Used the transfer method from Sui to acquire gas tokens for transactions in Localnet:
    ```bash
    sui client transfer-sui --amount <AMOUNT> --to <RECIPIENT_ADDRESS> --gas-budget <GAS_BUDGET>
    ```
  - Checked gas object details:
    ```bash
    sui client gas
    ```

---

## Ethereum Workflow

### Deploying the Contract

1. **Compilation**:
   - Compiled the Solidity contract using `forge`:
     ```bash
     forge build
     ```

2. **Deployment**:
   - Deployed the contract using a script:
     ```bash
     forge script script/DeployToken.s.sol \
       --rpc-url http://127.0.0.1:8545 \
       --private-key 0xPRIVATE_KEY \
       --broadcast
     ```
   - Captured the contract address from the output.

---

### Minting Tokens

1. **Configuration**:
   - Identified the deployed contract address from logs.
   - Configured the minting script with the recipient address and amount.

2. **Execution**:
   - Executed the minting script:
     ```bash
     forge script script/MintToken.s.sol \
       --rpc-url http://127.0.0.1:8545 \
       --private-key 0xPRIVATE_KEY \
       --broadcast
     ```

---

### Burning Tokens

1. **Configuration**:
   - Updated the burn script with the contract address and amount.

2. **Execution**:
   - Ran the burn script:
     ```bash
     forge script script/BurnToken.s.sol \
       --rpc-url http://127.0.0.1:8545 \
       --private-key 0xPRIVATE_KEY \
       --broadcast
     ```

---

## Sui Workflow

### Setting Up the Sui CLI and Wallet

1. **Installing and Starting**:
   - Installed the Sui CLI and started the Localnet:
     ```bash
     sui start
     ```

2. **Account Setup**:
   - Imported an existing account:
     ```bash
     sui keytool import --keypair-path <path_to_keypair_json>
     ```
   - Verified the address and gas objects:
     ```bash
     sui client addresses
     sui client gas
     ```

---

### Publishing the Module

1. **Compile Move Code**:
   - Compiled the Move module:
     ```bash
     sui move build
     ```

2. **Publish to Sui**:
   - Published the module to the Localnet:
     ```bash
     sui client publish --gas-budget 50000000
     ```

---

### Minting and Burning Tokens

- **Minting**:
  ```bash
  sui client call \
    --package <PACKAGE_ID> \
    --module token \
    --function mint \
    --args <TREASURY_CAP_ID> <AMOUNT> <RECIPIENT_ADDRESS> <ADMIN_CAP_ID> \
    --gas-budget 50000000
  ```

- **Burning**:
  ```bash
  sui client call \
  --package <PACKAGE_ID> \
  --module token \
  --function burn \
  --args <TREASURY_CAP_ID> <COIN_OBJECT_ID> <ADMIN_CAP_ID> \
  --gas-budget 50000000
  ```

## Key Details Extraction
  **Throughout the process, captured key outputs:**
    - Ethereum Contract Address from deployment logs.
    - Sui Package ID and Object IDs from transaction outputs.
  - Verified and reused these details across scripts and commands.

## Building the Bridge Workflow

### Frontend Setup
- **Created a React-based interface**:
  ```bash
  npx create-react-app bridge
  cd bridge
  npm install ethers @mysten/sui.js
  ```
- The interface includes buttons to handle key blockchain interactions:
  - Deploying contracts: Automates the deployment of smart contracts on Ethereum and Sui.
  - Minting tokens: Executes minting scripts or calls to create tokens on both chains.
  - Burning tokens: Runs burning scripts or calls to destroy tokens as part of the bridging process.
  - Querying balances: Allows users to check token balances for specific addresses on both Ethereum and Sui.