-- Commands for Database
PRAGMA foreign_keys = ON;

.mode column
.headers on

-- Drop Existing Tables/Relations

DROP TABLE IF EXISTS Person;
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

CREATE TABLE Section (
    idSection INTEGER PRIMARY KEY,
    theme VARCHAR(50) NOT NULL
);

CREATE TABLE Bookshelf (
    idBookshelf INTEGER PRIMARY KEY AUTOINCREMENT,
    identifier VARCHAR(3) NOT NULL UNIQUE,
    idSection INTEGER NOT NULL,
    FOREIGN KEY (idSection) REFERENCES Section(idSection)
);

CREATE TABLE Book (
    idBook INTEGER PRIMARY KEY AUTOINCREMENT,
    isbn VARCHAR(17) NOT NULL UNIQUE,
    title VARCHAR(100) NOT NULL,
    ageRating TEXT CHECK ( ageRating IN ('Children', 'Teens', 'Young Adult', 'Adult', 'Mature')) NOT NULL,
    edition VARCHAR(10) NOT NULL,
    totalCopies NUMERIC(3) NOT NULL,
    inStockCopies NUMERIC(3) NOT NULL,
    lentCopies NUMERIC(3) NOT NULL,
    idPublishingCompany INTEGER NOT NULL,
    idBookshelf INTEGER NOT NULL,
    FOREIGN KEY (idPublishingCompany) REFERENCES PublishingCompany(idPublishingCompany),
    FOREIGN KEY (idBookshelf) REFERENCES Bookshelf(idBookshelf),
    CHECK ( inStockCopies + lentCopies = totalCopies )
);

CREATE TABLE Requisition (
    idRequisition INTEGER PRIMARY KEY,
    requisitionDate DATE NOT NULL,
    returnDate DATE NOT NULL,
    idPatron INTEGER NOT NULL,
    idEmployee INTEGER NOT NULL,
    FOREIGN KEY (idPatron) REFERENCES Patron(idPerson),
    FOREIGN KEY (idEmployee) REFERENCES Employee(idPerson),
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
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);

CREATE TABLE Employee (
    idPerson INTEGER PRIMARY KEY,
    employeeNumber NUMERIC(10) NOT NULL UNIQUE,
    salary DECIMAL(8,2) NOT NULL,
    hiredDate DATE,
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);

CREATE TABLE Author (
    idPerson INTEGER PRIMARY KEY,
    biography TEXT NOT NULL,
    pseudonym VARCHAR(100),
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);

-- Relationships

CREATE TABLE BookAuthor (
    idBook INTEGER,
    idPerson INTEGER,
    PRIMARY KEY (idBook, idPerson),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson)
);

CREATE TABLE BookRequisition (
    idBook INTEGER,
    idRequisition INTEGER,
    PRIMARY KEY (idBook, idRequisition),
    FOREIGN KEY (idBook) REFERENCES Book(idBook),
    FOREIGN KEY (idRequisition) REFERENCES Requisition(idRequisition)
);