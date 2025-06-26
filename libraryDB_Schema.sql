CREATE DATABASE LibraryDB;
USE LibraryDB;

DROP TABLE IF EXISTS Loan
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;
-- Create Author table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);
-- Create Book table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) DEFAULT 'General',
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Create Member table
CREATE TABLE Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

-- Create Loan table
CREATE TABLE Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);
-- Insert authors
INSERT INTO Author (name, bio) VALUES ('J.K. Rowling', 'Writes fantasy novels');
INSERT INTO Author (name, bio) VALUES ('George R.R. Martin', NULL);

-- Insert books
INSERT INTO Book (title, genre, author_id) VALUES ('Harry Potter', 'Fantasy', 1);
INSERT INTO Book (title, genre, author_id) VALUES ('Game of Thrones', 'Fantasy', 2);
INSERT INTO Book (title, author_id) VALUES ('Unknown Book', 1); -- Uses default genre

-- Insert members
INSERT INTO Member (name, email, join_date) VALUES ('Alice', 'alice@example.com', '2024-06-01');
INSERT INTO Member (name, email, join_date) VALUES ('Bob', NULL, '2024-06-02');

-- Insert loan
INSERT INTO Loan (book_id, member_id, loan_date, return_date) VALUES (1, 1, '2024-06-15', NULL);
-- UPDATE example: Update genre of a specific book
UPDATE Book SET genre = 'Mystery' WHERE book_id = 3;

-- UPDATE multiple rows: Update join_date for members before a certain date
SET SQL_SAFE_UPDATES = 0;
UPDATE Member SET join_date = '2024-06-10' WHERE join_date < '2024-06-05';
-- DELETE example: Remove a loan
DELETE FROM Loan WHERE loan_id = 5;

/*Select all columns from the Book table*/
SELECT * FROM Book;

/*Select specific columns: title and genre from Book*/
SELECT title, genre FROM Book;

/*Select members who joined after 2024-06-01*/
SELECT * FROM Member WHERE join_date > '2024-06-01';

/*Select books where genre is Fantasy*/
SELECT * FROM Book WHERE genre = 'Fantasy';

/*Select books with author_id = 1 OR genre = 'Mystery'*/
SELECT * FROM Book WHERE author_id = 1 OR genre = 'Mystery';

/*Select members whose email contains 'example'*/
SELECT * FROM Member WHERE email LIKE '%example%';

 /*Select books with book_id between 1 and 3*/
SELECT * FROM Book WHERE book_id BETWEEN 1 AND 3;

/*Select members ordered by join_data (newest first)*/
SELECT * FROM Member ORDER BY join_date DESC;

/*Select top 2 books (LIMIT)*/
SELECT * FROM Book LIMIT 2;

/*Select members who joined between two dates*/
SELECT * FROM Member WHERE join_date BETWEEN '2024-06-01' and '2024-06-30';














