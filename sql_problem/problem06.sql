/* SQL 과제 6-1 */
SELECT 
	Department,
	JobLevel,
	JobRole,
	ROUND(AVG(MonthlyIncome),0) AS avg_income,
	ROUND(AVG(PercentSalaryHike), 2) AS avg_hike,
	ROUND(AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100), 0) AS next_monthly_income,
	ROUND((AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100)) * 12, 0) AS next_yearly_income
FROM hr_cate hc 
LEFT JOIN hr_number hn 
	ON hc.EmployeeNumber = hn.EmployeeNumber 
WHERE TRUE
	AND Attrition = 'No'
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3
;

/* SQL 과제 6-2 */
SELECT 
	Department,
	JobLevel,
	JobRole,
	ROUND(AVG(MonthlyIncome),0) AS avg_income,
	ROUND(AVG(PercentSalaryHike), 2) AS avg_hike,
	ROUND(AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100), 0) AS next_monthly_income,
	ROUND((AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100)) * 12, 0) AS next_yearly_income
FROM hr_cate hc 
LEFT JOIN hr_number hn 
	ON hc.EmployeeNumber = hn.EmployeeNumber 
WHERE TRUE
	AND Attrition = 'No'
GROUP BY 1, 2, 3
ORDER BY 7 desc
LIMIT 10
;

/* SQL 과제 6-3 */
SELECT 
	Department,
	JobLevel,
	JobRole,
	ROUND(AVG(MonthlyIncome),0) AS avg_income,
	ROUND(AVG(PercentSalaryHike), 2) AS avg_hike,
	ROUND(AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100), 0) AS next_monthly_income,
	ROUND((AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100)) * 12, 0) AS next_yearly_income
FROM hr_cate hc 
LEFT JOIN hr_number hn 
	ON hc.EmployeeNumber = hn.EmployeeNumber 
WHERE TRUE
	AND Attrition = 'No'
GROUP BY 1, 2, 3
HAVING next_yearly_income BETWEEN 200000 AND 300000
ORDER BY 7 desc
;

/* SQL 과제 6-4 */
SELECT 
	Department,
	JobLevel,
	JobRole,
	ROUND(AVG(MonthlyIncome),0) AS avg_income,
	ROUND(AVG(PercentSalaryHike), 2) AS avg_hike,
	ROUND(AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100), 0) AS next_monthly_income,
	ROUND((AVG(MonthlyIncome) * (1+AVG(PercentSalaryHike)/100)) * 12, 0) AS next_yearly_income
FROM hr_cate hc 
LEFT JOIN hr_number hn 
	ON hc.EmployeeNumber = hn.EmployeeNumber 
WHERE TRUE
	AND Attrition = 'No'
	AND YearsSinceLastPromotion = 0
GROUP BY 1, 2, 3
HAVING next_yearly_income >= 200000
ORDER BY 7 desc
;