-- 1.List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world where (gdp/population)>(select (gdp/population) from world where name='United Kingdom') and continent='Europe';

-- 3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
select name,continent from world where continent in (select continent from world where name='Argentina' or name='Australia') order by name; 

-- 4.Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
select name,population from world where population>(select population from world where name='United Kingdom') and population<(select population from world where name='Germany');

-- 5.Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
select name , concat(round(population/(select population from world where name='Germany')*100),'%') as percentage from world where continent='Europe';

-- 6.Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
select name from world where gdp > all (select gdp from world where continent='Europe' and gdp is not null) ;

-- 7.Find the largest country (by area) in each continent, show the continent, the name and the area:
select continent ,name,area from world w where area=(select max(area) from world where world.continent=w.continent);

-- 8.List each continent and the name of the country that comes first alphabetically.
select continent,name from world w where name=(select name from world where w.continent=world.continent order by name limit 1) ;

-- 9.Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
select name, continent,population from world where continent in(select continent from world group by continent having max(population)<=25000000);

-- 10.Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
select name , continent from world w where population > 3* (select max(population) from world where continent=w.continent and name<>w.name) ;
