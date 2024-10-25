/* SQL 과제 5-1 */
SELECT
	EmployeeNumber
FROM hr_employee_attrition hea 
WHERE TRUE 
	AND YearsAtCompany >= 5
	AND Attrition = 'No'
	AND YearsAtCompany = YearsInCurrentRole 
	AND YearsSinceLastPromotion >= 1
;

/* SQL 과제 5-2 */
SELECT
	Department, 
	JobRole, 
	JobLevel,
	COUNT(DISTINCT EmployeeNumber) 
FROM hr_employee_attrition hea 
WHERE TRUE 
	AND YearsAtCompany >= 5
	AND Attrition = 'No'
	AND YearsAtCompany = YearsInCurrentRole 
	AND YearsSinceLastPromotion >= 1
GROUP BY 1, 2, 3
ORDER BY 3 DESC 
;
