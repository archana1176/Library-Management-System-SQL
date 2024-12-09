CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(300),
    Contact_no VARCHAR(15));
    

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status CHAR(3),
    Author VARCHAR(100),
    Publisher VARCHAR(100));

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
    
    
-- INSERTING VALUES TO THE TABLES

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '1234567890'),
(2, 102, '456 Elm St', '2345678901'),
(3, 103, '789 Oak St', '3456789012'),
(4, 104, '321 Pine St', '4567890123'),
(5, 105, '654 Maple St', '5678901234'),
(6, 106, '987 Cedar St', '6789012345'),
(7, 107, '159 Birch St', '7890123456'),
(8, 108, '753 Willow St', '8901234567'),
(9, 109, '852 Ash St', '9012345678'),
(10, 110, '963 Cypress St', '0123456789');

SELECT * FROM Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Archana Anil', 'Manager', 60000.00, 1),
(2, 'Bibin Smith', 'Assistant Manager', 50000.00, 2),
(3, 'Charlie Lal', 'Librarian', 45000.00, 3),
(4, 'Dibin Babu', 'Clerk', 35000.00, 4),
(5, 'Irin Davis', 'Librarian', 45000.00, 5),
(6, 'Anto Wilson', 'Clerk', 35000.00, 6),
(7, 'Anuraj Ashok', 'Assistant Manager', 50000.00, 7),
(8, 'Heera Martin', 'Manager', 60000.00, 8),
(9, 'Naveen Narayan', 'Librarian', 45000.00, 9),
(10, 'Rajin Raj', 'Clerk', 35000.00, 10);

SELECT * FROM Employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'The Fellowship of the Ring', 'Fiction', 20.00, 'yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
('978-1-4028-9462-6', 'How India Sees the World', 'Non-Fiction', 32.00, 'no', 'Shyam Saran', 'Juggernaut'),
('978-0-12-374856-0', 'Two Sides of a Coin', 'Fiction', 15.00, 'yes', 'Jay Joshi', 'Pirates'),
('978-0-387-92806-5', 'Silent Spring', 'Science', 30.00, 'no', 'Rachel Carson', 'Houghton Mifflin'),
('978-0-19-852663-6', 'Ambedkar: A Life', 'History', 18.00, 'yes', 'Shashi Tharoor', ' Aleph Book Company'),
('978-3-642-04859-6', 'The Catcher in the Rye', 'Fiction', 25.00, 'yes', 'J.D.Salinger ', '	Little,Brown and Company'),
('978-0-321-56720-0', 'Minor Feelings', 'Non-Fiction', 12.00, 'no', 'Cathy Park Hong.', 'Penguin Random House'),
('978-0-07-149850-2', 'The Emperor of All Maladies', 'Science', 20.00, 'yes', 'Siddhartha Mukherjee', 'Scribner'),
('978-1-59327-584-6', 'As Good As My Word', 'Autobiography', 35.00, 'yes', 'KM Chandrashekhar', 'HarperCollins'),
('978-0-12-374856-1', 'Pride and Prejudice', 'Fiction', 45.00, 'no', 'Jane Austen', 'Thomas Egerton');

SELECT * FROM Books;



INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Tom Hardy', 'Main St', '2021-01-15'),
(2, 'Emma Stone', 'Elm St', '2023-02-20'),
(3, 'John Davis', 'Oak St', '2022-03-10'),
(4, 'June Santhosh', 'Pine St', '2021-04-25'),
(5, 'Michael Baby', 'Maple St', '2023-05-18'),
(6, 'Emily Davis', 'Cedar St', '2023-06-22'),
(7, 'David Anto', 'Birch St', '2021-07-05'),
(8, 'Lisa Anil', 'Willow St', '2023-08-30'),
(9, 'Vishnu Manoj', 'Ash St', '2023-09-14'),
(10, 'Nancy Peter', 'ypress St', '2023-10-03');

SELECT * FROM Customer;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'The Fellowship of the Ring', '2023-01-16', '978-3-16-148410-0'),
(2, 2, 'How India Sees the World', '2023-02-21', '978-1-4028-9462-6'),
(3, 3, 'Two Sides of a Coin', '2023-03-11', '978-0-12-374856-0'),
(4, 4, 'Silent Spring', '2023-04-26', '978-0-387-92806-5'),
(5, 5, 'Ambedkar: A Life', '2023-05-19', '978-0-19-852663-6'),
(6, 6, 'The Catcher in the Rye', '2023-06-23', '978-3-642-04859-6'),
(7, 7, 'Minor Feelings', '2023-07-06', '978-0-321-56720-0'),
(8, 8, 'The Emperor of All Maladies', '2023-06-30', '978-0-07-149850-2'),
(9, 9, 'As Good As My Word', '2023-09-15', '978-1-59327-584-6'),
(10, 10, 'Pride and Prejudice', '2023-10-04', '978-0-12-374856-1');
SELECT * FROM IssueStatus;


-- 1 Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2 List the employee names and their respective salaries in descending order of salary

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3 Retrieve the book titles and the corresponding customers who have issued those books

SELECT Books.Book_title, Customer.Customer_name FROM IssueStatus JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4  Display the total count of books in each category

SELECT Category, COUNT(*) AS Book_Count FROM Books GROUP BY Category;

-- 5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6  List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer.Customer_name FROM Customer LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE Customer.Reg_date < '2022-01-01' AND IssueStatus.Issue_Id IS NULL;

-- 7 Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no;

-- 8 Display the names of customers who have issued books in the month of June 2023

SELECT Customer.Customer_name FROM IssueStatus JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';


-- 9 Retrieve book_title from book table containing history.

SELECT Book_title FROM Books WHERE Category LIKE '%History%';

-- 10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 

SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- 11 Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT Employee.Emp_name, Branch.Branch_address FROM Employee JOIN Branch ON Employee.Emp_Id = Branch.Branch_no;


-- 12  Display the names of customers who have issued books with a rental price higher than Rs. 25

SELECT DISTINCT Customer.Customer_name FROM IssueStatus JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id WHERE Books.Rental_Price > 25;

















    
    
    
    


