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