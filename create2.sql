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
    idPerson INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL CHECK (birthdate <= CURRENT_DATE),  -- Ensure birthdate is a valid date and not in the future
    gender TEXT CHECK(gender IN ('Male', 'Female', 'Non-Binary', 'Undisclosed')) NOT NULL DEFAULT 'Undisclosed',
    idNumber VARCHAR(20) NOT NULL UNIQUE,
    nationality VARCHAR(3) NOT NULL -- ISO 3166-1 alpha-3 country code
);

CREATE TABLE Section (
    idSection INTEGER PRIMARY KEY AUTOINCREMENT,
    theme VARCHAR(50) NOT NULL
);

CREATE TABLE Bookshelf (
    idBookshelf INTEGER PRIMARY KEY AUTOINCREMENT,
    identifier VARCHAR(3) NOT NULL UNIQUE,
    idSection INTEGER,
    FOREIGN KEY (idSection) REFERENCES Section(idSection) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Book (
    idBook INTEGER PRIMARY KEY AUTOINCREMENT,
    isbn VARCHAR(17) NOT NULL UNIQUE,
    title VARCHAR(100) NOT NULL,
    ageRating TEXT CHECK (ageRating IN ('Children', 'Teens', 'Young Adult', 'Adult', 'Mature')) NOT NULL,
    edition VARCHAR(20) NOT NULL,  -- Increased size for editions
    totalCopies NUMERIC(5) NOT NULL,  -- Increased size for larger numbers of copies
    inStockCopies NUMERIC(5) NOT NULL,
    lentCopies NUMERIC(5) NOT NULL,
    idPublishingCompany INTEGER,
    idBookshelf INTEGER,
    FOREIGN KEY (idPublishingCompany) REFERENCES PublishingCompany(idPublishingCompany) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idBookshelf) REFERENCES Bookshelf(idBookshelf) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (inStockCopies + lentCopies = totalCopies)
);

CREATE TABLE Requisition (
    idRequisition INTEGER PRIMARY KEY AUTOINCREMENT,
    requisitionDate DATE NOT NULL,
    returnDate DATE NOT NULL CHECK (returnDate > requisitionDate),  -- Ensuring returnDate is after requisitionDate
    idPatron INTEGER,
    idEmployee INTEGER,
    FOREIGN KEY (idPatron) REFERENCES Patron(idPerson) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idEmployee) REFERENCES Employee(idPerson) ON DELETE CASCADE ON UPDATE CASCADE
);

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
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Employee (
    idPerson INTEGER PRIMARY KEY,
    employeeNumber NUMERIC(10) NOT NULL UNIQUE,
    salary DECIMAL(8,2) NOT NULL CHECK (salary >= 0),  -- Ensure salary is non-negative
    hiredDate DATE NOT NULL CHECK (hiredDate <= CURRENT_DATE),  -- Ensure hiredDate is not in the future
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Author (
    idPerson INTEGER PRIMARY KEY,
    biography TEXT NOT NULL,
    pseudonym VARCHAR(100),
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relationships

CREATE TABLE BookAuthor (
    idBook INTEGER,
    idPerson INTEGER,
    PRIMARY KEY (idBook, idPerson),
    FOREIGN KEY (idBook) REFERENCES Book(idBook) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE BookRequisition (
     idBook INTEGER,
     idRequisition INTEGER,
     PRIMARY KEY (idBook, idRequisition),
     FOREIGN KEY (idBook) REFERENCES Book(idBook) ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY (idRequisition) REFERENCES Requisition(idRequisition) ON DELETE CASCADE ON UPDATE CASCADE
);
