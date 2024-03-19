create database Library;
use library;

-- 1. Creating Branch Table
create table Branch(
Branch_no int unique PRIMARY KEY ,
Manager_Id int unique,
Branch_address varchar(45),
Contact_no bigint check (contact_no between 1111111111 and 9999999999));

insert into Branch values
(1256, 6001,'Central Road - Kochi', 9952354656),
(2256, 6002, 'Main Street - Kozhikode', 9563263678),
(3256, 6003, 'Beach Road - Trivandrum', 9984965265),
(4256, 6004, 'Market Road - Palakkad', 9785854875),
(5256, 6005, 'Hilltop Drive - Wayanad', 8126265586),
(6256, 6006, 'River View Road - Thrissur', 8656495627),
(7256, 6007, 'Port Road - Kannur', 8129567448),
(8256, 6008, 'Valley Road - Idukki', 8256401178),
(9256, 6009, 'Main Ave - Kollam', 8129295770);

select * from Branch;

-- 2. Creating Employee Table
create table Employee(
Emp_Id int unique PRIMARY KEY, 
Emp_name varchar(30) not null,
Position varchar(30),
Salary int,
Branch_no int,
foreign key(Branch_no) references Branch(Branch_no) on delete cascade);

insert into Employee values
(1101, 'Anjali Krishna', 'Manager', 65000, 1256),
(1102, 'Rohan Nair', 'Assistant Manager', 55000, 2256),
(1103, 'Lakshmi Priya', 'Library Technician', 20000, 3256),
(1104, 'Arjun Menon', 'Library Assistant', 18000, 4256),
(1105, 'Sunita George', 'Cataloguer', 22000, 5256),
(1106, 'Vishnu Pillai', 'Accountant', 52000, 6256),
(1107, 'Priyanka Iyer', 'Assistant Librarian', 42000, 7256),
(1108, 'Kiran Varma', 'Library Technician', 20000, 8256),
(1109, 'Geetha Kumari', 'Library Assistant', 48000, 9256),
(1110, 'Mohammed Anwar', 'Clerk', 22000, 1256);

select * from Employee;

-- 3. Creating Books Table
create table Books( 
ISBN bigint PRIMARY KEY,
Book_title varchar(100),
Category varchar(50),
Rental_Price int,
Status enum('Yes' , 'No') default 'Yes',
Author Varchar(40),
Publisher varchar(100));

insert into Books values
(9788171300100, 'Khasakkinte Ithihasam', 'Fiction', 150, 'Yes', 'O.V. Vijayan', 'DC Books'),
(9788171303583, 'Chemmeen', 'Romance', 130, 'Yes', 'Thakazhi Sivasankara Pillai', 'DC Books'),
(9788126415885, 'Aadujeevitham', 'Drama', 120, 'Yes', 'Benyamin', 'Green Books'),
(9788122610839, 'Naalukettu', 'Classic', 140, 'Yes', 'M.T. Vasudevan Nair', 'Current Books'),
(9788184233177, 'Manju', 'Fiction', 110, 'No', 'M.T. Vasudevan Nair', 'H & C Publishing House'),
(9789386224585, 'The God of Small Things', 'Fiction', 160, 'No', 'Arundhati Roy', 'Penguin Books'),
(9788126438884, 'Ente Katha', 'Autobiography', 130, 'Yes', 'Kamala Surayya', 'DC Books'),
(9788126479085, 'Oru Desathinte Katha', 'Fiction', 115, 'Yes', 'S.K. Pottekkatt', 'DC Books'),
(9788122615797, 'Randamoozham', 'Mythology', 180, 'No', 'M.T. Vasudevan Nair', 'Current Books'),
(9788126403395, 'Aarachar', 'Historical Fiction', 200, 'Yes', 'K.R. Meera', 'DC Books');

select * from Books;


-- 4. Creating Customer Table
create table Customer(
Customer_Id int unique PRIMARY KEY,
Customer_name varchar(30) not null,
Customer_address varchar(40),
Reg_date date);

insert into Customer values
(1, 'Anju Mohan', 'Malappuram, Kerala', '2023-01-15'),
(2, 'Rahul Raj', 'Kochi, Kerala', '2023-02-20'),
(3, 'Sneha Pillai', 'Kozhikode, Kerala', '2023-03-10'),
(4, 'Arun Dev', 'Kannur, Kerala', '2021-05-01'),
(5, 'Lakshmi Nair', 'Palakkad, Kerala', '2023-05-25'),
(6, 'Vishnu Prasad', 'Thrissur, Kerala', '2023-06-15'),
(7, 'Anita Dinesh', 'Kochi, Kerala', '2021-08-06'),
(8, 'Sajith Kumar', 'Alappuzha, Kerala', '2023-08-30'),
(9, 'Neethu Suresh', 'Kochi, Kerala', '2023-09-12'),
(10, 'Akhil Menon', 'Kozhikode, Kerala', '2023-10-05');

select* from Customer;


-- 5. Creating IssueStatus Table
create table IssueStatus(
Issue_Id int not null PRIMARY KEY,
Issued_cust int,
Issued_book_name varchar(100),
Issue_date date,
Isbn_book bigint,
foreign key (Issued_cust) references Customer(Customer_id),
foreign key (Isbn_book) references Books(ISBN));

insert into IssueStatus values
(0001, 3, 'Chemmeen', '2024-03-05', 9788171303583),
(0002, 9, 'Ente Katha', '2024-03-06', 9788126438884),
(0003, 5, 'Khasakkinte Ithihasam', '2024-02-28', 9788171300100),
(0004, 2, 'Aarachar', '2024-03-05', 9788126403395),
(0005, 6, 'Chemmeen', '2023-06-10', 9788171303583);

select * from IssueStatus;


-- 6. Creating ReturnStatus Table
create table ReturnStatus(
Return_Id int not null PRIMARY KEY,
Return_cust int,
Return_book_name varchar(100),
Return_date date,
Isbn_book2 bigint,
foreign key (Isbn_book2) references Books(ISBN));

insert into ReturnStatus values
(01, 3, 'Chemmeen', '2024-03-07', 9788171303583),
(02, 9, 'Ente Katha', '2024-03-07', 9788126438884),
(03, 5, 'Khasakkinte Ithihasam', '2024-02-28', 9788171300100);

select * from ReturnStatus;


-- 1. Retrieve the book title, category, and rental price of all available books.
select Book_title, Category, Rental_Price from books where Status = 'Yes';


-- 2. List the employee names and their respective salaries in descending order of salary.
select Emp_Name, Salary from Employee order by salary desc;


-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
select b.Book_title, c.Customer_Name from Books b 
join IssueStatus i on b.isbn = i.Isbn_book
join Customer c on i.issued_cust = c.customer_Id;

-- 4. Display the total count of books in each category.
select Category, count(Category) as 'No Of Books' from Books group by Category;


-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_Name, Position from Employee where Salary > 50000;


-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_Name from Customer where Reg_date < '2022-01-01' and
customer_id not in(select issued_cust from IssueStatus);


-- 7. Display the branch numbers and the total count of employees in each branch.
select Branch_no, count(*) as 'No Of Employee' from Employee group by Branch_no;


-- 8. Display the names of customers who have issued books in the month of June 2023.
select C.Customer_Name from customer C join IssueStatus i on c.Customer_id = i.issued_cust 
where monthname(Issue_date) = 'June' and year(Issue_date) = 2023;


-- 9. Retrieve book_title from book table containing history.
select Book_Title, Category from Books where Category Like 'Histor%';


-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select Branch_No from Employee where Branch_No in 
(select Branch_No From Employee group by Branch_No having count(*)>5);
