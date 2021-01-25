<h1 align="center">Pewlett Hackard Analysis</h1>

## Overview
The purpose of this project is to summarize the employee data in various ways to assist with HR decision making process at Pewlett Hackard ("PH") using SQL. There are two major quetions to answer through this exercise:
1. How many employees are retiring by title?
2. How many employees are eligible for the mentorship program?

## Results

### Deliverable 1: The Number of Retiring Employees by Title

* 

![](https://github.com/lu-chang-axonic/School_District_Analysis/blob/main/images/District%20Summary%20Before.PNG)
![](https://github.com/lu-chang-axonic/School_District_Analysis/blob/main/images/District%20Summary%20After.PNG)

### Deliverable 2 The Employees Eligible for the Mentorship Program

*
![](https://github.com/lu-chang-axonic/School_District_Analysis/blob/main/images/THS%20Before.PNG)
![](https://github.com/lu-chang-axonic/School_District_Analysis/blob/main/images/THS%20After.PNG)


## Summary

* Using birthdays that fell between 1/1/1951 and 12/31/1955 to define people who are about to retire, there will be 72,458 roles that need to be filled as the "silver tsunami" begins to make an impact. 
* Using birthdays that fell between 1/1/1965 and 12/31/1965, there are 1,549 current employees people who are eligible to be mentored. This number is dwarfed by the number of retiring employees.

To help shed some more light on the situation, I've used two additional queries to further refine the analysis.

### Select retiring employees with a senior title
Using the following query, I further screened the retiring employees by only including people with titles that indicate a senior level position:
![](https://github.com/lu-chang-axonic/Pewlett-Hackard-Analysis/blob/main/Image/Senior%20Retiring%20Query.PNG)

This resulted in a group of 54,447 retiring senior team members that can potentially be more qualified to serve as a mentor:
![](https://github.com/lu-chang-axonic/Pewlett-Hackard-Analysis/blob/main/Image/Senior%20Retiring.PNG)

### Select mentorship eligible employees with a junior title
Using the following query, I further screened the mentorship eligible employees by only including people with titles that indicate a junior level position:
![](https://github.com/lu-chang-axonic/Pewlett-Hackard-Analysis/blob/main/Image/Junior%20Query.PNG)

This resulted in a group of 734 junior team members that can potentially need more mentoring:
![](https://github.com/lu-chang-axonic/Pewlett-Hackard-Analysis/blob/main/Image/Junior.PNG)
