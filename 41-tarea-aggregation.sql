SELECT * FROM users;

--Buscar los que inicien por 221.
SELECT first_name , last_name FROM users  WHERE last_connection LIKE '221.%';

--Buscar los que los seguidores sean mayores a 4600
SELECT first_name , last_name FROM users WHERE followers > 4600;

--  

--Ordenas descenciente
SELECT first_name , last_name , followers FROM users WHERE followers > 4600 AND followers < 4700 ORDER BY followers DESC;

--Ordenas ascendiente
SELECT first_name , last_name , followers FROM users WHERE followers > 4600 AND followers < 4700 ORDER BY followers ASC;

--Utilizando el between
SELECT first_name , last_name , followers FROM users WHERE followers BETWEEN 4600 AND 4700 ORDER BY followers DESC;


SELECT * FROM users;

--Contarlos
SELECT 
	COUNT(*) 
from users;

--Contarlos y ponerle alias
SELECT 
	COUNT(*) AS total_users 
from users;

--Contarlos
--Sacar el valor minimo de fallowers
--Sacar el valor maximo de seguidores
--Y el promedio redondeado
SELECT 
	COUNT(*) AS total_users, 
	MIN(followers) AS min_followers , 
	MAX( followers ) as max_followers , 
	ROUND( AVG(followers)) as avg_followers 
from users;

SELECT * FROM users;

--Utilizando el OR
SELECT
    first_name,
    last_name,
    followers,
FROM
    users
WHERE followers = 4
OR followers = 4999;

--Agrupandolos por seguidroes por el where y or
SELECT
    COUNT(*),
    followers
FROM
    users
WHERE followers = 4
OR followers = 4999
GROUP BY followers;

--Aqui el having significa que sean mayores de 5
SELECT 
	COUNT(*),
	country
FROM 
	users
GROUP BY 
	country
HAVING
	COUNT(*) > 5
ORDER BY 
	COUNT(*) DESC;

--Quitar las duplicadas
SELECT DISTINCT country from users;

SELECT 
	COUNT(*),
	SUBSTRING( email, POSITION('@' in email) + 1 ) AS domain
FROM 
	users
GROUP BY 
	SUBSTRING( email, POSITION('@' in email) + 1 ) 
HAVING count(*) > 1;

SELECT * FROM users;

-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like
SELECT
	COUNT(*) as goole_acounts
FROM 
	users
WHERE
	email LIKE '%@google.com';


-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct
SELECT DISTINCT
	country
FROM 
	users
WHERE
	email LIKE '%@google.com';

-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
SELECT
	count(*),
	country
FROM 
	users
GROUP BY
	country;


-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection

SELECT 
	last_connection AS IP,
	first_name,
	last_name,
	country,
	last_connection
FROM 
	users
WHERE 
	country = 'Iceland';
-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT 
	COUNT(*) as IP_112
FROM 
	users
WHERE 
	country = 'Iceland'
AND last_connection LIKE '112.%';


-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis 
SELECT 
	username,
	last_connection
FROM 
	users
WHERE
	country = 'Iceland'
AND
	last_connection LIKE '112.%'
OR 
	last_connection LIKE '28.%'
OR
	last_connection LIKE '188.%';


-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también

SELECT 
	last_name,
	first_name,
	last_connection
FROM 
	users
WHERE
	country = 'Iceland'
AND
	last_connection LIKE '112.%'
OR 
	last_connection LIKE '28.%'
OR
	last_connection LIKE '188.%'
	
ORDER BY last_name ASC , first_name ASC;

-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)
SELECT 
	first_name,
	last_name,
	country
FROM 
	users
WHERE 
	country IN ('Mexico', 'Honduras', 'Costa Rica')
ORDER BY country ASC, first_name ASC, last_name ASC;


-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc

SELECT 
	COUNT(*),
	country
FROM 
	users
WHERE 
	country IN ('Mexico', 'Honduras', 'Costa Rica')
GROUP BY
	country
ORDER BY country ASC;
