--Top 10 earners at the company who work from home/ I used the top 10 syntax instead of limit 10
Select Top 10 Department, Concat_Full_Name, Salary, Performance_Score, Remote_work from dbo.['Messy_Employee_dataset (2)$']
where Remote_Work= 'Yes'
order by Salary Desc 

Select * from ['Messy_Employee_dataset (2)$']

Select join_Date, convert(Date, Join_Date) from ['Messy_Employee_dataset (2)$']

Update ['Messy_Employee_dataset (2)$']
Set Join_Date = convert(Date, Join_Date)

Alter table ['Messy_Employee_dataset (2)$'] --Added a new column called Join_Employee_Date
Add Join_Employee_Date Date

Update ['Messy_Employee_dataset (2)$']--Added values to the column Join_Employee_Date
Set Join_Employee_Date = convert(Date, Join_Date)

Alter table ['Messy_Employee_dataset (2)$']--Dropped unnecessary columns such as Join_DATE, Column1, and Column2
Drop Column Join_Date, Column1, Column2


---Changed data_type of Remote_Work from int to varchar
Alter Table ['Messy_Employee_dataset (2)$']
Alter Column Remote_Work VARCHAR(5)

---Updated the Remote_work column to Yes and No
Update ['Messy_Employee_dataset (2)$']
Set Remote_Work= Case when Remote_Work = '1' then 'Yes'
when Remote_Work = '0' then 'No'
else Remote_Work
end



--Top 10 earners who work onsite 
Select TOP 10 Department, Concat_Full_Name, Salary, Performance_Score, remote_work from ['Messy_Employee_dataset (2)$']
where Remote_Work='No'
order by Salary DESC

--Top 10 earners who perform poorly
Select TOP 10 Department, Concat_Full_Name, Salary, Performance_Score from ['Messy_Employee_dataset (2)$']
where Performance_Score='poor'
order by Salary DESC

--Group by(Salary does not influence performance)
Select performance_score, Avg(Salary) as Average_Salary from ['Messy_Employee_dataset (2)$']
group by Performance_Score

Select Distinct Department, count(Performance_Score) from ['Messy_Employee_dataset (2)$']
group by Department

--number of employees that work at home grouped by performance score
Select Performance_Score, count(Employee_ID) as Work_@Home from ['Messy_Employee_dataset (2)$']
Where Remote_work = 'Yes'
group by Performance_score

--number of employees that work at the office grouped by performance score
Select Performance_Score, count(Employee_ID) as Office_Employees from ['Messy_Employee_dataset (2)$']
Where Remote_work = 'No'
group by Performance_score

----Characteristics of a high performance employee. Average Age, Average Salary
Select avg(age) as Avg_Age from ['Messy_Employee_dataset (2)$']
where Performance_Score='Excellent'

---Number of high-performing employees based on remote
Select Remote_Work, count(Employee_ID) HighPerformingEmployees from ['Messy_Employee_dataset (2)$']
where Performance_Score = 'Excellent'
group by Remote_work

---Average salary per performance
Select Performance_score, Avg(Salary) as Average_Salary, Avg(Age) as Average_Age from ['Messy_Employee_dataset (2)$']
group by Performance_Score

--Number of best performing employees based on departments
Select Department, count(Employee_ID) as Employee_Count from ['Messy_Employee_dataset (2)$']
where Performance_Score = 'Excellent'
group by Department

--New York has the highest No.Employees that perform Excellent
Select Region, count(Employee_ID) as Employee_Count from ['Messy_Employee_dataset (2)$']
where Performance_Score = 'Excellent'
group by Region
