SELECT DISTINCT continent FROM country order by continent ASC;


INSERT INTO
    continent (name)
SELECT
    DISTINCT continent
FROM
    country
order by
    continent ASC;
    
    
SELECT * FROM continent;

SELECT * FROM country;

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar(3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10,2),
    "gnpold" numeric(10,2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar(2) NOT NULL,
    PRIMARY KEY ("code")
);


--Volcar toda la info de una tabla a otra
INSERT INTO
	country_bk 
SELECT * 
FROM
	country;
	
	
SELECT * FROM country;

ALTER TABLE country DROP CONSTRAINT country_continent_check;


SELECT 
	a.name, a.continent,
	( SELECT "code" from continent b where b.name = a.continent)
FROM country a;

UPDATE country a 
SET continent = ( SELECT "code" from continent b where b.name = a.continent);

ALTER TABLE country
alter COLUMN continent TYPE int4
USING continent::integer;


-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar

-- Actualizar todos los registros

-- Cambiar tipo de dato en countrylanguage - languagecode por int4

-- Crear el forening key y constraints de no nulo el language_code

-- Revisar lo creado