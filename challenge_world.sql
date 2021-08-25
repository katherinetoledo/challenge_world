USE world;
SHOW TABLES;
DESCRIBE country;
DESCRIBE city;

#1-Using COUNT, get the number of cities in the USA.
SELECT COUNT(ID) FROM city WHERE CountryCode = 'USA';

#2-Find out the population and life expectancy for people in Argentina.
SELECT population, lifeexpectancy FROM country WHERE code = 'ARG';

#3-Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT name, LifeExpectancy 
FROM country 
WHERE LifeExpectancy 
IS NOT NULL ORDER BY LifeExpectancy 
DESC LIMIT 1;

#4-Using JOIN ... ON, find the capital city of Spain.
SELECT city.name, country.name
FROM country
LEFT JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode
WHERE country.code='ESP';

#or

SELECT city.name, country.name
FROM country
LEFT OUTER JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode
WHERE country.code='ESP';

#4-another way but without the left outer joins
SELECT c1.name FROM city c1 JOIN country c2 ON c1.id=c2.capital WHERE c2.code='ESP';

#5-Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT LANGUAGE,region
FROM countrylanguage
LEFT OUTER JOIN country
ON countrylanguage.CountryCode=country.code
WHERE country.region='Southeast Asia';

#or
SELECT cl.language FROM countrylanguage cl JOIN country co ON cl.countrycode=co.code WHERE region = 'southeast asia';

#6-Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city WHERE name LIKE 'f%' LIMIT 25;
#or
SELECT name FROM city WHERE name LIKE 'f%' ORDER BY name LIMIT 25;

#7-Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(ci.name) FROM city ci JOIN country co ON ci.countrycode =co.code WHERE co.code='CHN';

#8-Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT name, population FROM country WHERE population IS NOT NULL AND population!=0 ORDER BY population LIMIT 10;

#9-Using aggregate functions, return the number of countries the database contains.
SELECT DISTINCT COUNT(name) FROM country;
#or
SELECT COUNT(name) FROM country;

#10-What are the top ten largest countries by area?
SELECT name, population FROM country ORDER BY SurfaceArea DESC LIMIT 10;

#11-List the five largest cities by population in Japan.
SELECT name, population FROM city WHERE countrycode='JPN' ORDER BY population DESC LIMIT 5;

#12-List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SELECT name, code FROM country WHERE HeadOfState = "Elisabeth II";

#13-List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT name, population/SurfaceArea AS population_ratio FROM country WHERE population IS NOT NULL AND population!=0 ORDER BY population_ratio DESC LIMIT 10;

#14-List every unique world language.
SELECT DISTINCT language from countrylanguage;

#15-List the names and GNP of the world's top 10 richest countries.
SELECT name, GNP FROM country ORDER BY GNP DESC LIMIT 10;

#16-List the names of, and number of languages spoken by, the top ten most multilingual countries.*****
SELECT DISTINCT Language, COUNT(Language) as Frequency
FROM CountryLanguage
GROUP BY Language
ORDER BY Frequency DESC
LIMIT 10;

#17-List every country where over 50% of its population can speak German.

SELECT name FROM country cn JOIN CountryLanguage cl ON cl.countryCode=cn.code WHERE cl.percentage > 50 AND cl.language="German";

#18-Which country has the worst life expectancy? Discard zero or null values.
SELECT name, LifeExpectancy FROM country WHERE LifeExpectancy IS NOT NULL AND LifeExpectancy!=0 ORDER BY LifeExpectancy ASC LIMIT 1;

#19-List the top three most common government forms.
SELECT governmentform, COUNT(governmentform) FROM country GROUP BY governmentform ORDER BY COUNT(governmentform) DESC LIMIT 3;

#20-How many countries have gained independence since records began?
SELECT COUNT(indepyear) FROM country WHERE Indepyear>=0 AND Indepyear IS NOT NULL;