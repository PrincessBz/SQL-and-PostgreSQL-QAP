// CREATE TABLES :

CREATE TABLE students (
     student_id SERIAL PRIMARY KEY,
	 first_name TEXT,
	 last_name TEXT,
	 email TEXT,
	 school_enrollment_date DATE
);

CREATE TABLE professors (
    professor_id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	department TEXT
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
	course_name TEXT,
	course_description TEXT,
	professor_id INT REFERENCES professors(professor_id)
);

CREATE TABLE enrollments (
    student_id INT REFERENCES students(student_id),
	course_id INT REFERENCES courses(course_id),
	enrollment_date DATE,
	PRIMARY KEY (student_id, course_id)
	
);

// INSERTING DATA:

INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES
('John', 'Doe', 'john.doe@example.com', '2022-08-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2021-09-01'),
('Michael', 'Brown', 'michael.brown@example.com', '2023-01-10'),
('Emily', 'Davis', 'emily.davis@example.com', '2024-05-20'),
('Chris', 'Wilson', 'chris.wilson@example.com', '2022-11-03');

INSERT INTO professors (first_name, last_name, department)
VALUES
('Alan', 'Turing', 'Computer Science'),
('Marie', 'Curie', 'Physics'),
('Isaac', 'Newton', 'History'),
('Ada', 'Lovelace', 'Literature');

INSERT INTO courses (course_name, course_description, professor_id)
VALUES
('Physics 101', 'Introduction to Physics', 2),
('Computer science 101', 'Introduction to Computer Science', (SELECT professor_id FROM professors WHERE department = 'Computer Science' )),
('History 101', 'A Survey of Historical Events', 3),
('Literature 201', 'Basics of World Literature', (SELECT professor_id FROM professors WHERE department = 'Literature'));

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2024-09-01'),
(2, 1, '2024-09-02'),
(3, 2, '2024-09-02'),
(4, 3, '2024-09-01'),
(5, 2, '2024-09-03');

// Tasks
SQL QUERY :
- Retrieve the full names (by full name we mean the first name and last name joined into one column, separated by a space) of all students enrolled in “Physics 101”.

SELECT first_name || ' ' || last_name AS full_name FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON courses.course_id = enrollments.course_id
WHERE courses.course_name = 'Physics 101';

- Retrieve a list of all courses along with the professor’s full name who teaches each course.

SELECT course_name, professors.first_name || ' ' || professors.last_name AS full_name
FROM courses
JOIN professors ON professors.professor_id = courses.professor_id;

- Retrieve all courses that have students enrolled in them.

SELECT course_name
From courses
JOIN enrollments ON courses.course_id = enrollments.course_id

UPDATE DATA:

UPDATE students
SET email = 'john.d.newemail@example.com'
WHERE first_name = 'John' AND last_name = 'Doe';

DELETE DATA:

DELETE FROM enrollments
WHERE student_id = (SELECT student_id FROM students WHERE first_name = 'John' AND last_name = 'Doe')
AND course_id = (SELECT course_id FROM courses WHERE course_name = 'Physics 101');







