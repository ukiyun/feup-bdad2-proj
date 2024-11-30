-- Data Population Script
-- Assuming that tables have already been created using create2_fixed.sql

-- First Insert Data into Parent Tables: Person, Library, Section, PublishingCompany, Bookshelf

-- Insert Library Data
INSERT INTO Library (name, country, address, phoneNumber, website, openTime, closeTime)
VALUES ('City Central Library', 'US', '123 Library St, New York', '123-456-7890', 'http://citylibrary.com', '08:00', '18:00');

-- Insert Section Data (Related to Library)
INSERT INTO Section (theme, idLibrary) VALUES ('Fiction', 1), ('Non-Fiction', 1), ('Science', 1);

-- Insert Bookshelf Data (Related to Section)
INSERT INTO Bookshelf (identifier, idSection) VALUES ('1A', 1), ('1B', 2), ('2A', 3);

-- Insert PublishingCompany Data
INSERT INTO PublishingCompany (name, country, website, foundedDate)
VALUES ('Penguin Books', 'US', 'http://penguin.com', '1935-07-01'),
       ('HarperCollins', 'US', 'http://harpercollins.com', '1989-01-01');

-- Insert Person Data
INSERT INTO Person (firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES ('George', 'Orwell', '1903-06-25', 'Male', '12345', 'British'),
       ('J.R.R.', 'Tolkien', '1892-01-03', 'Male', '23456', 'British');

-- Insert Author Data
INSERT INTO Author (idPerson, biography, pseudonym)
VALUES (1, 'English writer, known for "1984" and "Animal Farm".', NULL),
       (2, 'English writer, best known for "The Hobbit" and "The Lord of the Rings".', 'J.R.R. Tolkien');

-- Insert Book Data (Make sure Bookshelf and PublishingCompany IDs exist)
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf, identifier)
VALUES ('9780451524935', '1984', 'Adult', '1st', 100, 80, 20, 1, 1, '1A'),
       ('9780261103573', 'The Hobbit', 'Children', '2nd', 200, 180, 20, 2, 2, '1B');

-- Insert BookAuthor Data (Many-to-Many Relation between Books and Authors)
INSERT INTO BookAuthor (isbn, idPerson)
VALUES ('9780451524935', 1),
       ('9780261103573', 2);
