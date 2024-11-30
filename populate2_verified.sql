-- Insert Publishing Companies
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (6, 'Delacorte Press', 'United States', 'www.randomhouse.com', '1928-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (7, 'Alfred A. Knopf', 'United States', 'www.penguinrandomhouse.com', '1915-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (8, 'Archibald Constable & Company', 'United Kingdom', 'www.archibaldconstable.co.uk', '1795-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (9, 'Doubleday', 'United States', 'www.doubleday.com', '1897-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (10, 'Ballantine Books', 'United States', 'www.ballantinebooks.com', '1952-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (11, 'George Allen & Unwin', 'United Kingdom', 'www.georgeallenandunwin.com', '1914-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (12, 'Thomas Egerton', 'United Kingdom', 'www.thomasegerton.com', '1775-01-01');
INSERT INTO PublishingCompany (idPublishingCompany, name, country, website, foundedDate)
VALUES (13, 'Harper & Brothers', 'United States', 'www.harpercollins.com', '1817-01-01');

-- Insert Authors into Person Table (Authors as per the Books)
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (6, 'Kurt', 'Vonnegut', '1922-11-11', 'Male', '001', 'American');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (7, 'Cormac', 'McCarthy', '1933-07-20', 'Male', '002', 'American');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (8, 'Bram', 'Stoker', '1847-11-08', 'Male', '003', 'Irish');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (9, 'Stephen', 'King', '1947-09-21', 'Male', '004', 'American');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (10, 'Ray', 'Bradbury', '1920-08-22', 'Male', '005', 'American');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (11, 'J.R.R.', 'Tolkien', '1892-01-03', 'Male', '006', 'British');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (12, 'Jane', 'Austen', '1775-12-16', 'Female', '007', 'British');
INSERT INTO Person (idPerson, firstName, lastName, birthdate, gender, idNumber, nationality)
VALUES (13, 'Herman', 'Melville', '1819-08-01', 'Male', '008', 'American');

-- Insert Books with Correct Publishers
UPDATE Book SET idPublishingCompany = 6 WHERE title = 'Slaughterhouse-Five'; -- Delacorte Press
UPDATE Book SET idPublishingCompany = 7 WHERE title = 'The Road'; -- Alfred A. Knopf
UPDATE Book SET idPublishingCompany = 8 WHERE title = 'Dracula'; -- Archibald Constable & Company
UPDATE Book SET idPublishingCompany = 9 WHERE title = 'The Shining'; -- Doubleday
UPDATE Book SET idPublishingCompany = 10 WHERE title = 'Fahrenheit 451'; -- Ballantine Books
UPDATE Book SET idPublishingCompany = 11 WHERE title = 'The Hobbit'; -- George Allen & Unwin
UPDATE Book SET idPublishingCompany = 12 WHERE title = 'Pride and Prejudice'; -- Thomas Egerton
UPDATE Book SET idPublishingCompany = 11 WHERE title = 'The Lord of the Rings'; -- George Allen & Unwin
UPDATE Book SET idPublishingCompany = 13 WHERE title = 'Moby-Dick'; -- Harper & Brothers;

-- Add Author-Book Relationships
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780440180296', 6); -- Slaughterhouse-Five (Kurt Vonnegut)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780307387899', 7); -- The Road (Cormac McCarthy)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780141439846', 8); -- Dracula (Bram Stoker)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780307743657', 9); -- The Shining (Stephen King)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9781451673319', 10); -- Fahrenheit 451 (Ray Bradbury)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780618002252', 11); -- The Hobbit (J.R.R. Tolkien)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9781503290563', 12); -- Pride and Prejudice (Jane Austen)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780618002238', 11); -- The Lord of the Rings (J.R.R. Tolkien)
INSERT INTO BookAuthor (isbn, idPerson) VALUES ('9780142437247', 13); -- Moby-Dick (Herman Melville);
