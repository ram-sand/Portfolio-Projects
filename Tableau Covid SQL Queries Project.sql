/*

Queries used for Tableau Project

*/


-- 1.

SELECT 
	SUM(new_cases) AS total_cases, 
	SUM(CAST(new_deaths AS int)) AS total_deaths, 
	SUM(CAST(new_deaths AS int))/SUM(New_Cases)*100 AS DeathPercentage
FROM 
	PortfolioProject..CovidDeaths
--WHERE location like '%states%' 
WHERE 
	continent IS NOT NULL
--GROUP BY date
ORDER BY 
	1,2


-- 2.

-- We take these out as they are not included in the above queires and want to stay consistent
-- European Union is part of Europe

SELECT 
	location, 
	SUM(CAST(new_deaths AS int)) AS TotalDeathCount
FROM 
	PortfolioProject..CovidDeaths
WHERE 
	continent IS NULL 
	AND 
	location NOT IN ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY 
	location
ORDER BY 
	TotalDeathCount DESC


-- 3.

SELECT
	location,
	population,
	MAX(total_cases) AS HighestInfectionCount,
	MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM
	PortfolioProject..CovidDeaths
GROUP BY
	location,
	population
ORDER BY 
	PercentPopulationInfected DESC


-- 4.

SELECT 
	location,
	population,
	date,
	MAX(total_cases) AS HighestInfectionCount,
	MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM 
	PortfolioProject..CovidDeaths
GROUP BY
	location,
	population,
	date
ORDER BY PercentPopulationInfected DESC


