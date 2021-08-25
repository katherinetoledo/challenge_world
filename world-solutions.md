# World SQL Solutions

```sql
SELECT COUNT(ID)
FROM city
WHERE CountryCode='USA';
```

```sql
SELECT LifeExpectancy, Population
FROM country
WHERE name='Argentina';
```

```sql
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy=(
    SELECT MAX(LifeExpectancy)
    FROM country
);

////

SELECT Name, LifeExpectancy
FROM country 
WHERE LifeExpectancy=(
     SELECT MAX(LifeExpectancy) FROM COUNTRY) IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 1; 
```

```sql
SELECT c.Name
FROM city c
JOIN country co ON co.Capital=c.ID
WHERE co.Name='Spain';
```

```sql
SELECT cl.Language
FROM countrylanguage cl
JOIN country co ON co.Code=cl.CountryCode
WHERE co.Region='Southeast Asia';

or (TO AVOID REPETITIONS):

SELECT DISTINCT cl.Language
FROM countrylanguage cl
JOIN country co ON co.Code=cl.CountryCode
WHERE co.Region='Southeast Asia';
```

```sql
SELECT Name
FROM city
WHERE name LIKE 'F%'
LIMIT 25;
```

```sql
SELECT COUNT(ID)
FROM city c
LEFT JOIN country co ON co.Code = c.CountryCode
WHERE co.Name = 'China';
```

```sql
SELECT Name, Population FROM country
WHERE population IS NOT NULL
AND Population!=0
ORDER BY population ASC LIMIT 1;

OR IF YOU WANT TO USE NESTED QUERIES:

SELECT Name, Population
FROM country
WHERE Population=(
    SELECT MIN(Population)
    FROM country
    WHERE Population!=0
);
```

```sql
SELECT COUNT(DISTINCT Code)
FROM country;
```

```sql
SELECT Name
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;
```

```sql
SELECT c.Name, c.Population
FROM city c
JOIN country co ON co.Code=c.CountryCode
WHERE co.name='Japan'
ORDER BY c.Population DESC
LIMIT 5;
```

```sql
UPDATE country
SET HeadOfState='Elizabeth II'
WHERE HeadOfState='Elisabeth II';

SELECT Name, Code
FROM country
WHERE HeadOfState='Elizabeth II';
```

```sql
SELECT *
FROM (
    SELECT Name, Population, SurfaceArea, (Population/SurfaceArea) AS Ratio
    FROM country
    WHERE Population IS NOT NULL
    AND Population!=0
) AS PopulationToAreaRatio
ORDER BY Ratio
LIMIT 10;
```

```sql
SELECT DISTINCT Language
FROM countrylanguage;
```

```sql
SELECT Name, GNP
FROM country
ORDER BY GNP DESC
LIMIT 10;

```

```sql
SELECT DISTINCT Language, COUNT(Language) as Frequency
FROM countrylanguage
GROUP BY Language
ORDER BY Frequency DESC
LIMIT 10;
```

```sql
SELECT Name, cl.Percentage
FROM countrylanguage cl
JOIN country co ON co.Code=cl.CountryCode
WHERE cl.Language='German'
AND cl.Percentage>50
ORDER BY cl.Percentage DESC;
```

```sql
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy=(
    SELECT MIN(LifeExpectancy)
    FROM country
    WHERE LifeExpectancy!=0
);
```

```sql
SELECT GovernmentForm
FROM country
GROUP BY GovernmentForm
ORDER BY Count(GovernmentForm) DESC
LIMIT 3;
```

```sql
SELECT COUNT(IndepYear)
FROM country
WHERE IndepYear IS NOT NULL;
```
