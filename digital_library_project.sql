-- creating database
CREATE DATABASE library_system;
USE library_system;

-- creating books table
CREATE TABLE library_books (
  Book_Id INT AUTO_INCREMENT PRIMARY KEY,
  Book_Title VARCHAR(100) NOT NULL,
  Author_Name VARCHAR(100) NOT NULL,
  Category VARCHAR(50),
  No_Copies INT DEFAULT 0,
  Added_Date DATE
);

-- creating students table
CREATE TABLE college_students (
  Stud_Id INT AUTO_INCREMENT PRIMARY KEY,
  Stud_Name VARCHAR(100) NOT NULL,
  Mail_Id VARCHAR(120) UNIQUE,
  Join_date DATE,
  Status VARCHAR(20) DEFAULT 'Active'
);

-- creating issued records table
CREATE TABLE issued_records (
  Issue_id INT AUTO_INCREMENT PRIMARY KEY,
  Book_ref_Id INT NOT NULL,
  Stud_ref_Id INT NOT NULL,
  Borrow_Date DATE,
  Return_Date DATE,
  Fined_amount INT DEFAULT 0,
  FOREIGN KEY (Book_ref_Id) REFERENCES library_books(Book_Id),
  FOREIGN KEY (Stud_ref_Id) REFERENCES college_students(Stud_Id)
);

-- -------------------------------
-- inserting books data
INSERT INTO library_books (Book_Title, Author_Name, Category, No_Copies, Added_Date) VALUES
('Machine Learning', 'Suresh Babu', 'Technology', 5, '2024-01-10'),
('Indian Economy', 'Ramesh Singh', 'Economics', 3, '2023-06-15'),
('Data Structures', 'Narasimha', 'Education', 4, '2022-09-20'),
('Deep Learning', 'Ian Goodfellow', 'Technology', 6, '2023-02-15'),
('Operating Systems', 'Galvin', 'Education', 5, '2022-11-10'),
('World Geography', 'Majid Husain', 'Geography', 4, '2021-08-05');

-- inserting students data
INSERT INTO college_students (Stud_Name, Mail_Id, Join_date, Status) VALUES
('Bharath', 'bharath@gmail.com', '2022-05-10', 'Active'),
('Rahul', 'rahul@gmail.com', '2021-03-15', 'Active'),
('Anjali', 'anjali@gmail.com', '2020-01-20', 'Inactive'),
('Kiran', 'kiran123@gmail.com', '2023-07-12', 'Active'),
('Sneha', 'sneha.reddy@gmail.com', '2022-11-05', 'Active');

-- inserting issued records
INSERT INTO issued_records (Book_ref_Id, Stud_ref_Id, Borrow_Date, Return_Date, Fined_amount) VALUES
(1, 1, '2026-03-10', NULL, 0),
(2, 2, '2026-03-18', NULL, 0),
(3, 3, '2026-02-25', NULL, 0),
(4, 4, '2026-04-10', NULL, 0),
(5, 5, '2026-04-12', NULL, 0),
(6, 1, '2026-03-01', '2026-03-05', 0);

-- overdue books query
SELECT cs.Stud_Name, lb.Book_Title, ir.Borrow_Date
FROM issued_records ir, college_students cs, library_books lb
WHERE ir.Stud_ref_Id = cs.Stud_Id
AND ir.Book_ref_Id = lb.Book_Id
AND ir.Return_Date IS NULL
AND DATEDIFF(CURDATE(), ir.Borrow_Date) > 14;

-- popularity of categories
SELECT lb.Category, COUNT(*) AS total_count
FROM issued_records ir, library_books lb
WHERE ir.Book_ref_Id = lb.Book_Id
GROUP BY lb.Category
ORDER BY total_count DESC;

-- updating inactive students
UPDATE college_students
SET Status = 'Inactive'
WHERE Join_date < DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
LIMIT 100;