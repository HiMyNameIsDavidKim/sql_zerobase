/* SQL 과제 7-1 */
WITH tb AS (
SELECT
	Department,
	JobLevel,
	ROUND(AVG(hn.MonthlyIncome),1) AS avg_income,
	ROUND(LEAD(AVG(hn.MonthlyIncome)) OVER (PARTITION BY Department ORDER BY JobLevel),1) AS next_level_income
FROM hr.hr_cate hc 
LEFT JOIN hr.hr_number hn 
	ON hc.EmployeeNumber = hn.EmployeeNumber 
WHERE TRUE 
	AND Attrition = 'No'
GROUP BY 1, 2
)
SELECT
	*,
	next_level_income - avg_income AS gap,
	ROUND((next_level_income - avg_income) / avg_income * 100, 1) AS increase_rate
FROM tb
;