
# Index

1. Database
	1.1 Classes, Attributes and Constraints
2. UML Diagram
	 2.1 Refined Model
	 2.2 Generative AI Integration
	 2.3 Final Model
3. Relational Schema
	 3.1 Initial Proposal
	 3.2 Generative AI Assistance
	 3.3 Final Proposal
4. Functional Dependencies and Normal Forms Analysis
    4.1 Functional Dependencies
    4.2 Normal Forms
    4.3 Generative AI Assistance
    4.4 Final Proposal
	    4.4.1 Functional Dependencies
	    4.4.2 Normal Forms
5. SQLite Database Creation
	5.1 Initial Proposal
	5.2 Generative AI Integration
	5.3 Final Proposal
6. SQLite Data Loading (Populate)
	6.1 Initial Proposal and Generative AI Integration
	6.2 Final Proposal
7. Conclusions
	7.1 Project Overview
	7.2 Generative AI Integration Overview
	7.3 Final Conclusions

___
___
# Project Description

## Initial Description

- A Public Library is divided into multiple different sections, each one of them pertaining to a specific theme. Each section is composed of a wide range of bookshelves that then store the library’s available books.
- A book has a plethora of properties, those being the ISBN (a numeric identifier), the book’s title as well as the author, the age rating, the printed edition and the publishing company. To manage the books present in the library, these also have the attributes of total copies, in stock copies and lent copies, allowing for the easier management of which books are in store or not.
- Furthermore, the books can be requested/checked out of the library with each of the book’s requisition forms having a request date and a return date.
- The library is home to two types of people, the employees (with an associated employee number) and the patrons (with a library card). Both people are defined by their name, birthdate, gender, and id Number. For a book to be checked out the person must be a patron thus having a library card number to log into the requisition form.
- Finally, the library itself is defined by its name, the country where it is located, its address, and the opening and closing time.

## After Generative AI Analysis

- Using a simple Generative AI tool, like ChatGPT, we input our initial description along with the planned classes and attributes and asked whether the AI would make any changes to our planned database. The AI suggested the normalization of frequently reused entities like Author and Publisher into separate tables. As well as changing a few attribute types and extending them for a broader database. Thus, after proper analysis and comparison of our previous description and the new AI description, we decided to implement most of the features suggested by the AI, resulting in:
## Updated Description

- The Public Library System is an organized information network designed to facilitate access to a vast collection of books.
- At its core the library is composed of _People_, _Books_ and Infrastructure, all interconnected. Key actors include _Patrons_, who borrow books and frequent the library, and _Employees_, who manage operations. Simultaneously, the library collaborates with _Authors_ to showcase their works and _Publishing Companies_ to source books.
-  The _Library_ maintains details such as its name, address, contact information and operational hours. Inside it, themed _Sections_ are designated to categorize books by genre or subject matter. Each section contains multiple _Bookshelves_, uniquely identified to store and display the books effectively.
- The Books are identified by their ISBN, their title and edition, as well as an age rating and stock information to ensure the system manages the requests of patrons. The _Book Requisition_ tracks the borrowing details such as requisition date, return date and references to the associated Patron, Book and Library.
- The people are characterized by their first and last names, birthdate, gender, id number and nationality. With the author having a potential biography and pseudonyms. The Patron has an associated library card number and a registration date. And the employee having a salary, an employee number and a hired date associated.
- Finally, the Publishing Company is defined by its name, country of origin, a possible   website and a foundation date.

___
___
# 1. Database

- This section already implements the changes made after the Generative AI tool had been used.
## 1.1. Classes and Attributes

### _Person_

| Attribute   | Description                        | Constraints                                                                       |
| ----------- | ---------------------------------- | --------------------------------------------------------------------------------- |
| FirstName   | The first name of the person       | NOT NULL                                                                          |
| LastName    | The last name of the person        | NOT NULL                                                                          |
| Birthdate   | The date of birth of the person    | NOT NULL                                                                          |
| Gender      | The gender identity of the person  | = ('Male' OR 'Female' OR 'Non-Binary' OR 'Undisclosed'); DEFAULT is 'Undisclosed' |
| IdNumber    | A unique identifier for the person | NOT NULL, UNIQUE                                                                  |
| Nationality | The nationality of the person      | NOT NULL                                                                          |

___
### _Patron (Child of Person)_

| Attribute         | Description                                     | Constraints                              |
| ----------------- | ----------------------------------------------- | ---------------------------------------- |
| Person Attributes | Inherits attributes from class *Person*         | Inherits constraints from class *Person* |
| LibraryCardNumber | A card number identifying the patron            | NOT NULL, UNIQUE                         |
| RegistrationDate  | The date the patron registered with the library | ---                                      |

___
### _Employee (Child of Person)_

| Attribute         | Description                             | Constraints                              |
| ----------------- | --------------------------------------- | ---------------------------------------- |
| Person Attributes | Inherits attributes from class *Person* | Inherits constraints from class *Person* |
| EmployeeNumber    | An identifier for the employee          | NOT NULL, UNIQUE                         |
| HiredDate         | The date the employee was hired         | ---                                      |
| Salary            | The salary of the employee              | NOT NULL                                 |

___
### _Library_

| Attribute   | Description                              | Constraints |
| ----------- | ---------------------------------------- | ----------- |
| Name        | The name of the library                  | NOT NULL    |
| Country     | The country where the library is located | NOT NULL    |
| Address     | The full address of the library          | NOT NULL    |
| PhoneNumber | The contact number for the library       | ---         |
| Website     | The Website URL for the library          | ---         |
| OpenTime    | The time the library opens               | NOT NULL    |
| CloseTime   | The time the library closes              | NOT NULL    |
- CHECK → CloseTime > OpenTime (CloseTime must be later than OpenTime)
___
### _Section_

| Attribute | Description                       | Constraints |
| --------- | --------------------------------- | ----------- |
| Theme     | The theme or genre of the section | NOT NULL    |

___
### _Bookshelf_

| Attribute  | Description                      | Constraints      |
| ---------- | -------------------------------- | ---------------- |
| Identifier | The identifier for the bookshelf | NOT NULL, UNIQUE |

___
### _Book_

| Attribute     | Description                                                     | Constraints                                                       |
| ------------- | --------------------------------------------------------------- | ----------------------------------------------------------------- |
| ISBN          | A unique identifier for the book                                | NOT NULL, UNIQUE                                                  |
| Title         | The title of the book                                           | NOT NULL                                                          |
| AgeRating     | The age suitability of the book                                 | = ('Children' OR 'Teens' OR 'Young Adult' OR 'Adult' OR 'Mature') |
| Edition       | The edition of the book                                         | NOT NULL                                                          |
| TotalCopies   | The total number of copies of the book available in the library | NOT NULL                                                          |
| InStockCopies | The number of copies currently available in the library         | NOT NULL                                                          |
| LentCopies    | The number of copies currently being borrowed                   | NOT NULL                                                          |
- CHECK → InStockCopies + LentCopies = TotalCopies
___
### _Requisition_

| Attribute       | Description                             | Constraints |
| --------------- | --------------------------------------- | ----------- |
| RequisitionDate | The date the book was borrowed          | NOT NULL    |
| ReturnDate      | The date the book is due to be returned | NOT NULL    |
- CHECK → ReturnDate > RequisitionDate (ReturnDate must be later than RequisitionDate)
___
### _Author (Child of Person)_

| Attribute         | Description                                      | Constraints                              |
| ----------------- | ------------------------------------------------ | ---------------------------------------- |
| Person Attributes | Inherits attributes from class *Person*          | Inherits constraints from class *Person* |
| Biography         | A detailed biography of the author               | ---                                      |
| Pseudonym         | An alternate name or pen name used by the author | ---                                      |

___
### _Publishing Company_

| Attribute   | Description                                               | Constraints      |
| ----------- | --------------------------------------------------------- | ---------------- |
| Name        | The name of the publishing company                        | NOT NULL, UNIQUE |
| Country     | The country where the publishing company is headquartered | NOT NLL          |
| Website     | The website URL of the company                            | ---              |
| FoundedDate | The date the publishing company was established           | ---              |

___
___
# 2. UML Diagram

## 2.1 Refined Model

![[BDAD_original_UML.png]]
## 2.2 Generative AI Integration

- Much like in the Description Part, the Generative AI used was ChatGPT. The prompt given to it was the refined model and the new and improved classes and their attributes. The output was an image generated by DALL-E.

![[DALL-E_UML.png]]

- Since the AI used is not yet the best at dealing with images, the output looks a bit dishevelled, and some parts are not perceptive enough. Making it hard to make out the actual UML Diagram.
- However, since we knew the existence of a coding language used specifically to make diagrams (Mermaid Chart), we asked the AI to convert it. That gave us a UML diagram that was more readable than before but still formed through AI prompts.

![[Mermaid_UML.png]]

- Then to clear up the diagram we used the examples provided by the AI and our knowledge to get our Final Model.

## 2.3 Final Model

![[BDAD_final_UML.png]]

___
___
# 3. Relational Schema

## 3.1 Initial Proposal

- PersonPatron (<ins>idPerson</ins>, firstName, lastName, birthdate, gender, idNumber, nationality, libraryCardNumber, registrationDate, idLibrary → Library)
- PersonEmployee (<ins>idPerson</ins>, firstName, lastName, birthdate, gender, idNumber, nationality, employeeNumber, salary, hiredDate, idLibrary → Library)
- Library (<ins>idLibrary</ins>, name, country, address, phoneNumber, website, openTime, closeTime)
- Section (<ins>idSection</ins>, theme, idLibrary → Library)
- Bookshelf (<ins>identifier</ins>, idSection → Section)
- Book (<ins>isbn</ins>, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany → PublishingCompany, identifier → Bookshelf)
- Requisition (<ins>idRequisition</ins>, requisitionDate, returnDate, idLibrary → Library)
- PersonAuthor (<ins>idPerson</ins>, firstName, lastName, birthdate, gender, idNumber, nationality, biography, pseudonym)
- PublishingCompany (<ins>idPublishingCompany</ins>, name, country, website, foundedDate)
- PatronRequisition (<ins>idPatron</ins> → Patron, <ins>idRequisition</ins> → Requisition)
- BookRequisition (<ins>isbn</ins> → Book, <ins>idRequisition</ins> → Requisition)
- BookAuthor (<ins>isbn</ins> → Book, <ins>idPerson</ins> → PersonAuthor)

> Note: Generalizations where made as Object Oriented

---
## 3.2 Generative AI Assistance

- This time the prompt given to the AI was the 1.1 section, the classes, attributes and constrains, as well as the final UML Model. Then we gave the AI our initial proposal for the Relational Schema and simple prompted it with the question:

> Can you detect any mistakes in this relational schema and what would you implement to improve it?

The AI replied saying that the schema was already well structured but that there were a few improvements/changes it would make to enhance clarity and improve normalization. These changes were:
- Splitting Person into a Base Relation and making PersonPatron, PersonEmployee and PersonAuthor extend it.
- Remove PatronRequisition since each requisition is already tied to a specific patron via idPatron in the Requisition Relation.
- Improve Naming for Consistency and remove redundancy.

---
## 3.3 Final Proposal

#### Main Entities

- Person (<ins>idPerson</ins>, firstName, lastName, birthdate, gender, idNumber, nationality)
- Library (<ins>idLibrary</ins>, name, country, address, phoneNumber, website, openTime, closeTime)
- Section (<ins>idSection</ins>, theme, idLibrary → Library)
- Bookshelf (<ins>idBookshelf</ins>, identifier , idSection → Section)
- Book (<ins>isbn</ins>, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany → PublishingCompany, idBookshelf → Bookshelf)
- Requisition (<ins>idRequisition</ins>, requisitionDate, returnDate, idLibrary → Library, idPatron → Patron)
- PublishingCompany (<ins>idPublishingCompany</ins>, name, country, website, foundedDate)

#### Inheritance (Specialized Entities)

- Patron (<ins>idPerson</ins> → Person, libraryCardNumber, registrationDate, idLibrary → Library)
- Employee (<ins>idPerson</ins> → Person, employeeNumber, salary, hiredDate, idLibrary → Library)
- Author (<ins>idPerson</ins> → Person, biography, pseudonym)

#### Relationships

- BookAuthor (<ins>isbn</ins> → Book, <ins>idPerson</ins>→ Author)
- BookRequisition (<ins>isbn</ins> → Book, <ins>idRequisition</ins>→ Requisition)

____
___
# 4. Functional Dependencies and Normal Form Analysis

## 4.1 Functional Dependencies

## 4.2 Normal Forms

## 4.3 Generative AI Assistance

## 4.4 Final Proposal

### 4.4.1 Functional Dependencies

### 4.4.2 Normal Forms

___
___
# 5. SQLite Database Creation

## 5.1 Initial Proposal

- Based on the final Relational Schema proposal, the following database was made in `sqlite3`.


create1.sql

```sql
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
```

## 5.2 Generative AI Integration

- Once again the Generative AI was used in order to correct any mistakes and overall improve the quality of the code. The following were the tips provided by the AI to make the sql code more robust and scalable:
	- Enable Cascading Deletes and Updates → Add `ON DELETE CASCADE` and `on UPDATE CASCADE` to foreign key constraints to ensure that related data remains consistent when a parent row is deleted/updated.
	- Check Constraints on Person → add constraint to ensure valid dates and non-empty values  for attributes like birthdate.
	- Unique Constraint on Library Name and Address → Prevent duplicate libraries with the same name and address.
	- Check for salary and hiredDate in Employee → add check to ensure salary is non-negative and hiredDate is not in the future.
	- Use `INTEGER` for IDs → Replace `NUMERIC` with `INTEGER` for identifiers where possible. (more efficient data type)
	- Add `AUTOINCREMENT` to Main Entities Primary Keys.

## 5.3 Final Proposal

- Overall the changes made were the ones suggested by the AI, since, in our point of view most of them did not alter the essence of our relational model but instead just made the database more scalable and robust. Mainly being able to check for certain constraints that weren't thought of before.


create2.sql

```sql
-- Enable Foreign Key Support  
PRAGMA foreign_keys = ON;  
  
-- Drop Existing Tables  
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
    birthdate DATE NOT NULL CHECK (birthdate <= DATE('now')),  
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
     CHECK (closeTime > openTime),  
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
  
CREATE TABLE Book (  
    isbn VARCHAR(17) PRIMARY KEY,  
    title VARCHAR(100) NOT NULL,  
    ageRating TEXT CHECK (ageRating IN ('Children', 'Teens', 'Young Adult', 'Adult', 'Mature')) NOT NULL,  
    edition VARCHAR(10) NOT NULL,  
    totalCopies INTEGER NOT NULL CHECK (totalCopies >= 0),  
    idPublishingCompany INTEGER,  
    idBookshelf INTEGER,  
    idAuthor INTEGER,  
    FOREIGN KEY (idPublishingCompany) REFERENCES PublishingCompany(idPublishingCompany) ON DELETE SET NULL,  
    FOREIGN KEY (idBookshelf) REFERENCES Bookshelf(idBookshelf) ON DELETE SET NULL,  
    FOREIGN KEY (idAuthor) REFERENCES Author(idPerson)  
);  
  
CREATE TABLE Requisition (  
    idRequisition INTEGER PRIMARY KEY AUTOINCREMENT,  
    requisitionDate DATE NOT NULL,  
    returnDate DATE NOT NULL CHECK (returnDate > requisitionDate),  
    idLibrary INTEGER NOT NULL,  
    idPatron INTEGER NOT NULL,  
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary) ON DELETE CASCADE,  
    FOREIGN KEY (idPatron) REFERENCES Patron(idPerson) ON DELETE CASCADE  
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
    idLibrary INTEGER NOT NULL,  
    FOREIGN KEY (idPerson) REFERENCES Person(idPerson) ON DELETE CASCADE,  
    FOREIGN KEY (idLibrary) REFERENCES Library(idLibrary) ON DELETE CASCADE  
);  
  
CREATE TABLE Employee (  
    idPerson INTEGER PRIMARY KEY,  
    employeeNumber INTEGER NOT NULL UNIQUE,  
    salary DECIMAL(8,2) NOT NULL CHECK (salary >= 0),  
    hiredDate DATE NOT NULL CHECK (hiredDate <= DATE('now')),  
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
  
-- Relationships  
CREATE TABLE BookAuthor (  
    isbn VARCHAR(13) NOT NULL,  
    idPerson INTEGER NOT NULL,  
    PRIMARY KEY (isbn, idPerson),  
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE,  
    FOREIGN KEY (idPerson) REFERENCES Author(idPerson) ON DELETE CASCADE  
);  
  
CREATE TABLE BookRequisition (  
    isbn VARCHAR(13) NOT NULL,  
    idRequisition INTEGER NOT NULL,  
    PRIMARY KEY (isbn, idRequisition),  
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE,  
    FOREIGN KEY (idRequisition) REFERENCES Requisition(idRequisition) ON DELETE CASCADE  
);
```

___
___
# 6. SQLite Data Loading (Populate)

## 6.1 Initial Proposal and Generative AI Integration

- To start off the population of the database, some values pertaining to our database were input by ourselves. 


populate1.sql

```sql
-- Enable Foreign Key Support  
PRAGMA foreign_keys = ON;  
  
  
---  
  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (1, 'John', 'Doe', '1990-01-01', 'Male','12345678', 'English');  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (2, 'Mary', 'Smith', '1999-12-31', 'Female','12345679', 'American');  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (3, 'Maurice', 'Sendak', '1928-06-10', 'Male','22334455', 'American');  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (4, 'Alice', 'Oseman', '1994-10-16', 'Female','123123123', 'English');  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (5, 'John', 'Green', '1977-08-24', 'Male','678876678', 'American');  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (6, 'Taylor', 'Jenkins', '1983-12-20', 'Female','21213434', 'American');  
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (7, 'Kentaro', 'Miura', '1966-07-11', 'Male','99999999', 'Japanese');  
  
--  
  
INSERT INTO Patron(idPerson, libraryCardNumber, registrationDate, idLibrary) VALUES (1,20,'2017-10-10', 1);  
INSERT INTO Employee(idPerson, employeeNumber, salary, hiredDate, idLibrary) VALUES (2,5, 1500.00,'2006-01-05', 2);  
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (3,'','');  
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (4,'','');  
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (5,'','');  
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (6,'','');  
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (7,'','');  
  
---  
  
INSERT INTO Library (idLibrary, name, country, address, phoneNumber, website, openTime, closeTime) VALUES (1,'Biblioteca Municipal de Vila Nova de Gaia','PRT','Rua de Angola, 4430-014, Vila Nova de Gaia','223745670','https://www.cm-gaia.pt/pt/cidade/cultura/equipamentos-municipais/biblioteca-municipal/','09:00:00','19:00:00');  
  
---  
  
INSERT INTO Section (idSection, theme, idLibrary) VALUES (1,'Children Picture Book',1);  
INSERT INTO Section (idSection, theme, idLibrary) VALUES (2,'Graphic Novel',1);  
INSERT INTO Section (idSection, theme, idLibrary) VALUES (3,'Realistic Fiction',1);  
INSERT INTO Section (idSection, theme, idLibrary) VALUES (4,'Historical Fiction',1);  
INSERT INTO Section (idSection, theme, idLibrary) VALUES (5,'Manga',1);  
  
---  
  
INSERT INTO Bookshelf (identifier, idSection) VALUES ('1W',1);  
INSERT INTO Bookshelf (identifier, idSection) VALUES ('2H',2);  
INSERT INTO Bookshelf (identifier, idSection) VALUES ('3T',3);  
INSERT INTO Bookshelf (identifier, idSection) VALUES ('4T',4);  
INSERT INTO Bookshelf (identifier, idSection) VALUES ('5B',5);  
  
---  
  
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, identifier) VALUES ('0-06-025492-0','Where the Wild Things Are','Children',25,10,8,2,2,'1W');  
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, identifier) VALUES ('978-1-4449-5138-7','Heartstopper. Volume 1','Teens',2,20,5,15,4,'2H');  
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, identifier) VALUES ('0-525-47881-7','The Fault in Our Stars','Young Adult',10,15,10,5,1,'3T');  
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, identifier) VALUES ('9781398515697','The Seven Husbands of Evelyn Hugo','Adult',8,10,1,9,3,'4T');  
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, identifier) VALUES ('978-1-59307-020-5','Berserk Volume 1','Mature',3,5,3,2,5,'5T');  
  
---  
  
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (1, 'Penguin Random House', 'USA','https://www.penguinrandomhouse.com', '2013-07-01');  
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (2, 'Harper Collins', 'USA','https://www.harpercollins.com', '1989-01-01');  
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (3, 'Simon and Schuster', 'USA','https://www.simonandschuster.com/', '1924-01-02');  
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (4, 'Hachette', 'FR','https://hachette.com/en', '1826-01-01');  
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (5, 'Hakusensha', 'JP','https://www.hakusensha.co.jp', '1973-12-01');  
  
---  
  
INSERT INTO Requisition (idRequisition, requisitionDate, returnDate, idLibrary, idPatron) VALUES (1, '2024-11-20', '2024-12-20',1, 1);  
  
---  
  
INSERT INTO BookRequisition (isbn, idRequisition) VALUES ('978-1-4449-5138-7',1);  
  
---  
  
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('0-06-025492-0', 3);  
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('978-1-4449-5138-7', 4);  
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('0-525-47881-7', 5);  
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9781398515697', 6);  
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('978-1-59307-020-5', 7);
```

- However, since populating a database can be a quite extensive work, our first inputs were not many. That's where AI is a big help in this part of the project, because unlike us, AI can generate hundreds or thousands of lines of code to populate a database. So that's how the final proposal came to be.

## 6.2 Final Proposal

populate2.sql

```sql

```

___
___
# 7. Conclusions

## 7.1 Project Overview

## 7.2 Generative AI Integration Overview

## 7.3 Final Conclusions

___

