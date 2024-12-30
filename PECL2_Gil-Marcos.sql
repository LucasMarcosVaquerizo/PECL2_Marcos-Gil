-- Path a la carpeta de datos: 'C:\datos', reemplazar con la carpeta que se desee (Ctrl+R)

-- Ejecutar primero y seleccionar database PECL2
CREATE database PECL2;

-- Seleccionar database PECL2 y ejecutar el resto
SET datestyle TO 'MDY';

CREATE SCHEMA IF NOT EXISTS temporal;

SET search_path TO temporal;

CREATE TABLE IF NOT EXISTS vehículos(
    VEHICLE_ID TEXT,
    VEHICLE_YEAR TEXT,
    VEHICLE_TYPE TEXT,
    VEHICLE_MODEL TEXT,
    VEHICLE_MAKE TEXT
);

CREATE TABLE IF NOT EXISTS personas (
    person_id TEXT,
    person_sex TEXT,
    person_lastname TEXT,
    person_firstname TEXT,
    person_phone TEXT,
    person_address TEXT,
    person_city TEXT,
    person_state TEXT,
    person_zip TEXT,
    person_ssn TEXT,
    person_dob TEXT
);

CREATE TABLE IF NOT EXISTS colision_persona (
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    person_id TEXT,
    person_type TEXT,
    person_injury TEXT,
    vehicle_id TEXT,
    person_age TEXT,
    ejection TEXT,
    emotional_status TEXT,
    bodily_injury TEXT,
    position_in_vehicle TEXT,
    safety_equipment TEXT,
    ped_location TEXT,
    ped_action TEXT,
    complaint TEXT,
    ped_role TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT,
    person_sex TEXT
);

CREATE TABLE IF NOT EXISTS colision_vehiculo (
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    vehicle_id TEXT,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT,
    travel_direction TEXT,
    vehicle_occupants TEXT,
    driver_sex TEXT,
    driver_license_status TEXT,
    driver_license_jurisdiction TEXT,
    pre_crash TEXT,
    point_of_impact TEXT,
    vehicle_damage TEXT,
    vehicle_damage_1 TEXT,
    vehicle_damage_2 TEXT,
    vehicle_damage_3 TEXT,
    public_property_damage TEXT,
    public_property_damage_type TEXT,
    contributing_factor_1 TEXT,
    contributing_factor_2 TEXT
);

CREATE TABLE IF NOT EXISTS accidente (
    crash_date TEXT,
    crash_time TEXT,
    borough TEXT,
    zip_code TEXT,
    latitude TEXT,
    longitude TEXT,
    location TEXT,
    on_street_name TEXT,
    cross_street_name TEXT,
    off_street_name TEXT,
    number_of_persons_injured TEXT,
    number_of_persons_killed TEXT,
    number_of_pedestrians_injured TEXT,
    number_of_pedestrians_killed TEXT,
    number_of_cyclists_injured TEXT,
    number_of_cyclists_killed TEXT,
    number_of_motorists_injured TEXT,
    number_of_motorists_killed TEXT,
    contributing_factor_vehicle_1 TEXT,
    contributing_factor_vehicle_2 TEXT,
    contributing_factor_vehicle_3 TEXT,
    contributing_factor_vehicle_4 TEXT,
    contributing_factor_vehicle_5 TEXT,
    collision_id TEXT,
    vehicle_type_code_1 TEXT,
    vehicle_type_code_2 TEXT,
    vehicle_type_code_3 TEXT,
    vehicle_type_code_4 TEXT,
    vehicle_type_code_5 TEXT
);



COPY colision_persona
FROM 'C:\datos\Collisions_Person_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';


COPY personas
FROM 'C:\datos\personas2.csv'
WITH CSV HEADER NULL '' DELIMITER ';';


COPY vehículos
FROM 'C:\datos\Vehicles.csv'
WITH CSV HEADER NULL '' DELIMITER ';';


COPY colision_vehiculo
FROM 'C:\datos\Collisions_Vehicles_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';


COPY accidente
FROM 'C:\datos\Collisions_Crashes_20241020.csv'
WITH CSV HEADER NULL '' DELIMITER ',';

CREATE SCHEMA IF NOT EXISTS final;

SET search_path TO final;

CREATE TABLE IF NOT EXISTS vehículos (
    VEHICLE_ID VARCHAR(50),
    VEHICLE_TYPE VARCHAR(50),
    VEHICLE_MAKE VARCHAR(50),
    VEHICLE_MODEL VARCHAR(50),
    VEHICLE_YEAR INT
);

CREATE TABLE IF NOT EXISTS personas (
    PERSON_ID VARCHAR(50),
    PERSON_SEX CHAR(1),
    PERSON_LASTNAME VARCHAR(100),
    PERSON_FIRSTNAME VARCHAR(100),
    PERSON_PHONE VARCHAR(15),
    PERSON_ADDRESS VARCHAR(255),
    PERSON_CITY VARCHAR(100),
    PERSON_STATE CHAR(2),
    PERSON_ZIP CHAR(5),
    PERSON_SSN CHAR(11),
    PERSON_DOB DATE
);

CREATE TABLE IF NOT EXISTS colision_persona (
    UNIQUE_ID VARCHAR(50),
    COLLISION_ID VARCHAR(50),
    PERSON_ID VARCHAR(50),
    PERSON_TYPE VARCHAR(50),
    PERSON_INJURY VARCHAR(50),
    VEHICLE_ID VARCHAR(50),
    PERSON_AGE INT,
    EJECTION VARCHAR(50),
    EMOTIONAL_STATUS VARCHAR(50),
    BODILY_INJURY VARCHAR(50),
    POSITION_IN_VEHICLE VARCHAR(50),
    SAFETY_EQUIPMENT VARCHAR(50),
    PED_LOCATION VARCHAR(50),
    PED_ACTION VARCHAR(50),
    COMPLAINT VARCHAR(255),
    PED_ROLE VARCHAR(50),
    CONTRIBUTING_FACTOR_1 VARCHAR(100),
    CONTRIBUTING_FACTOR_2 VARCHAR(100),
    PERSON_SEX CHAR(1)
);

CREATE TABLE IF NOT EXISTS colision_vehiculo (
    UNIQUE_ID VARCHAR(50),
    COLLISION_ID VARCHAR(50),
    VEHICLE_ID VARCHAR(50),
    STATE_REGISTRATION VARCHAR(2),
    VEHICLE_TYPE VARCHAR(50),
    VEHICLE_MAKE VARCHAR(50),
    TRAVEL_DIRECTION VARCHAR(50),
    VEHICLE_OCCUPANTS INT,
    DRIVER_SEX CHAR(1),
    DRIVER_LICENSE_STATUS VARCHAR(50),
    DRIVER_LICENSE_JURISDICTION VARCHAR(50),
    PRE_CRASH VARCHAR(50),
    POINT_OF_IMPACT VARCHAR(50),
    VEHICLE_DAMAGE VARCHAR(255),
    VEHICLE_DAMAGE_1 VARCHAR(50),
    VEHICLE_DAMAGE_2 VARCHAR(50),
    VEHICLE_DAMAGE_3 VARCHAR(50),
    PUBLIC_PROPERTY_DAMAGE VARCHAR(50),
    PUBLIC_PROPERTY_DAMAGE_TYPE VARCHAR(50),
    CONTRIBUTING_FACTOR_1 VARCHAR(100),
    CONTRIBUTING_FACTOR_2 VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS accidente (
    CRASH_DATE DATE,
    CRASH_TIME TIME,
    BOROUGH VARCHAR(50),
    ZIP_CODE CHAR(5),
    LATITUDE DECIMAL(9,6),
    LONGITUDE DECIMAL(9,6),
    LOCATION VARCHAR(255),
    ON_STREET_NAME VARCHAR(255),
    CROSS_STREET_NAME VARCHAR(255),
    OFF_STREET_NAME VARCHAR(255),
    NUMBER_OF_PERSONS_INJURED INT,
    NUMBER_OF_PERSONS_KILLED INT,
    NUMBER_OF_PEDESTRIANS_INJURED INT,
    NUMBER_OF_PEDESTRIANS_KILLED INT,
    NUMBER_OF_CYCLISTS_INJURED INT,
    NUMBER_OF_CYCLISTS_KILLED INT,
    NUMBER_OF_MOTORISTS_INJURED INT,
    NUMBER_OF_MOTORISTS_KILLED INT,
    COLLISION_ID VARCHAR(50),
    CONTRIBUTING_FACTOR_VEHICLE_1 VARCHAR(100),
    CONTRIBUTING_FACTOR_VEHICLE_2 VARCHAR(100),
    CONTRIBUTING_FACTOR_VEHICLE_3 VARCHAR(100),
    CONTRIBUTING_FACTOR_VEHICLE_4 VARCHAR(100),
    CONTRIBUTING_FACTOR_VEHICLE_5 VARCHAR(100)
);

INSERT INTO final.vehículos (
    VEHICLE_ID,
    VEHICLE_YEAR,
    VEHICLE_TYPE,
    VEHICLE_MODEL,
    VEHICLE_MAKE
)
SELECT
    CAST(vehicle_id AS VARCHAR(50)),
    CAST(vehicle_year AS INT),
    CAST(vehicle_type AS VARCHAR(50)),
    CAST(vehicle_model AS VARCHAR(50)),
    CAST(vehicle_make AS VARCHAR(50))
FROM temporal.vehículos;

INSERT INTO final.personas (
    PERSON_ID,
    PERSON_SEX,
    PERSON_LASTNAME,
    PERSON_FIRSTNAME,
    PERSON_PHONE,
    PERSON_ADDRESS,
    PERSON_CITY,
    PERSON_STATE,
    PERSON_ZIP,
    PERSON_SSN,
    PERSON_DOB
)
SELECT
    CAST(person_id AS VARCHAR(50)),
    CAST(person_sex AS CHAR(1)),
    CAST(person_lastname AS VARCHAR(100)),
    CAST(person_firstname AS VARCHAR(100)),
    CAST(person_phone AS VARCHAR(15)),
    CAST(person_address AS VARCHAR(255)),
    CAST(person_city AS VARCHAR(100)),
    CAST(person_state AS CHAR(2)),
    CAST(person_zip AS CHAR(5)),
    CAST(person_ssn AS CHAR(11)),
    CAST(person_dob AS DATE)
FROM temporal.personas;

INSERT INTO final.colision_persona (
    UNIQUE_ID,
    COLLISION_ID,
    PERSON_ID,
    PERSON_TYPE,
    PERSON_INJURY,
    VEHICLE_ID,
    PERSON_AGE,
    EJECTION,
    EMOTIONAL_STATUS,
    BODILY_INJURY,
    POSITION_IN_VEHICLE,
    SAFETY_EQUIPMENT,
    PED_LOCATION,
    PED_ACTION,
    COMPLAINT,
    PED_ROLE,
    CONTRIBUTING_FACTOR_1,
    CONTRIBUTING_FACTOR_2,
    PERSON_SEX
)
SELECT
    CAST(unique_id AS VARCHAR(50)),
    CAST(collision_id AS VARCHAR(50)),
    CAST(person_id AS VARCHAR(50)),
    CAST(person_type AS VARCHAR(50)),
    CAST(person_injury AS VARCHAR(50)),
    CAST(vehicle_id AS VARCHAR(50)),
    CAST(person_age AS INT),
    CAST(ejection AS VARCHAR(50)),
    CAST(emotional_status AS VARCHAR(50)),
    CAST(bodily_injury AS VARCHAR(50)),
    CAST(position_in_vehicle AS VARCHAR(50)),
    CAST(safety_equipment AS VARCHAR(50)),
    CAST(ped_location AS VARCHAR(50)),
    CAST(ped_action AS VARCHAR(50)),
    CAST(complaint AS VARCHAR(255)),
    CAST(ped_role AS VARCHAR(50)),
    CAST(contributing_factor_1 AS VARCHAR(100)),
    CAST(contributing_factor_2 AS VARCHAR(100)),
    CAST(person_sex AS CHAR(1))
FROM temporal.colision_persona;

INSERT INTO final.colision_vehiculo (
    UNIQUE_ID,
    COLLISION_ID,
    VEHICLE_ID,
    STATE_REGISTRATION,
    VEHICLE_TYPE,
    VEHICLE_MAKE,
    TRAVEL_DIRECTION,
    VEHICLE_OCCUPANTS,
    DRIVER_SEX,
    DRIVER_LICENSE_STATUS,
    DRIVER_LICENSE_JURISDICTION,
    PRE_CRASH,
    POINT_OF_IMPACT,
    VEHICLE_DAMAGE,
    VEHICLE_DAMAGE_1,
    VEHICLE_DAMAGE_2,
    VEHICLE_DAMAGE_3,
    PUBLIC_PROPERTY_DAMAGE,
    PUBLIC_PROPERTY_DAMAGE_TYPE,
    CONTRIBUTING_FACTOR_1,
    CONTRIBUTING_FACTOR_2
)
SELECT
    CAST(unique_id AS VARCHAR(50)),
    CAST(collision_id AS VARCHAR(50)),
    CAST(vehicle_id AS VARCHAR(50)),
    CAST(state_registration AS VARCHAR(2)),
    CAST(vehicle_type AS VARCHAR(50)),
    CAST(vehicle_make AS VARCHAR(50)),
    CAST(travel_direction AS VARCHAR(50)),
    CAST(vehicle_occupants AS INT),
    CAST(driver_sex AS CHAR(1)),
    CAST(driver_license_status AS VARCHAR(50)),
    CAST(driver_license_jurisdiction AS VARCHAR(50)),
    CAST(pre_crash AS VARCHAR(50)),
    CAST(point_of_impact AS VARCHAR(50)),
    CAST(vehicle_damage AS VARCHAR(255)),
    CAST(vehicle_damage_1 AS VARCHAR(50)),
    CAST(vehicle_damage_2 AS VARCHAR(50)),
    CAST(vehicle_damage_3 AS VARCHAR(50)),
    CAST(public_property_damage AS VARCHAR(50)),
    CAST(public_property_damage_type AS VARCHAR(50)),
    CAST(contributing_factor_1 AS VARCHAR(100)),
    CAST(contributing_factor_2 AS VARCHAR(100))
FROM temporal.colision_vehiculo;

INSERT INTO final.accidente (
    CRASH_DATE,
    CRASH_TIME,
    BOROUGH,
    ZIP_CODE,
    LATITUDE,
    LONGITUDE,
    LOCATION,
    ON_STREET_NAME,
    CROSS_STREET_NAME,
    OFF_STREET_NAME,
    NUMBER_OF_PERSONS_INJURED,
    NUMBER_OF_PERSONS_KILLED,
    NUMBER_OF_PEDESTRIANS_INJURED,
    NUMBER_OF_PEDESTRIANS_KILLED,
    NUMBER_OF_CYCLISTS_INJURED,
    NUMBER_OF_CYCLISTS_KILLED,
    NUMBER_OF_MOTORISTS_INJURED,
    NUMBER_OF_MOTORISTS_KILLED,
    COLLISION_ID,
    CONTRIBUTING_FACTOR_VEHICLE_1,
    CONTRIBUTING_FACTOR_VEHICLE_2,
    CONTRIBUTING_FACTOR_VEHICLE_3,
    CONTRIBUTING_FACTOR_VEHICLE_4,
    CONTRIBUTING_FACTOR_VEHICLE_5
)
SELECT
    CAST(crash_date AS DATE),
    CAST(crash_time AS TIME),
    CAST(borough AS VARCHAR(50)),
    CAST(zip_code AS CHAR(5)),
    CAST(latitude AS DECIMAL(9,6)),
    CAST(longitude AS DECIMAL(9,6)),
    CAST(location AS VARCHAR(255)),
    CAST(on_street_name AS VARCHAR(255)),
    CAST(cross_street_name AS VARCHAR(255)),
    CAST(off_street_name AS VARCHAR(255)),
    CAST(number_of_persons_injured AS INT),
    CAST(number_of_persons_killed AS INT),
    CAST(number_of_pedestrians_injured AS INT),
    CAST(number_of_pedestrians_killed AS INT),
    CAST(number_of_cyclists_injured AS INT),
    CAST(number_of_cyclists_killed AS INT),
    CAST(number_of_motorists_injured AS INT),
    CAST(number_of_motorists_killed AS INT),
    CAST(collision_id AS VARCHAR(50)),
    CAST(contributing_factor_vehicle_1 AS VARCHAR(100)),
    CAST(contributing_factor_vehicle_2 AS VARCHAR(100)),
    CAST(contributing_factor_vehicle_3 AS VARCHAR(100)),
    CAST(contributing_factor_vehicle_4 AS VARCHAR(100)),
    CAST(contributing_factor_vehicle_5 AS VARCHAR(100))
FROM temporal.accidente;


-- Consultas:

-- 1:
-- Los ids no son únicos por lo que la cuenta de accidentes va a ser incorrecta
-- Además los ids de colision_vehiculo y vehiculos no coinciden correctamente

-- 1
select v.vehicle_id, v.vehicle_type, v.vehicle_make, count(*) as numero_accidentes
from final.vehículos as v, (select vehicle_id, count(*)
                            from final.colision_vehiculo
                            group by vehicle_id
                            having count(*) > 1) as cv
where v.vehicle_id in (select cv.vehicle_id)
group by v.vehicle_id, v.vehicle_type, v.vehicle_make -- Los ids están repetidos, agrupo también por otros campos adicionales para mejorar la búsqueda
order by numero_accidentes DESC;

-- 1.1 (Vehículos con más de un accidente)
select vehicle_id, count(*) as n_acc
from final.colision_vehiculo
group by vehicle_id
having count(*) > 1
order by vehicle_id DESC;

-- 2
select vehicle_id, vehicle_type, vehicle_make, 2024-vehicle_year as antigüedad_vehículo
from final.vehículos
where 2024-vehicle_year >= 35;

-- 3
select vehicle_make, count(*) as total
from final.vehículos
where vehicle_make notnull
group by vehicle_make
order by total DESC
LIMIT 5;

-- 4
select p.*, cp.n_acc, cp.position_in_vehicle
from final.personas as p, (select person_id, count(*) as n_acc, position_in_vehicle from final.colision_persona
                           where position_in_vehicle = 'Driver'
                           group by person_id, position_in_vehicle
                           having count(*) > 1) as cp
where p.person_id in (cp.person_id)
order by cp.n_acc DESC; -- No hay ningún conductor con más de un accidente (comprobar en 4.1)

-- 4.1 (Id_persona con su número de accidentes)
select person_id, count(*) as n_acc, position_in_vehicle
from final.colision_persona
where position_in_vehicle = 'Driver'
group by person_id, position_in_vehicle
order by n_acc DESC;

-- 5
select p.*, cp.position_in_vehicle
from final.personas as p, (select person_id, position_in_vehicle
                           from final.colision_persona
                           where position_in_vehicle = 'Driver' and (person_age > 65 or colision_persona.person_age < 26)) as cp
where p.person_id in (cp.person_id)
order by p.person_dob DESC; -- Ordenados ascendentemente por edad (DESC por fecha de nacimiento)

-- 6
select P.*, v.vehicle_type, v.position_in_vehicle
from final.personas as P, (select CP.person_id, V.vehicle_type, CP.position_in_vehicle
                           from final.colision_persona as CP, (select vehicle_id, vehicle_type
                                                               from final.vehículos
                                                               where vehicle_type ilike 'Pick-up Truck') as V
                           where CP.vehicle_id in (V.vehicle_id) and CP.position_in_vehicle = 'Driver') as v
where P.person_id in (v.person_id); -- Los ids de vehículo de vehículos y de colisión_persona no coinciden (comprobar en 6.2)

-- 6.1 (Vehículos tipo Pick-up)
select vehicle_id, vehicle_type
from final.vehículos
where vehicle_type ilike 'Pick-up Truck';

-- 6.2 (Personas en accidentes con un Pick-up)
select CP.person_id, V.vehicle_type, CP.position_in_vehicle
from final.colision_persona as CP, (select vehicle_id, vehicle_type
                                    from final.vehículos
                                    where vehicle_type ilike 'Pick-up Truck') as V
where CP.vehicle_id in (V.vehicle_id); -- en 6: and CP.position_in_vehicle = 'Driver'
-- Los ids de vehículo de colisión_persona y de vehículo no coinciden

-- 7.1 (Las 3 marcas de vehículos que sufren menos accidentes)
select vehicle_make, count(*) as numero_accidentes
from final.colision_vehiculo
where vehicle_make notnull
group by vehicle_make
having count(*) > 20
-- podemos añadir having count(*) > x para filtrar resultados que vienen de datos incorrectamente introducidos
order by numero_accidentes
LIMIT 3;

-- 7.2 (Los 3 tipos de vehículo que menos accidentes sufren)
select vehicle_type, count(*) as numero_accidentes
from final.colision_vehiculo
where vehicle_type notnull
group by vehicle_type
having count(*) > 10
-- podemos añadir having count(*) > x para filtrar resultados que vienen de datos incorrectamente introducidos
order by numero_accidentes
LIMIT 3;

-- 8
select vehicle_make as marca, count(*) as numero_accidentes
from final.colision_vehiculo
where vehicle_make notnull
group by marca
order by numero_accidentes DESC;

-- 9
select p.person_id, p.person_firstname, p.person_lastname, p.person_city, cp.position_in_vehicle, cp.collision_id
from final.personas as p, final.colision_persona as cp
where p.person_id in (cp.person_id) and cp.position_in_vehicle = 'Driver';

-- 10
select state_registration, count(state_registration) as numero_accientes
from colision_vehiculo
group by state_registration
order by numero_accientes DESC;