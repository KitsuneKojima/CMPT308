CREATE Table students 
(
   sid character(3) NOT NULL primary key,
   name varchar(16)
)

INSERT INTO students (sid, name)
   VALUES ('s01', 'Simon');

INSERT INTO students (sid, name)
   VALUES ('s02', 'Alvin');
   
INSERT INTO students (sid, name)
   VALUES ('s03', 'Theo');

INSERT INTO students (sid, name)
   VALUES ('s04', 'Brittany');

INSERT INTO students (sid, name)
   VALUES ('s05', 'Janette');

INSERT INTO students (sid, name)
   VALUES ('s06', 'Elenore');

INSERT INTO students (sid, name)
   VALUES ('s07', 'Stu');


--teachers
CREATE TABLE teachers
(
   tid character(3) NOT NULL primary key,
   name varchar(25)
)

INSERT INTO teachers (tid, name)
   Values ('t01', 'Washington');

INSERT INTO teachers (tid, name)
   VALUES ('t02', 'Adams');

INSERT INTO teachers (tid, name)
   VALUES ('t03', 'Jefferson');

INSERT INTO teachers (tid, name)
   VALUES ('t04', 'Lincoln');
   
--Subjects
CREATE TABLE subjects
(
   subid char(4) NOT NULL primary key,
   name varchar(25)
)

INSERT INTO subjects (subid, name)
   VALUES ('sb01', 'History');

INSERT INTO subjects (subid, name)
   VALUES ('sb02', 'Biology');

INSERT INTO subjects (subid, name)
   VALUES ('sb03', 'SF');
   
--grades
CREATE TABLE grades
(
    gid char(3) NOT NULL primary key,
    sid character(3) NOT NULL references students(sid),
    subid character(4) NOT NULL references subjects(sbid),
    tid character(3) NOT NULL references teachers(tid),
    grades varchar(5)
)

INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g01', 's01', 'sb01', 't02', 'A');
   
INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g02', 's01', 'sb02', 't02', 'B');
   
INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g03', 's07', 'sb03', 't04', 'C++');

INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g04', 's07', 'sb02', 't03', 'F');
   
INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g05', 's06', 'sb01', 't02', 'B+');

INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g06', 's02', 'sb03', 't04', 'C');

INSERT INTO grades (gid, sid, subid, tid, grades)
   VALUES ('g07', 's03', 'sb03', 't04', 'B');   
  
--All students in alpha order
SELECT *
FROM students
ORDER BY name
--Names of studemts who have Adams for any classes
--SELECT grades.name
--FROM grades, teachers
--WHERE teachers.tid = grades.tid 
--   AND teachers.name = 'Adams'
--   AND students.sid = grades.sid
--Name teachers who have taught Biology
--Name teachers who do not teach
--Name students who have taken no classes
--Name of students in same class, and class name

   
   