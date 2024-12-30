
-- Consultas y arreglos de la base de datos de la PECL2

-- Ejercicio1:

DELETE FROM final.vehículos WHERE vehicle_id is NULL or vehicle_id LIKE '' or length(vehicle_id) < 10;

DELETE FROM final.colision_vehiculo WHERE vehicle_id is NULL or vehicle_id LIKE '' or length(vehicle_id) < 10;

ALTER TABLE final.colision_persona DROP COLUMN vehicle_id;

-- Ejercicio2:

DELETE FROM final.personas
WHERE personas.person_id is NULL or personas.person_id LIKE '' or length(person_id) < 10;

-- Ejercicio3:

ALTER TABLE final.vehículos
ADD COLUMN state_registration varchar(2);

UPDATE final.vehículos as v
SET state_registration = cv.state_registration
FROM final.colision_vehiculo as cv
WHERE v.vehicle_id = cv.vehicle_id;

-- Ejercicio4:

UPDATE final.vehículos
SET vehicle_type = 'unknown'
WHERE vehicle_type is NULL or vehicle_type LIKE '';

UPDATE final.vehículos
SET vehicle_make = 'unknown'
WHERE vehículos.vehicle_make is NULL or vehículos.vehicle_make LIKE '';

UPDATE final.vehículos
SET vehicle_model = 'unknown'
WHERE vehículos.vehicle_model is NULL or vehículos.vehicle_model LIKE '';

UPDATE final.vehículos
SET vehicle_year = 9999
WHERE vehicle_year is NULL or vehicle_year LIKE '';

UPDATE final.vehículos
SET state_registration = 'unknown'                              --falta crear una columna state_registration con todos los valores a nulo.
WHERE state_registration NULL or state_registration LIKE '';

-- Ejercicio 5:

ALTER TABLE final.personas
ADD COLUMN person_sex char(1);

UPDATE final.personas
SET person_sex = final.colision_persona.person_sex
WHERE person_id = final.colision_persona.person_id;

ALTER TABLE final.colision_persona
DROP COLUMN person_sex;

UPDATE final.personas
SET person_sex = 'U'
WHERE person_sex NULL or person_sex LIKE '';

-- Ejercicio 5-profe:

UPDATE final.personas
SET person_sex = (SELECT DISTINCT person_sex
                  FROM final.colision_persona
                  WHERE personas.person_id = final.colision_persona.person_id)
WHERE EXISTS(SELECT 1
             FROM final.colision_persona
             WHERE personas.person_id = colision_persona.person_id);

-- Ejercicio 6:

ALTER TABLE final.personas
ADD COLUMN person_age INT;

CREATE OR REPLACE FUNCTION calcular_edad()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.person_dob IS NOT NULL THEN
        NEW.person_age := DATE_PART('year', AGE(NEW.person_dob));
    ELSE
        NEW.person_age := NULL;
    END IF;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;


CREATE TRIGGER calcular_edad
BEFORE INSERT ON final.personas
FOR EACH ROW
EXECUTE FUNCTION calcular_edad();

-- Ejercicio 7

ALTER TABLE final.vehículos
ADD COLUMN vehicle_accidents INT;

ALTER TABLE final.personas
ADD COLUMN person_age INT;

CREATE OR REPLACE FUNCTION calcular_accidentes()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.person_dob IS NOT NULL THEN
        NEW.person_age := DATE_PART('year', AGE(NEW.person_dob));
    ELSE
        NEW.person_age := NULL;
    END IF;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;


CREATE TRIGGER calcular_accidentes
BEFORE INSERT ON final.personas
FOR EACH ROW
EXECUTE FUNCTION calcular_accidentes();
