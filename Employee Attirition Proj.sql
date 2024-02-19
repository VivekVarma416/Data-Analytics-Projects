-- Databricks notebook source
-- MAGIC %md
-- MAGIC **Employee Attrition Problem Project**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Employees are the backbone of the organization. Organization's performance is heavily based on the quality of the employees
-- MAGIC
-- MAGIC Challenges that an organization has to face due to employee attrition are:
-- MAGIC 1. Expensive in terms of both money and time to train new employees.
-- MAGIC 2. Loss of experienced employees
-- MAGIC 3. Impact in productivity
-- MAGIC 4. Impact in profit
-- MAGIC
-- MAGIC Business questions to brainstorm:
-- MAGIC 1. What factors are contributing more to employee attrition?
-- MAGIC 2. What type of measures should the company take in order to retain their employees?

-- COMMAND ----------

Select * from employee_attrition_2;

-- COMMAND ----------

-- DBTITLE 1,Total Employee Count
select count(*)
from employee_attrition;

-- COMMAND ----------

-- DBTITLE 1,Find Out Attrition Division
select count(EmployeeCount), Attrition
from employee_attrition
group by 2;

-- COMMAND ----------

-- DBTITLE 1,Age Analysis -Lets findout what age groups' attrition rates are high (20-25, 26-32, 33-40, 40+)
select Sum(EmployeeCount), 

Case when age between 20 and 25 then '20-25'
when age between 26 and 32 then '26-32'
when age between 33 and 40 then '33-40'
Else '40+'
end age_group

from employee_attrition
where Attrition='Yes'
group by 2
order by 2;

-- COMMAND ----------

-- DBTITLE 1,Attrition by Department
select Sum(EmployeeCount),Department
from employee_attrition
where Attrition='Yes'
group by Department;

-- COMMAND ----------

-- DBTITLE 1,Attrition by Education - 1-Below colege, 2-College, 3-Bachelor,4- Master, 5-Doctor
select Sum(EmployeeCount),

Case when Education=1 then'Below College'
when Education=2 then'College'    
when Education=3 then'Bachelor'
when Education=4 then'Master'
Else 'Doctor'

end Edu_level

from employee_attrition
where Attrition='Yes'
group by Education;

-- COMMAND ----------

-- DBTITLE 1,Attrition by environment satisfaction
select Sum(EmployeeCount),

Case when EnvironmentSatisfaction=1 then'Low'
when EnvironmentSatisfaction=2 then'medium'    
when EnvironmentSatisfaction=3 then'satisfied'

Else 'Very satisfied'

end EnvSat_level

from employee_attrition
where Attrition='Yes'
group by EnvironmentSatisfaction;

-- COMMAND ----------

-- DBTITLE 1,Attrition by Job satisfaction
select Sum(EmployeeCount),

Case when JobSatisfaction=1 then'Low'
when JobSatisfaction=2 then'medium'    
when JobSatisfaction=3 then'satisfied'

Else 'Very satisfied'

end EnvSat_level

from employee_attrition
where Attrition='Yes'
group by JobSatisfaction;

-- COMMAND ----------

-- DBTITLE 1,Attrition by travel
select Sum(EmployeeCount),BusinessTravel
from employee_attrition
where Attrition='Yes'
group by 2;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Insight we got from the Analysis
-- MAGIC
-- MAGIC 1. Employees of age group 26-32 are mostly leaving the organisation
-- MAGIC 2. People of Research and Develoment departments are leaving from the organisation
-- MAGIC 3. 41.8% of people who left the organisation are having a bachelors degree as highest education
-- MAGIC 4. 72 employees who are not satisfied with environment/location had left the organisation
-- MAGIC 5. 156 employees travelling rarely left org
