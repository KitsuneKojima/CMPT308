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
    hireDate Date,
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
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(1, 'John', 'Doe', '1/21/2008', 'A');

--Insert People
INSERT INTO People( pid, firstName, lastName, HireDate, Did )
  VALUES(1, 'John', 'Doe', '1/21/2008', 'A');