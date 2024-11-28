-- Commands for Database
PRAGMA foreign_keys = ON;

.mode column
.headers on

-- Drop Existing Tables/Relations

DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Library;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Bookshelf;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Requisition;
DROP TABLE IF EXISTS PublishingCompany;
DROP TABLE IF EXISTS Patron;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS BookAuthor;
DROP TABLE IF EXISTS BookRequisition;

-- Creating Tables

-- Main Entities

CREATE TABLE Person (
    idPerson INTEGER PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Non-Binary', 'Undisclosed')) NOT NULL DEFAULT 'Undisclosed',
    idNumber VARCHAR(20) NOT NULL UNIQUE,
    nationality VARCHAR(50)
);

CREATE TABLE Library (
    idLibrary INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    country VARCHAR(3) NOT NULL, -- ISO country code format
    address VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(15),
    website VARCHAR(100),
    openTime TIME NOT NULL,
    closeTime TIME NOT NULL,
    CHECK ( closeTime > openTime )
);

CREATE TABLE Section (
    idSection INTEGER PRIMARY KEY,
    theme VARCHAR(50) NOT NULL,
    idLibrary INTEGER,
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary)
);

CREATE TABLE Bookshelf (
    idBookshelf INTEGER PRIMARY KEY AUTOINCREMENT,
    identifier VARCHAR(3) NOT NULL,
    idSection INTEGER,
    FOREIGN KEY (idSection) REFERENCES Section(idSection)
);

CREATE TABLE Book (
    isbn VARCHAR(17) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    ageRating TEXT CHECK ( ageRating IN ('Children', 'Teens', 'Young Adult', 'Adult', 'Mature')) NOT NULL,
    edition VARCHAR(10) NOT NULL,
    totalCopies NUMERIC(3) NOT NULL,
    inStockCopies NUMERIC(3) NOT NULL,
    lentCopies NUMERIC(3) NOT NULL,
    idPublishingCompany INTEGER,
    idBookshelf INTEGER,
    idAuthor INTEGER,
    FOREIGN KEY (idPublishingCompany) REFERENCES PublishingCompany(idPublishingCompany),
    FOREIGN KEY (idBookshelf) REFERENCES Bookshelf(idBookshelf),
    FOREIGN KEY (idAuthor) REFERENCES Author(idPerson),
    CHECK ( inStockCopies + lentCopies = totalCopies )
);

CREATE TABLE Requisition (
    idRequisition INTEGER PRIMARY KEY,
    requisitionDate DATE NOT NULL,
    returnDate DATE NOT NULL,
    idLibrary INTEGER,
    idPatron INTEGER,
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary),
    FOREIGN KEY (idPatron) REFERENCES Patron(idPerson),
    CHECK ( returnDate > requisitionDate )
);

CREATE TABLE PublishingCompany (
    idPublishingCompany INTEGER PRIMARY KEY,
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
    idLibrary INTEGER,
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson),
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary)
);

CREATE TABLE Employee (
    idPerson INTEGER PRIMARY KEY,
    employeeNumber NUMERIC(10) NOT NULL UNIQUE,
    salary DECIMAL(8,2) NOT NULL,
    hiredDate DATE,
    idLibrary INTEGER,
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson),
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary)
);

CREATE TABLE Author (
    idPerson INTEGER PRIMARY KEY,
    biography TEXT,
    pseudonym VARCHAR(100),
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);

-- Relationships

CREATE TABLE BookAuthor (
    isbn VARCHAR(13),
    idPerson INTEGER,
    PRIMARY KEY (isbn, idPerson),
    FOREIGN KEY (isbn) REFERENCES Book(isbn),
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);

CREATE TABLE BookRequisition (
    isbn VARCHAR(13),
    idRequisition INTEGER,
    PRIMARY KEY (isbn, idRequisition),
    FOREIGN KEY (isbn) REFERENCES Book(isbn),
    FOREIGN KEY (idRequisition) REFERENCES Requisition(idRequisition)
);