-- SQL Zoo: SELECT Basics
-- My answers for SELECT Basics section

-- Q1: Show the population of Germany
SELECT population
FROM world
WHERE name = 'Germany';

-- Q2: Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway','Denmark');

-- Q3: show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
