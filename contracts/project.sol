// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BookRental {
    // Struct to represent a book
    struct Book {
        address owner;
        string title;
        string author;
        bool isAvailable;
        uint256 rentalPrice;
        address currentRenter;
        uint256 rentedUntil;
    }

    // Array to store all books
    Book[] public books;

    // Mapping to track books owned by an address
    mapping(address => uint256[]) public ownerBooks;

    // Event to log when a new book is added
    event BookAdded(
        uint256 indexed bookId, 
        address indexed owner, 
        string title, 
        string author, 
        uint256 rentalPrice
    );

    // Event to log when a book is rented
    event BookRented(
        uint256 indexed bookId, 
        address indexed renter, 
        uint256 rentedUntil
    );

    // Function to add a new book to the rental system
    function addBook(
        string memory _title, 
        string memory _author, 
        uint256 _rentalPrice
    ) public returns (uint256) {
        // Validate input parameters
        require(bytes(_title).length > 0, "Title cannot be empty");
        require(bytes(_author).length > 0, "Author cannot be empty");
        require(_rentalPrice > 0, "Rental price must be greater than zero");

        // Create new book
        Book memory newBook = Book({
            owner: msg.sender,
            title: _title,
            author: _author,
            isAvailable: true,
            rentalPrice: _rentalPrice,
            currentRenter: address(0),
            rentedUntil: 0
        });

        // Add book to the array and get its ID
        uint256 bookId = books.length;
        books.push(newBook);

        // Track books owned by the owner
        ownerBooks[msg.sender].push(bookId);

        // Emit event for book addition
        emit BookAdded(bookId, msg.sender, _title, _author, _rentalPrice);

        return bookId;
    }

    // Function to rent a book
    function rentBook(uint256 _bookId, uint256 _rentalDays) public payable {
        // Validate book exists and is available
        require(_bookId < books.length, "Invalid book ID");
        require(books[_bookId].isAvailable, "Book is not available for rent");
        
        // Check if rental payment is sufficient
        Book storage book = books[_bookId];
        uint256 totalRentalCost = book.rentalPrice * _rentalDays;
        require(msg.value >= totalRentalCost, "Insufficient rental payment");

        // Update book status
        book.isAvailable = false;
        book.currentRenter = msg.sender;
        book.rentedUntil = block.timestamp + (_rentalDays * 1 days);

        // Transfer rental fee to book owner
        payable(book.owner).transfer(totalRentalCost);

        // Refund excess payment
        if (msg.value > totalRentalCost) {
            payable(msg.sender).transfer(msg.value - totalRentalCost);
        }

        // Emit event for book rental
        emit BookRented(_bookId, msg.sender, book.rentedUntil);
    }
}