-- Enable Foreign Key Support
PRAGMA foreign_keys = ON;

-- Drop Existing Tables (if any)
DROP TABLE IF EXISTS BookRequisition;
DROP TABLE IF EXISTS BookAuthor;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Patron;
DROP TABLE IF EXISTS PublishingCompany;
DROP TABLE IF EXISTS Requisition;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Bookshelf;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Library;
DROP TABLE IF EXISTS Person;

-- Main Entities
CREATE TABLE Person (
    idPerson INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Non-Binary', 'Undisclosed')) DEFAULT 'Undisclosed',
    idNumber VARCHAR(20) NOT NULL UNIQUE,
    nationality VARCHAR(50)
);

CREATE TABLE Library (
    idLibrary INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    country VARCHAR(3) NOT NULL, -- ISO country code format
    address VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(15),
    website VARCHAR(100),
    openTime TIME NOT NULL,
    closeTime TIME NOT NULL,
    UNIQUE (name, address)
);

CREATE TABLE Section (
    idSection INTEGER PRIMARY KEY AUTOINCREMENT,
    theme VARCHAR(50) NOT NULL,
    idLibrary INTEGER NOT NULL,
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary) ON DELETE CASCADE
);

CREATE TABLE Bookshelf (
    idBookshelf INTEGER PRIMARY KEY AUTOINCREMENT,
    identifier VARCHAR(3) NOT NULL,
    idSection INTEGER NOT NULL,
    FOREIGN KEY (idSection) REFERENCES Section(idSection) ON DELETE CASCADE
);

-- Book Table (With identifier column for Bookshelf)
CREATE TABLE Book (
    isbn VARCHAR(17) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    ageRating TEXT CHECK (ageRating IN ('Children', 'Teens', 'Young Adult', 'Adult', 'Mature')) NOT NULL,
    edition VARCHAR(10) NOT NULL,
    totalCopies INTEGER NOT NULL CHECK (totalCopies >= 0),
    inStockCopies INTEGER NOT NULL CHECK (inStockCopies >= 0),
    lentCopies INTEGER NOT NULL CHECK (lentCopies >= 0),
    identifier VARCHAR(3),  -- Added identifier column for Bookshelf
    idPublishingCompany INTEGER,
    idBookshelf INTEGER,
    FOREIGN KEY (idPublishingCompany) REFERENCES PublishingCompany(idPublishingCompany) ON DELETE SET NULL,
    FOREIGN KEY (idBookshelf) REFERENCES Bookshelf(idBookshelf) ON DELETE SET NULL
);

-- Requisition Table
CREATE TABLE Requisition (
    idRequisition INTEGER PRIMARY KEY AUTOINCREMENT,
    requisitionDate DATE NOT NULL,
    returnDate DATE NOT NULL,
    idLibrary INTEGER NOT NULL,
    idPatron INTEGER NOT NULL,
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary) ON DELETE CASCADE,
    FOREIGN KEY (idPatron) REFERENCES Patron(idPerson) ON DELETE CASCADE
);

-- PublishingCompany Table
CREATE TABLE PublishingCompany (
    idPublishingCompany INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(3), -- ISO country code format
    website VARCHAR(255),
    foundedDate DATE
);

-- Inheritance (Specialized Entities)
CREATE TABLE Patron (
    idPerson INTEGER PRIMARY KEY,
    libraryCardNumber VARCHAR(10) NOT NULL UNIQUE,
    registrationDate DATE,
    idLibrary INTEGER NOT NULL,
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE,
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary) ON DELETE CASCADE
);

CREATE TABLE Employee (
    idPerson INTEGER PRIMARY KEY,
    employeeNumber INTEGER NOT NULL UNIQUE,
    salary DECIMAL(8,2) NOT NULL CHECK (salary >= 0),
    hiredDate DATE NOT NULL,
    idLibrary INTEGER NOT NULL,
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE,
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary) ON DELETE CASCADE
);

CREATE TABLE Author (
    idPerson INTEGER PRIMARY KEY,
    biography TEXT,
    pseudonym VARCHAR(100),
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE
);

-- Many-to-Many Relationship Between Books and Authors
CREATE TABLE BookAuthor (
    isbn VARCHAR(17) NOT NULL,
    idPerson INTEGER NOT NULL, -- References Person table, where authors are defined
    PRIMARY KEY (isbn, idPerson),
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE,
    FOREIGN KEY (idPerson) REFERENCES Author(idPerson) ON DELETE CASCADE
);

-- BookRequisition Table
CREATE TABLE BookRequisition (
    isbn VARCHAR(17) NOT NULL,
    idRequisition INTEGER NOT NULL,
    PRIMARY KEY (isbn, idRequisition),
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE,
    FOREIGN KEY (idRequisition) REFERENCES Requisition(idRequisition) ON DELETE CASCADE
);
