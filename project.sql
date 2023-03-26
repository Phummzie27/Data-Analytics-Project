SELECT * FROM `still-cipher-378618.sqlnewproject.Lifeexpectancy2`;

-- Retrieve the total number of adult mortality, infant death, hepatitis B AND measles between 2010 to 2015.
SELECT DISTINCT Year, SUM(Adult_Mortality) AS TotalAdultMortality,
SUM(Infant_deaths) AS TotalInfant_deaths,SUM(Hepatitis_B) AS TotalHepatitisB, SUM(Measles_) AS TotalMeasles,
FROM `still-cipher-378618.sqlnewproject.Lifeexpectancy`
WHERE Year BETWEEN 2010 AND 2015
GROUP BY 1
ORDER BY 1 Asc;

--Calculate the average population by country for the period 2010
SELECT Year, ROUND(AVG(_Population_), 2) AS Averagepopulation 
FROM `still-cipher-378618.sqlnewproject.Lifeexpectancy2`
WHERE Year BETWEEN 2000 AND 2015
GROUP BY 1
ORDER BY 1, 2 Asc;

--Calculate the average life expectancy for the country for the period
SELECT DISTINCT Year, Country, AVG(Life_expectancy_) AS Averagelifeexpectancy
FROM `still-cipher-378618.sqlnewproject.Lifeexpectancy2`
GROUP BY 1, 2;

--Determine the total espenditure for country by year and status
SELECT DISTINCT COUNTRY, Year, STATUS, Total_expenditure 
FROM `still-cipher-378618.sqlnewproject.Lifeexpectancy2`
WHERE YEAR >= 2010;

--Calculate total expenditure for country Nigeria for the year
SELECT Year, Country, Sum(Total_expenditure) AS Totalexpenditure
from `still-cipher-378618.sqlnewproject.Lifeexpectancy2`
WHERE COUNTRY Like 'Nigeria'
GROUP BY 1, 2
ORDER BY 3 Desc;

--Retrieve the developed country in the table with GDP value
SELECT DISTINCT COUNTRY,Year, STATUS, GDP 
FROM `still-cipher-378618.sqlnewproject.Lifeexpectancy2`
WHERE STATUS LIKE 'Developed';

--Categorise Similar life expectancy into same bucket
SELECT Year, Country, Life_expectancy_,
CASE
WHEN Life_expectancy_ > 70 THEN 'Ripe Age'
WHEN Life_expectancy_ < 70 THEN 'Early death'
ELSE 'Other'
END Lifeexpectancybucket
from `still-cipher-378618.sqlnewproject.Lifeexpectancy2`;
