Create table Departments(
    Did varchar(1) not null primary key,
    Name varchar(20) not null,
    dateFormed Date
);

--People table
Create table People(
    pid int not null,
    firstName varchar(20),
    lastName varchar(20),
    hireDate Date MM/DD/YYYY,
    Did Varchar(1) not null references Departments(Did),
   primary key(pid)
);

--FY
Create table FY(
    year int not null,
    start Date,
    endDate Date,
   primary key(year)
);

--Insert Departments
INSERT INTO Departments( Did, Name, dateFormed )
  VALUES('A', 'CS', '6/30/2010');
  
INSERT INTO Departments( Did, Name, dateFormed )
  VALUES('B', 'IT', '1/1/2013');

INSERT INTO Departments( Did, name, dateFormed )
  VALUES('C', 'IS', '7/4/2014');

--Insert People
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(1, 'John', 'Doe', '1/23/2008', 'A');
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(2, 'Nikol', 'P', '9/28/2006', 'A');
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(3, 'Jason', 'Todd', '4/4/2012', 'B');
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(4, 'Tim', 'Drake', '11/11/2013', 'B');
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(5, 'Bruce', 'Wayne', '11/11/2014', 'B');
  
--Insert Fiscal Year
INSERT INTO FY( year, start, endDate )
  VALUES(2012, '7/1/11', '6/30/2012');
INSERT INTO FY( year, start, endDate )
  VALUES(2013, '7/1/12', '6/30/2013');
INSERT INTO FY( year, start, endDate )
  VALUES(2014, '7/1/13', '6/30/2014');
INSERT INTO FY( year, start, endDate )
  VALUES(2015, '7/1/14', '6/30/2015');
  
  
--Queries
--List all people, Fiscal year in which they they were hired, and department
--List all department names and the number of people in each.
--List all Fyears and the number of people hired in that time span
--list all Fyears and the number of departments founded in that time span
--List all departments with no people
--List all people with no departments
--List all peopel hired before department was founded.
  
  
  
