# Pewlett-Hackard-Analysis

## Overview of the analysis

The objective of this analysis is to help Pewlett Hackard company, which has thousands of employees and has been in business for a long time. Many employees of the baby boomer generation will soon reach the retirement, leaving thousands of jobs available "silver tsunami".

The database we have consists of 6 files in CSV that we will organize in SQL using the pgAdmin program. It is necessary for the company to identify the profile and number of people close to retirement.

For this specific challenge, we seek to determine the number of employees to retire by title, as well as to choose the employees who are eligible to participate in a mentoring program.

## Pewlett-Hackard Results

1) The Number of Retiring Employees by Title

<img src="https://github.com/Jponce25/Pewlett-Hackard-Analysis/blob/d86d3e040489157f628e1d856172449172add9b1/Images/1.png" width="290">

- According to the data, almost a third of all employees (90,398 of 300,024) will be retiring soon.

- On the other hand, most of the employees close to retirement occupy positions of senior engineer or senior staff, these position have a great importance maximizing efficiency, productivity and performance in the company.

2) Analysis of the number of employees eligible to participate in a new mentorship program

![](https://github.com/Jponce25/Pewlett-Hackard-Analysis/blob/d86d3e040489157f628e1d856172449172add9b1/Images/2.png)

The data presented in this way does not tell us much, so we perform a transformation using the count funtion by tittle.

<img src="https://github.com/Jponce25/Pewlett-Hackard-Analysis/blob/d86d3e040489157f628e1d856172449172add9b1/Images/3.png" width="190">

- There are only 1,549 candidates for the mentoring program, this represents only 1.7% of the total number of people close to retirement.

- There are only 169 candidates for the mentoring program for the position of senior engineer, and this position is the one with the largest number of people close to retirement.

## Pewlett-Hackard Summary

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

We can perform a query to get the total number of employees who are about to retire.

```
SELECT SUM(count) as employees_to_be_filled 
FROM retiring_titles;
```

![](https://github.com/Jponce25/Pewlett-Hackard-Analysis/blob/d86d3e040489157f628e1d856172449172add9b1/Images/4.png)

We can see that there is a total of 90,398 positions that should be filled.

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Performing a query on our mentorship_eligibility table we can get de number of retirement-ready employees by departments to mentor the next generation.

```
SELECT COUNT(first_name),title 
INTO cuentatitle_table
FROM mentorship_eligibilty
GROUP BY title
ORDER BY count DESC;

SELECT * FROM cuentatitle_table;
```

![](https://github.com/Jponce25/Pewlett-Hackard-Analysis/blob/d86d3e040489157f628e1d856172449172add9b1/Images/5.png)

Also, we can get the number of the total available mentors. 

```
SELECT SUM(COUNT) as total
FROM cuentatitle_table;
```

![](https://github.com/Jponce25/Pewlett-Hackard-Analysis/blob/d86d3e040489157f628e1d856172449172add9b1/Images/6.png)

There are very few candidates (1,549) to mentor each position in the company. According to the results, each mentor would need to have approximately 58 candidates to fill the total of positions (90,398).