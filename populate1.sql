-- Enable Foreign Key Support
PRAGMA foreign_keys = ON;


---

INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (1, 'John', 'Doe', '1990-01-01', 'Male','12345678', 'UK');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (2, 'Mary', 'Smith', '1999-12-31', 'Female','12345679', 'USA');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (3, 'Maurice', 'Sendak', '1928-06-10', 'Male','22334455', 'USA');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (4, 'Alice', 'Oseman', '1994-10-16', 'Female','123123123', 'UK');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (5, 'John', 'Green', '1977-08-24', 'Male','678876678', 'USA');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (6, 'Taylor', 'Jenkins', '1983-12-20', 'Female','21213434', 'USA');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality) VALUES (7, 'Kentaro', 'Miura', '1966-07-11', 'Male','99999999', 'JP');

--

INSERT INTO Patron(idPerson, libraryCardNumber, registrationDate) VALUES (1,20,'2017-10-10');
INSERT INTO Employee(idPerson, employeeNumber, salary, hiredDate) VALUES (2,5, 1500.00,'2006-01-05');
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (3,'Most Famous for writing Where the Wild things Are','');
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (4,'Most Famous for writing Heartstopper','');
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (5,'Most Famous for writing The Fault in Our Stars','');
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (6,'Most Famous for writing The Seven Husbands of Evelyn Hugo','');
INSERT INTO Author(idPerson, biography, pseudonym) VALUES (7,'Most Famous for writing Berserk','');

---

INSERT INTO Section (idSection, theme) VALUES (1,'Children Picture Book');
INSERT INTO Section (idSection, theme) VALUES (2,'Graphic Novel');
INSERT INTO Section (idSection, theme) VALUES (3,'Realistic Fiction');
INSERT INTO Section (idSection, theme) VALUES (4,'Historical Fiction');
INSERT INTO Section (idSection, theme) VALUES (5,'Manga');

---

INSERT INTO Bookshelf (idBookshelf, identifier, idSection) VALUES (1, '1S',1);
INSERT INTO Bookshelf (idBookshelf, identifier, idSection) VALUES (2, '2O',2);
INSERT INTO Bookshelf (idBookshelf, identifier, idSection) VALUES (3, '3G',3);
INSERT INTO Bookshelf (idBookshelf, identifier, idSection) VALUES (4, '4J',4);
INSERT INTO Bookshelf (idBookshelf, identifier, idSection) VALUES (5, '5M',5);

---

INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (1, 'Penguin Random House', 'USA','https://www.penguinrandomhouse.com', '2013-07-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (2, 'Harper Collins', 'USA','https://www.harpercollins.com', '1989-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (3, 'Simon and Schuster', 'USA','https://www.simonandschuster.com/', '1924-01-02');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (4, 'Hachette', 'FR','https://hachette.com/en', '1826-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate) VALUES (5, 'Hakusensha', 'JP','https://www.hakusensha.co.jp', '1973-12-01');

---

INSERT INTO Book (idBook, isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf) VALUES (1,'0-06-025492-0','Where the Wild Things Are','Children',25,10,8,2,2,1);
INSERT INTO Book (idBook, isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf) VALUES (2, '978-1-4449-5138-7','Heartstopper. Volume 1','Teens',2,20,5,15,4,2);
INSERT INTO Book (idBook, isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf) VALUES (3, '0-525-47881-7','The Fault in Our Stars','Young Adult',10,15,10,5,1,3);
INSERT INTO Book (idBook, isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf) VALUES (4, '9781398515697','The Seven Husbands of Evelyn Hugo','Adult',8,10,1,9,3,4);
INSERT INTO Book (idBook, isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf) VALUES (5, '978-1-59307-020-5','Berserk Volume 1','Mature',3,5,3,2,5,5);

---

INSERT INTO Requisition (idRequisition, requisitionDate, returnDate, idPatron, idEmployee) VALUES (1, '2024-11-20', '2024-12-20',1, 2);

---

INSERT INTO BookRequisition (idBook, idRequisition) VALUES (2,1);

---

INSERT INTO BookAuthor (idBook, idPerson) VALUES (1, 3);
INSERT INTO BookAuthor (idBook, idPerson) VALUES (2, 4);
INSERT INTO BookAuthor (idBook, idPerson) VALUES (3, 5);
INSERT INTO BookAuthor (idBook, idPerson) VALUES (4, 6);
INSERT INTO BookAuthor (idBook, idPerson) VALUES (5, 7);