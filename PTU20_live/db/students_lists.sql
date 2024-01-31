CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE courses (
    id INTEGER KEY,
    course_name VARCHAR(50),
    course_lenght INTEGER(4)
);

CREATE TABLE students_courses (
    id INTEGER PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    course_id INTEGER REFERENCES courses(id)
);

INSERT INTO students(id, name, last_name)
VALUES (1, "Merry", "Jolly");

INSERT INTO students(id, name, last_name)
VALUES (2, "Mark", "Strucker");

INSERT INTO students(id, name, last_name)
VALUES (3, "Gruber", "Couper");

INSERT INTO courses(id, course_name, course_lenght)
VALUES (1, "History of rakes", "400");

INSERT INTO courses(id, course_name, course_lenght)
VALUES (2, "Make your own jar", "250"

SELECT * FROM students, courses;

DROP TABLE st;