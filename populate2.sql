-- Populate Sections

INSERT INTO Section (theme) VALUES
    ('Thriller'),
    ('Crime'),
    ('Romance'),
    ('Manga'),
    ('Fantasy'),
    ('Science Fiction'),
    ('Non-Fiction'),
    ('Historical');

-- Populate Bookshelves with correct ids and identifiers
INSERT INTO Bookshelf (identifier, idSection) VALUES
    -- Section 1 - Thriller
    ('1A', 1), ('1B', 1), ('1C', 1), ('1D', 1), ('1E', 1), ('1F', 1), ('1G', 1), ('1H', 1), ('1I', 1),
    ('1J', 1), ('1K', 1), ('1L', 1), ('1M', 1), ('1N', 1), ('1O', 1), ('1P', 1), ('1Q', 1), ('1R', 1),
    ('1S', 1), ('1T', 1), ('1U', 1), ('1V', 1), ('1W', 1), ('1X', 1), ('1Y', 1), ('1Z', 1),

    -- Section 2 - Crime
    ('2A', 2), ('2B', 2), ('2C', 2), ('2D', 2), ('2E', 2), ('2F', 2), ('2G', 2), ('2H', 2), ('2I', 2),
    ('2J', 2), ('2K', 2), ('2L', 2), ('2M', 2), ('2N', 2), ('2O', 2), ('2P', 2), ('2Q', 2), ('2R', 2),
    ('2S', 2), ('2T', 2), ('2U', 2), ('2V', 2), ('2W', 2), ('2X', 2), ('2Y', 2), ('2Z', 2),

    -- Section 3 - Romance
    ('3A', 3), ('3B', 3), ('3C', 3), ('3D', 3), ('3E', 3), ('3F', 3), ('3G', 3), ('3H', 3), ('3I', 3),
    ('3J', 3), ('3K', 3), ('3L', 3), ('3M', 3), ('3N', 3), ('3O', 3), ('3P', 3), ('3Q', 3), ('3R', 3),
    ('3S', 3), ('3T', 3), ('3U', 3), ('3V', 3), ('3W', 3), ('3X', 3), ('3Y', 3), ('3Z', 3),

    -- Section 4 - Manga
    ('4A', 4), ('4B', 4), ('4C', 4), ('4D', 4), ('4E', 4), ('4F', 4), ('4G', 4), ('4H', 4), ('4I', 4),
    ('4J', 4), ('4K', 4), ('4L', 4), ('4M', 4), ('4N', 4), ('4O', 4), ('4P', 4), ('4Q', 4), ('4R', 4),
    ('4S', 4), ('4T', 4), ('4U', 4), ('4V', 4), ('4W', 4), ('4X', 4), ('4Y', 4), ('4Z', 4),

    -- Section 5 - Fantasy
    ('5A', 5), ('5B', 5), ('5C', 5), ('5D', 5), ('5E', 5), ('5F', 5), ('5G', 5), ('5H', 5), ('5I', 5),
    ('5J', 5), ('5K', 5), ('5L', 5), ('5M', 5), ('5N', 5), ('5O', 5), ('5P', 5), ('5Q', 5), ('5R', 5),
    ('5S', 5), ('5T', 5), ('5U', 5), ('5V', 5), ('5W', 5), ('5X', 5), ('5Y', 5), ('5Z', 5),

    -- Section 6 - Science Fiction
    ('6A', 6), ('6B', 6), ('6C', 6), ('6D', 6), ('6E', 6), ('6F', 6), ('6G', 6), ('6H', 6), ('6I', 6),
    ('6J', 6), ('6K', 6), ('6L', 6), ('6M', 6), ('6N', 6), ('6O', 6), ('6P', 6), ('6Q', 6), ('6R', 6),
    ('6S', 6), ('6T', 6), ('6U', 6), ('6V', 6), ('6W', 6), ('6X', 6), ('6Y', 6), ('6Z', 6),

    -- Section 7 - Non-Fiction
    ('7A', 7), ('7B', 7), ('7C', 7), ('7D', 7), ('7E', 7), ('7F', 7), ('7G', 7), ('7H', 7), ('7I', 7),
    ('7J', 7), ('7K', 7), ('7L', 7), ('7M', 7), ('7N', 7), ('7O', 7), ('7P', 7), ('7Q', 7), ('7R', 7),
    ('7S', 7), ('7T', 7), ('7U', 7), ('7V', 7), ('7W', 7), ('7X', 7), ('7Y', 7), ('7Z', 7),

    -- Section 8 - Historical
    ('8A', 8), ('8B', 8), ('8C', 8), ('8D', 8), ('8E', 8), ('8F', 8), ('8G', 8), ('8H', 8), ('8I', 8),
    ('8J', 8), ('8K', 8), ('8L', 8), ('8M', 8), ('8N', 8), ('8O', 8), ('8P', 8), ('8Q', 8), ('8R', 8),
    ('8S', 8), ('8T', 8), ('8U', 8), ('8V', 8), ('8W', 8), ('8X', 8), ('8Y', 8), ('8Z', 8);


INSERT INTO PublishingCompany (name, country, website, foundedDate) VALUES
    ('Knopf', 'US', 'https://www.penguinrandomhouse.com', '1915-01-01'),
    ('Crown Publishing', 'US', 'https://www.penguinrandomhouse.com', '1999-01-01'),
    ('Celadon Books', 'US', 'https://www.celadonbooks.com', '2018-01-01'),
    ('G.P. Putnams Sons', 'US', 'https://www.penguinrandomhouse.com', '1838-01-01'),
    ('Random House', 'US', 'https://www.randomhouse.com', '1927-01-01'),
    ('Riverhead Books', 'US', 'https://www.penguinrandomhouse.com', '1994-01-01'),
    ('Warner Books', 'US', 'https://www.hachettebookgroup.com', '1917-01-01'),
    ('Shueisha', 'JP', 'https://www.shueisha.co.jp', '1926-01-01'),
    ('Kodansha', 'JP', 'https://www.kodansha.com', '1909-01-01'),
    ('HarperCollins', 'US', 'https://www.harpercollins.com', '1817-01-01'),
    ('Penguin Classics', 'US', 'https://www.penguinrandomhouse.com', '1944-01-01'),
    ('DAW Books', 'US', 'https://www.dawbooks.com', '1972-01-01'),
    ('Ace Books', 'US', 'https://www.penguinrandomhouse.com', '1952-01-01'),
    ('Scholastic', 'US', 'https://www.scholastic.com', '1920-01-01'),
    ('Harvill Secker', 'UK', 'https://www.harvillsecker.co.uk', '1942-01-01'),
    ('Anchor Books', 'US', 'https://www.penguinrandomhouse.com', '1953-01-01'),
    ('Chilton Books', 'US', 'https://www.chilton.com', '1919-01-01'),
    ('Delacorte Press', 'US', 'www.randomhouse.com', '1928-01-01'),
    ('Archibald Constable & Company', 'UK', 'www.archibaldconstable.co.uk', '1795-01-01'),
    ('Doubleday', 'US', 'www.doubleday.com', '1897-01-01'),
    ('Ballantine Books', 'US', 'www.ballantinebooks.com', '1952-01-01'),
    ('George Allen & Unwin', 'UK', 'www.georgeallenandunwin.com', '1914-01-01'),
    ('Harper & Brothers', 'United States', 'www.harpercollins.com', '1817-01-01');

-- Populate Book Table
INSERT INTO Book (isbn, title, ageRating, edition, totalCopies, inStockCopies, lentCopies, idPublishingCompany, idBookshelf) VALUES
    -- Thriller Section (idSection = 1)
    ('978-0-06-284783-3', 'The Girl with the Dragon Tattoo', 'Adult', '1st Edition', 12, 6, 6, 1, '1L'),
    ('978-0-525-54414-0', 'Gone Girl', 'Adult', '1st Edition', 10, 5, 5, 2, '1F'),
    ('978-0-451-48979-6', 'The Silent Patient', 'Adult', '1st Edition', 8, 4, 4, 3, '1M'),
    ('978-0-307-38789-9', 'The Road', 'Adult', '1st Edition', 10, 7, 3, 1, '1M'),
    ('978-0-385-12167-5', 'The Shining', 'Adult', '2nd Edition', 18, 9, 9, 20, '1K'),

    -- Crime Section (idSection = 2)
    ('978-0-14-303884-5', 'The Godfather', 'Adult', '1st Edition', 15, 7, 8, 4, '2P'),
    ('978-0-06-112241-5', 'In Cold Blood', 'Adult', '1st Edition', 12, 6, 6, 5, '2C'),
    ('978-1-250-08056-3', 'The Girl on the Train', 'Adult', '1st Edition', 10, 5, 5, 6, '2H'),

    -- Romance Section (idSection = 3)
    ('978-0-7352-1000-7', 'Pride and Prejudice', 'Teens', '1st Edition', 8, 4, 4, 11, '3A'),
    ('978-0-14-143951-8', 'Jane Eyre', 'Teens', '1st Edition', 10, 5, 5, 11, '3B'),
    ('978-0-385-54342-0', 'The Notebook', 'Teens', '1st Edition', 7, 3, 4, 7, '3S'),

    -- Manga Section (idSection = 4)
    ('978-1-4215-5242-9', 'Naruto', 'Children', '1st Edition', 20, 10, 10, 8, '4K'),
    ('978-1-4215-8484-2', 'One Piece', 'Children', '1st Edition', 18, 9, 9, 8, '4O'),
    ('978-1-59307-957-3', 'Attack on Titan', 'Teens', '1st Edition', 15, 7, 8, 9, '4I'),

    -- Fantasy Section (idSection = 5)
    ('978-0-618-12902-2', 'The Hobbit', 'Young Adult', '1st Edition', 12, 6, 6, 10, '5T'),
    ('978-0-618-12911-4', 'Harry Potter and the Sorcerers Stone', 'Young Adult', '1st Edition', 20, 10, 10, 14, '5R'),
    ('978-0-345-46452-5', 'The Name of the Wind', 'Young Adult', '1st Edition', 8, 4, 4, 12, '5R'),
    ('978-0-618-00222-8', 'The Lord of the Rings', 'Teens', '50th Anniversary Edition', 25, 20, 5, 21, '5T'),

    -- Science Fiction Section (idSection = 6)
    ('978-0-345-38918-2', 'Dune', 'Adult', '1st Edition', 10, 5, 5, 17, '6H'),
    ('978-0-451-16934-5', 'Neuromancer', 'Adult', '1st Edition', 12, 6, 6, 13, '6G'),
    ('978-1-984-83801-0', 'The Martian', 'Adult', '1st Edition', 15, 7, 8, 2, '6W'),
    ('978-0-385-31208-3', 'Slaughterhouse-Five', 'Adult', '1st Edition', 15, 10, 5, 18, '6V'),
    ('978-0-345-34296-0', 'Fahrenheit 451', 'Teens', '1st Edition', 20, 12, 8, 21, '6B'),

    -- Non-Fiction Section (idSection = 7)
    ('978-0-14-311159-7', 'Sapiens: A Brief History of Humankind', 'Adult', '1st Edition', 10, 5, 5, 15, '7H'),
    ('978-1-59448-264-4', 'Educated', 'Adult', '1st Edition', 8, 4, 4, 5, '7W'),
    ('978-1-250-27616-5', 'Becoming', 'Adult', '1st Edition', 15, 7, 8, 2, '7O'),

    -- Historical Section (idSection = 8)
    ('978-0-7432-7355-3', 'The Diary of a Young Girl', 'Teens', '1st Edition', 10, 5, 5, 16, '8F'),
    ('978-0-7432-7355-4', 'Unbroken', 'Adult', '1st Edition', 15, 7, 8, 5, '8H'),
    ('978-1-4000-3236-1', 'The Wright Brothers', 'Adult', '1st Edition', 12, 6, 6, 1, '8M'),
    ('978-0-141-43970-9', 'Drácula', 'Teens', '3rd Edition', 12, 8, 4, 19, '8S'),
    ('978-0-393-97283-2', 'Moby Dick', 'Adult', '2nd Edition', 14, 6, 8, 24, '8M');

-- Populate Person Table
INSERT INTO Person (firstName, lastName, birthdate, gender, idNumber, nationality) VALUES
    ('Stieg', 'Larsson', '1954-08-15', 'Male', '1234567890', 'SE'),  -- Author 1
    ('Gillian', 'Flynn', '1971-02-24', 'Female', '1234567891', 'US'),  -- Author 2
    ('Alex', 'Michaelides', '1968-06-14', 'Male', '1234567892', 'GB'),  -- Author 3
    ('Mario', 'Puzo', '1920-10-15', 'Male', '1234567893', 'US'),  -- Author 4
    ('Truman', 'Capote', '1924-09-30', 'Male', '1234567894', 'US'),  -- Author 5
    ('Paula', 'Hawkins', '1972-08-26', 'Female', '1234567895', 'GB'),  -- Author 6
    ('Jane', 'Austen', '1775-12-16', 'Female', '1234567896', 'GB'),  -- Author 7
    ('Charlotte', 'Brontë', '1816-04-21', 'Female', '1234567897', 'GB'),  -- Author 8
    ('Nicholas', 'Sparks', '1965-12-31', 'Male', '1234567898', 'US'),  -- Author 9
    ('Masashi', 'Kishimoto', '1974-11-08', 'Male', '1234567899', 'JP'),  -- Author 10
    ('Eiichiro', 'Oda', '1975-01-01', 'Male', '1234567900', 'JP'),  -- Author 11
    ('Hajime', 'Isayama', '1986-08-29', 'Male', '1234567901', 'JP'),  -- Author 12
    ('J.R.R.', 'Tolkien', '1892-01-03', 'Male', '1234567902', 'GB'),  -- Author 13
    ('J.K.', 'Rowling', '1965-07-31', 'Female', '1234567903', 'GB'),  -- Author 14
    ('Patrick', 'Rothfuss', '1973-06-06', 'Male', '1234567904', 'US'),  -- Author 15
    ('Frank', 'Herbert', '1920-10-08', 'Male', '1234567905', 'US'),  -- Author 16
    ('William', 'Gibson', '1948-03-17', 'Male', '1234567906', 'US'),  -- Author 17
    ('Andy', 'Weir', '1972-06-16', 'Male', '1234567907', 'US'),  -- Author 18
    ('Yuval', 'Harari', '1976-02-24', 'Male', '1234567908', 'IL'),  -- Author 19
    ('Tara', 'Westover', '1986-09-27', 'Female', '1234567909', 'US'),  -- Author 20

    -- Patrons (10 patrons)
    ('John', 'Doe', '1990-05-10', 'Male', '9876543210', 'US'),  -- Patron 1
    ('Jane', 'Smith', '1992-11-15', 'Female', '9876543211', 'US'),  -- Patron 2
    ('Robert', 'Brown', '1985-07-19', 'Male', '9876543212', 'GB'),  -- Patron 3
    ('Emily', 'Davis', '1994-03-25', 'Female', '9876543213', 'US'),  -- Patron 4
    ('Michael', 'Wilson', '1991-01-10', 'Male', '9876543214', 'US'),  -- Patron 5
    ('Olivia', 'Martinez', '1993-09-02', 'Female', '9876543215', 'ES'),  -- Patron 6
    ('Sophia', 'Garcia', '1990-12-11', 'Female', '9876543216', 'US'),  -- Patron 7
    ('William', 'Lopez', '1992-08-20', 'Male', '9876543217', 'US'),  -- Patron 8
    ('David', 'Miller', '1989-04-30', 'Male', '9876543218', 'GB'),  -- Patron 9
    ('Ella', 'Wilson', '1996-02-14', 'Female', '9876543219', 'US'),  -- Patron 10

    -- Employees (5 employees)
    ('Thomas', 'Taylor', '1980-04-12', 'Male', '9876543220', 'US'),  -- Employee 1
    ('Jessica', 'Anderson', '1982-10-23', 'Female', '9876543221', 'GB'),  -- Employee 2
    ('Daniel', 'Thomas', '1988-03-04', 'Male', '9876543222', 'US'),  -- Employee 3
    ('Rachel', 'Jackson', '1990-06-10', 'Female', '9876543223', 'US'),  -- Employee 4
    ('Benjamin', 'White', '1975-07-22', 'Male', '9876543224', 'US'),  -- Employee 5

    -- Extra Autors
    ('Kurt', 'Vonnegut', '1922-11-11', 'Male', '9876543225', 'US'),
    ('Cormac', 'McCarthy', '1933-07-20', 'Male', '9876543226', 'US'),
    ('Bram', 'Stoker', '1847-11-08', 'Male', '9876543227', 'IRL'),
    ('Stephen', 'King', '1947-09-21', 'Male', '9876543229', 'US'),
    ('Ray', 'Bradbury', '1920-08-22', 'Male', '9876543230', 'US'),
    ('Herman', 'Melville', '1819-08-01', 'Male', '9876543231', 'US'),
    ('Michelle', 'Obama', '1964-01-17', 'Female', '9876543232', 'US'),
    ('Anne', 'Frank', '1929-06-12', 'Female', '9876543233', 'DE'),
    ('Laura', 'Hilldebrand', '1967-05-15', 'Female', '9876543234', 'US'),
    ('David', 'McCullough', '1933-07-07', 'Male', '9876543235', 'US');



    -- Populate Author Table
INSERT INTO Author (idPerson, biography, pseudonym) VALUES
    (1, 'Stieg Larsson was a Swedish journalist and writer best known for his Millennium series, including The Girl with the Dragon Tattoo.', NULL),  -- Author 1
    (2, 'Gillian Flynn is an American author of psychological thrillers such as Gone Girl.', NULL),  -- Author 2
    (3, 'Alex Michaelides is a British-Cypriot author known for psychological thrillers, including The Silent Patient.', NULL),  -- Author 3
    (4, 'Mario Puzo was an American author best known for writing The Godfather series.', NULL),  -- Author 4
    (5, 'Truman Capote was an American writer best known for In Cold Blood.', NULL),  -- Author 5
    (6, 'Paula Hawkins is a British author best known for The Girl on the Train.', NULL),  -- Author 6
    (7, 'Jane Austen was an English novelist best known for Pride and Prejudice.', NULL),  -- Author 7
    (8, 'Charlotte Brontë was an English novelist and poet, best known for Jane Eyre.', NULL),  -- Author 8
    (9, 'Nicholas Sparks is an American novelist known for romantic fiction such as The Notebook.', NULL),  -- Author 9
    (10, 'Masashi Kishimoto is a Japanese manga artist, best known for creating Naruto.', NULL),  -- Author 10
    (11, 'Eiichiro Oda is a Japanese manga artist, best known for creating One Piece.', NULL),  -- Author 11
    (12, 'Hajime Isayama is a Japanese manga artist, best known for creating Attack on Titan.', NULL),  -- Author 12
    (13, 'J.R.R. Tolkien was an English writer and academic, best known for The Lord of the Rings.', NULL),  -- Author 13
    (14, 'J.K. Rowling is a British author best known for writing the Harry Potter series.', NULL),  -- Author 14
    (15, 'Patrick Rothfuss is an American author, best known for The Kingkiller Chronicle series.', NULL),  -- Author 15
    (16, 'Frank Herbert was an American author, best known for writing the Dune series.', NULL),  -- Author 16
    (17, 'William Gibson is an American-Canadian author best known for pioneering cyberpunk with his novel Neuromancer.', NULL),  -- Author 17
    (18, 'Andy Weir is an American author best known for writing The Martian.', NULL),  -- Author 18
    (19, 'Yuval Noah Harari is an Israeli historian and author, best known for Sapiens: A Brief History of Humankind.', NULL),  -- Author 19
    (20, 'Tara Westover is an American memoirist, best known for Educated.', NULL),  -- Author 20

    -- Extra Authors
    (36, 'Kurt Vonnegut was an American author, best known for his satirical novels such as Slaughterhouse-Five.', NULL),  -- Author 36
    (37, 'Cormac McCarthy was an American author, best known for novels like The Road and No Country for Old Men.', NULL),  -- Author 37
    (38, 'Bram Stoker was an Irish author, best known for writing the Gothic horror novel Dracula.', NULL),  -- Author 38
    (39, 'Stephen King is an American author, widely regarded as the "King of Horror" for works like The Shining and It.', NULL),  -- Author 39
    (40, 'Ray Bradbury was an American author, best known for his dystopian novel Fahrenheit 451.', NULL),  -- Author 40
    (41, 'Herman Melville was an American author, most famous for his novel Moby-Dick.', NULL);  -- Author 41



-- Populate Patron Table (Patrons are persons who are not authors or employees)
INSERT INTO Patron (idPerson, libraryCardNumber, registrationDate) VALUES
    (21, 'PATRON001', '2023-01-10'),  -- Patron 1
    (22, 'PATRON002', '2023-02-05'),  -- Patron 2
    (23, 'PATRON003', '2023-02-15'),  -- Patron 3
    (24, 'PATRON004', '2023-03-25'),  -- Patron 4
    (25, 'PATRON005', '2023-04-10'),  -- Patron 5
    (26, 'PATRON006', '2023-05-01'),  -- Patron 6
    (27, 'PATRON007', '2023-06-13'),  -- Patron 7
    (28, 'PATRON008', '2023-07-05'),  -- Patron 8
    (29, 'PATRON009', '2023-08-20'),  -- Patron 9
    (30, 'PATRON010', '2023-09-10');  -- Patron 10

    -- Populate Employee Table (Employees are persons working at the library)
INSERT INTO Employee (idPerson, employeeNumber, salary, hiredDate) VALUES
    (31, 'EMP001', 30000.00, '2018-06-01'),  -- Employee 1
    (32, 'EMP002', 45000.00, '2019-03-10'),  -- Employee 2
    (33, 'EMP003', 55000.00, '2017-09-15'),  -- Employee 3
    (34, 'EMP004', 38000.00, '2020-01-05'),  -- Employee 4
    (35, 'EMP005', 60000.00, '2015-04-20');  -- Employee 5



-- Populate BookAuthor Table
INSERT INTO BookAuthor (idBook, idPerson) VALUES
    -- Thriller Section
    (1, 1),  -- The Girl with the Dragon Tattoo by Stieg Larsson
    (2, 2),  -- Gone Girl by Gillian Flynn
    (3, 3),  -- The Silent Patient by Alex Michaelides
    (4, 37), -- The Road by Cormac McCarthy
    (5, 39), -- The Shining by Stephen King

    -- Crime Section
    (6, 4),  -- The Godfather by Mario Puzo
    (7, 5),  -- In Cold Blood by Truman Capote
    (8, 6),  -- The Girl on the Train by Paula Hawkins

    -- Romance Section
    (9, 7),  -- Pride and Prejudice by Jane Austen
    (10, 8), -- Jane Eyre by Charlotte Brontë
    (11, 9), -- The Notebook by Nicholas Sparks

    -- Manga Section
    (12, 10), -- Naruto by Masashi Kishimoto
    (13, 11), -- One Piece by Eiichiro Oda
    (14, 12), -- Attack on Titan by Hajime Isayama

    -- Fantasy Section
    (15, 13), -- The Hobbit by J.R.R. Tolkien
    (16, 14), -- Harry Potter and the Sorcerer's Stone by J.K. Rowling
    (17, 15), -- The Name of the Wind by Patrick Rothfuss
    (18, 13), -- The Lord of the Rings by J.R.R. Tolkien

    -- Science Fiction Section
    (19, 16), -- Dune by Frank Herbert
    (20, 17), -- Neuromancer by William Gibson
    (21, 18), -- The Martian by Andy Weir
    (22, 36), -- Slaughterhouse-Five by Kurt Vonnegut
    (23, 40), -- Fahrenheit 451 by Ray Bradbury

    -- Non-Fiction Section
    (24, 19), -- Sapiens: A Brief History of Humankind by Yuval Noah Harari
    (25, 20), -- Educated by Tara Westover
    (26, 42), -- Becoming (no author specified)

    -- Historical Section
    (27, 43), -- The Diary of a Young Girl (no author specified)
    (28, 44), -- Unbroken (no author specified)
    (29, 45), -- The Wright Brothers (no author specified)
    (30, 38),   -- Drácula by Bram Stoker
    (31, 41);   -- Moby Dick by Herman Melville





-- Populate the Requisition table with 2 requisitions per book for 24 books
INSERT INTO Requisition (requisitionDate, returnDate, idPatron, idEmployee) VALUES
    -- Book 1 requisitions
    ('2024-11-01', '2024-11-10', 1, 1),
    ('2024-11-02', '2024-11-12', 2, 2),

    -- Book 2 requisitions
    ('2024-11-03', '2024-11-13', 3, 3),
    ('2024-11-04', '2024-11-14', 4, 4),

    -- Book 3 requisitions
    ('2024-11-05', '2024-11-15', 5, 5),
    ('2024-11-06', '2024-11-16', 6, 1),

    -- Book 4 requisitions
    ('2024-11-07', '2024-11-17', 7, 2),
    ('2024-11-08', '2024-11-18', 8, 3),

    -- Book 5 requisitions
    ('2024-11-09', '2024-11-19', 9, 4),
    ('2024-11-10', '2024-11-20', 10, 5),

    -- Book 6 requisitions
    ('2024-11-11', '2024-11-21', 1, 2),
    ('2024-11-12', '2024-11-22', 2, 3),

    -- Book 7 requisitions
    ('2024-11-13', '2024-11-23', 3, 4),
    ('2024-11-14', '2024-11-24', 4, 5),

    -- Book 8 requisitions
    ('2024-11-15', '2024-11-25', 5, 1),
    ('2024-11-16', '2024-11-26', 6, 2),

    -- Book 9 requisitions
    ('2024-11-17', '2024-11-27', 7, 3),
    ('2024-11-18', '2024-11-28', 8, 4),

    -- Book 10 requisitions
    ('2024-11-19', '2024-11-29', 9, 5),
    ('2024-11-20', '2024-11-30', 10, 1),

    -- Book 11 requisitions
    ('2024-11-21', '2024-12-01', 1, 3),
    ('2024-11-22', '2024-12-02', 2, 4),

    -- Book 12 requisitions
    ('2024-11-23', '2024-12-03', 3, 5),
    ('2024-11-24', '2024-12-04', 4, 1),

    -- Book 13 requisitions
    ('2024-11-25', '2024-12-05', 5, 2),
    ('2024-11-26', '2024-12-06', 6, 3),

    -- Book 14 requisitions
    ('2024-11-27', '2024-12-07', 7, 4),
    ('2024-11-28', '2024-12-08', 8, 5),

    -- Book 15 requisitions
    ('2024-11-29', '2024-12-09', 9, 1),
    ('2024-11-30', '2024-12-10', 10, 2),

    -- Book 16 requisitions
    ('2024-12-01', '2024-12-11', 1, 4),
    ('2024-12-02', '2024-12-12', 2, 5),

    -- Book 17 requisitions
    ('2024-12-03', '2024-12-13', 3, 1),
    ('2024-12-04', '2024-12-14', 4, 2),

    -- Book 18 requisitions
    ('2024-12-05', '2024-12-15', 5, 3),
    ('2024-12-06', '2024-12-16', 6, 4),

    -- Book 19 requisitions
    ('2024-12-07', '2024-12-17', 7, 5),
    ('2024-12-08', '2024-12-18', 8, 1),

    -- Book 20 requisitions
    ('2024-12-09', '2024-12-19', 9, 2),
    ('2024-12-10', '2024-12-20', 10, 3),

    -- Book 21 requisitions
    ('2024-12-11', '2024-12-21', 1, 5),
    ('2024-12-12', '2024-12-22', 2, 1),

    -- Book 22 requisitions
    ('2024-12-13', '2024-12-23', 3, 2),
    ('2024-12-14', '2024-12-24', 4, 3),

    -- Book 23 requisitions
    ('2024-12-15', '2024-12-25', 5, 4),
    ('2024-12-16', '2024-12-26', 6, 5),

    -- Book 24 requisitions
    ('2024-12-17', '2024-12-27', 7, 1),
    ('2024-12-18', '2024-12-28', 8, 2);



-- Requisitions for two books
-- Book 1 and Book 2 share Requisition 1
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (1, 1), (2, 1);

-- Book 3 and Book 4 share Requisition 2
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (3, 2), (4, 2);

-- Book 5 and Book 6 share Requisition 3
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (5, 3), (6, 3);

-- Book 7 and Book 8 share Requisition 4
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (7, 4), (8, 4);

-- Book 9 and Book 10 share Requisition 5
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (9, 5), (10, 5);

-- Book 11 and Book 12 share Requisition 6
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (11, 6), (12, 6);

-- Book 13 and Book 14 share Requisition 7
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (13, 7), (14, 7);

-- Book 15 and Book 16 share Requisition 8
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (15, 8), (16, 8);

-- Book 17 and Book 18 share Requisition 9
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (17, 9), (18, 9);

-- Book 19 and Book 20 share Requisition 10
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (19, 10), (20, 10);

-- Book 21 and Book 22 share Requisition 11
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (21, 11), (22, 11);

-- Book 23 and Book 24 share Requisition 12
INSERT INTO BookRequisition (idBook, idRequisition) VALUES (23, 12), (24, 12);

