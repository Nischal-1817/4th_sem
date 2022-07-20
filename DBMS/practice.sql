show databases;
use iiit;
CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULL
);
-- insert some values
INSERT INTO students VALUES (1, 'Ryan', 'M');
INSERT INTO students VALUES (2, 'Joanna', 'F');
INSERT INTO students VALUES (3, 'Joanna', 'F');
INSERT INTO students VALUES (4, 'Joanna', 'F');
INSERT INTO students VALUES (5, 'Joanna', 'F');
-- fetch some values
select * from students;
SELECT id from students where name like 'R[yz]an';