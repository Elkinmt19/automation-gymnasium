-- To get all the columns of the table student 
SELECT * FROM `student`;

-- To get specific columns of the table
SELECT `name`, `major`
FROM `student`;

-- To order the results according a specific condition
SELECT `name`, `major`
FROM `student` 
ORDER BY `student_id` ASC; -- Sort the results in ascending order

-- To limit the number of rows of the result 
SELECT `name`, `major`
FROM `student` 
LIMIT 2; -- Limiting the number of rows of the result to 2

-- Using filters in order to get information 
SELECT `name`, `major` 
FROM `student` 
WHERE `student_id` < 2; -- Defining the filter or condition

-- Using the IN key word in order to define a filter
SELECT `name`, `major`
FROM `student`
WHERE `major` IN ('Artificial Intelligent', 'Bacteriology');