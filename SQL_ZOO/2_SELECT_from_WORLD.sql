-- 1.Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000;

-- 2.Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name,(GDP/population)FROM world
WHERE population >= 200000000;

-- 3.Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
select name,population/1000000 from world where continent='South America';

-- 4.Show the name and population for France, Germany, Italy
select name , population from world where name='France' or name= 'Germany' or name= 'Italy';

-- 5.Show the countries which have a name that includes the word 'United'
select name from world where name like'%United%'

-- 6.Show the countries that are big by area or big by population. Show name, population and area.
select name,population,area from world where area>3000000 or population > 250000000;

-- 7.Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
select name,population,area from world where area>3000000 xor population>250000000;

-- 8.Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
-- For Americas show population in millions and GDP in billions both to 2 decimal places.
select name,ROUND(population/1000000.0,2),ROUND(gdp/1000000000.0,2) from world where continent='South America';

-- 9.Show per-capita GDP for the trillion dollar countries to the nearest $1000.
select name,round(GDP/population,-3) from world where GDP>=1000000000000;

-- 10.Show the name and capital where the name and the capital have the same number of characters.
SELECT name,capital
  FROM world
 WHERE length(name)=length(capital);

-- 11.Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name,capital
FROM world where left(name,1)=left(capital,1) and name<>capital;

-- 12.Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%' and name LIKE '%e%' and name LIKE '%i%' and name LIKE '%o%' and name LIKE '%u%'   and name not like'% %';
