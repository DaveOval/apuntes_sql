-- 1. Ver todos los registros
SELECT * FROM users;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT * FROM users WHERE id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT * FROM users WHERE name LIKE 'Jim%';

-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT * FROM users WHERE name LIKE '% Alexander';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE users SET name = 'Carlos David' WHERE id = 1;

-- 6. Borrar el último registro de la tabla
SELECT max(id) from users;

DELETE FROM users WHERE id = (SELECT max(id) from users);


SELECT
    id,
    UPPER(name) AS upper_name,
    LOWER(name) AS lower_name,
    LENGTH(name) AS LENGTH,
    (20 * 2) as constante,
    '*' || id || '-' || name || '*' as barcode,
    CONCAT( '*',id,'-'),name,'*',
    name
FROM
    users;



SELECT 
	name,
	SUBSTRING( name, 0 , POSITION(' ' in name) ) as first_name,
	SUBSTRING( name, POSITION(' ' in name) + 1 ) as second_name
FROM users;


SELECT * FROM users;

UPDATE 
	users
SET
	first_name = SUBSTRING( name, 0 , POSITION(' ' in name) ),
	last_name = SUBSTRING( name, POSITION(' ' in name) + 1 )


SELECT 
	name,
	SUBSTRING( name, 0 , POSITION(' ' in name) ) as first_name,
	SUBSTRING( name, POSITION(' ' in name) + 1 ) as second_name
FROM users;


SELECT * FROM users;

UPDATE 
	users
SET
	first_name = SUBSTRING( name, 0 , POSITION(' ' in name) ),
	last_name = SUBSTRING( name, POSITION(' ' in name) + 1 )