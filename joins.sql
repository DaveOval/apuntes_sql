

SELECT * FROM continent WHERE name like '%America%'
UNION
SELECT * FROM continent WHERE code in (3,5)
order by name asc;



select
    a.name as country,
    b.name as continent
from
    country a,
    continent b
where a.continent = b.code
order by b.name asc;


--Inner join
SELECT a.name as country, b.name as continent FROM country a
inner JOIN continent b
on a.continent = b.code
order by b.name asc;

SELECT * FROM continent WHERE code = 6;

--reiniciar la secuencia al numero que se coloque
alter SEQUENCE 'sq name' RESTART with 8;

-- country a   -name, continent (codigo numerico)
-- countinent b -name as continentName


SELECT a.name as country , a.continent as continentCode, b.name as continentName
FROM country a 
FULL OUTER JOIN continent b ON a.continent = b.code;


SELECT a.name as country, b.name as continentName
FROM country a
RIGHT JOIN continent b
ON a.continent = b.code
WHERE a.continent IS NULL;


SELECT count(*), b.name from country a
INNER JOIN continent b
on a.continent = b.code
group by b.name
ORDER by count(*) ASC;

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

SELECT *