# BookRental DApp

A decentralized application (DApp) for renting books using Ethereum smart contracts. This DApp allows users to add books to the rental system and rent books from others. It uses Web3.js for interaction with the Ethereum blockchain and MetaMask for wallet management.

---

## Features

- **Add Book**: Users can add new books to the rental system by providing the book's title, author, and rental price.
- **Rent Book**: Users can rent available books by specifying the book ID and rental duration (in days).
- **View Books**: The DApp displays all available books, their rental price, and the current status (whether rented or available).
- **Book Details**: View the current renter of a book and the rental period.

---

## Technologies Used

- **Solidity**: For writing the smart contract.
- **Web3.js**: A JavaScript library for interacting with the Ethereum blockchain.
- **MetaMask**: A browser extension to manage Ethereum accounts and sign transactions.
- **Ethereum Network**: The DApp can be deployed on any Ethereum network, including test networks (like Rinkeby or Goerli) or the mainnet.

---

## Setup

### 1. **Smart Contract Deployment**

Before running the frontend, you need to deploy the **BookRental** smart contract to an Ethereum network (Rinkeby or Goerli for testing, or Ethereum mainnet for production).

**Steps to deploy the smart contract:**

1. Write and compile the **BookRental** contract in **Remix IDE** or any other Ethereum development environment.
2. Deploy the contract using **MetaMask** to your preferred Ethereum network.
3. Save the **Contract Address** and **ABI** for the next step.

---

### 2. **Frontend Setup**

The frontend is built using **HTML** and **JavaScript**, with **Web3.js** to interact with the deployed contract. It requires **MetaMask** for wallet interaction.

#### Prerequisites:

- **MetaMask**: Install the [MetaMask extension](https://metamask.io/) in your browser.
- **Web3.js**: The frontend uses the Web3.js library, which is included via a CDN link.

#### Steps to use the frontend:

1. Clone this repository or download the HTML and JavaScript code to your local machine.

   ```bash
   git clone https://github.com/yourusername/bookrental-dapp.git
   cd bookrental-dapp
   ```

2. Open the `index.html` file in a web browser (preferably Google Chrome or Firefox).

3. Replace the `YOUR_CONTRACT_ADDRESS` placeholder in the `index.html` file with the deployed smart contract's address.

4. Replace the `/* Your contract ABI here */` comment in the `index.html` file with the **ABI** of the deployed contract.

   - To get the ABI, you can find it in the Remix IDE or from the deployment tool you used (e.g., Truffle or Hardhat).

---

## How to Use

1. **Connect to MetaMask**:

   - Once you open the DApp in your browser, MetaMask will prompt you to connect. Allow the connection.
   - Make sure you're connected to the correct Ethereum network where your contract is deployed (Rinkeby, Goerli, or Mainnet).

2. **Add a Book**:

   - In the "Add a New Book" section, enter the **title**, **author**, and **rental price** of the book (in Wei).
   - Click the **Add Book** button to submit the transaction. Your MetaMask wallet will ask you to confirm the transaction.

3. **Rent a Book**:

   - In the "Rent a Book" section, enter the **Book ID** (from the list of available books) and the **rental duration** (in days).
   - Click the **Rent Book** button to rent the book. MetaMask will ask you to confirm the payment for the rental.
   - Upon successful payment and transaction, the book will be marked as rented, and the owner will receive the rental fee.

4. **View All Books**:
   - The list of books will be displayed automatically after the page loads. It will show the **title**, **author**, **rental price**, and **rental status**.
   - You can see if the book is available or rented and the current renter details.

---

## Contract Methods

### 1. `addBook(string memory _title, string memory _author, uint256 _rentalPrice)`

- **Description**: Adds a new book to the rental system.
- **Parameters**:
  - `_title`: Title of the book (string).
  - `_author`: Author of the book (string).
  - `_rentalPrice`: Rental price of the book (in Wei).
- **Returns**: Book ID (uint256).
- **Events**: Emits `BookAdded` event.

### 2. `rentBook(uint256 _bookId, uint256 _rentalDays)`

- **Description**: Allows a user to rent a book for a specified number of days.
- **Parameters**:
  - `_bookId`: ID of the book to rent.
  - `_rentalDays`: Number of days to rent the book.
- **Transaction**: The user must pay the total rental cost.
- **Events**: Emits `BookRented` event.

---

## File Structure

```bash
bookrental-dapp/
├── index.html         # Frontend code for interacting with the smart contract
├── README.md          # Project documentation (this file)
```

---

## Testing

You can test the DApp using **Rinkeby** or **Goerli** test networks. Use **MetaMask** to set your network and deploy the contract on the test network. You can also use **Infura** or **Alchemy** to connect to an Ethereum node for transaction requests.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgements

- [MetaMask](https://metamask.io/) for Ethereum wallet integration.
- [Web3.js](https://web3js.readthedocs.io/) for Ethereum blockchain interaction.
- [Solidity](https://soliditylang.org/) for writing smart contracts.
- [Remix IDE](https://remix.ethereum.org/) for smart contract development and testing.

---
