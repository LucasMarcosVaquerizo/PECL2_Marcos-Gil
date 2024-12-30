
-- Consultas y arreglos de la base de datos de la PECL2

-- Ejercicio1:

DELETE FROM final.vehículos WHERE vehicle_id is NULL or vehicle_id LIKE '' or length(vehicle_id) < 10;

DELETE FROM final.colision_vehiculo WHERE vehicle_id is NULL or vehicle_id LIKE '' or length(vehicle_id) < 10;

ALTER TABLE final.colision_persona DROP COLUMN vehicle_id;

-- Ejercicio2:

DELETE FROM final.personas WHERE person_id is NULL or person_id LIKE '' or length(person_id) < 10;

-- Ejercicio3:

ALTER TABLE final.vehículos
ADD COLUMN state_registration varchar(2);

UPDATE final.vehículos as v
SET state_registration = (SELECT DISTINCT state_registration
                  FROM final.colision_vehiculo as cv
                  WHERE v.vehicle_id = cv.vehicle_id)
WHERE EXISTS(SELECT 1
             FROM final.colision_vehiculo
             WHERE v.vehicle_id = final.colision_vehiculo.vehicle_id);

ALTER TABLE final.colision_vehiculo
DROP COLUMN state_registration;

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
SET state_registration = 'unknown'
WHERE state_registration NULL or state_registration LIKE '';

-- Ejercicio 5:

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
ADD COLUMN vehicle_accidents INT DEFAULT 0;

CREATE OR REPLACE FUNCTION calcular_accidentes()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE final.vehículos
    SET vehicle_accidents = (SELECT COUNT(*)
                             FROM final.colision_vehiculo
                             WHERE vehicle_id = NEW.vehicle_id)
    WHERE vehicle_id = NEW.vehicle_id;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_calcular_accidentes
AFTER INSERT OR UPDATE OR DELETE ON final.colision_vehiculo
FOR EACH ROW
EXECUTE FUNCTION calcular_accidentes();

-- Ejercicio 8

ALTER TABLE final.accidente
ADD CONSTRAINT accidente_pk PRIMARY KEY (collision_id);

ALTER TABLE final.vehículos
ADD CONSTRAINT vehiculos_pk PRIMARY KEY (vehicle_id);

ALTER TABLE final.personas
ADD CONSTRAINT personas_pk PRIMARY KEY (person_id);

ALTER TABLE final.colision_vehiculo
ADD CONSTRAINT colision_vehiculo_pk PRIMARY KEY (unique_id),
ADD CONSTRAINT colision_vehiculo_vehiculos_fk FOREIGN KEY (vehicle_id) REFERENCES final.vehículos(vehicle_id),
ADD CONSTRAINT colision_vehiculo_accidente_fk FOREIGN KEY (collision_id) REFERENCES final.accidente(collision_id);

ALTER TABLE final.colision_persona
ADD CONSTRAINT colision_persona_pk PRIMARY KEY (unique_id),
ADD CONSTRAINT colision_persona_personas_fk FOREIGN KEY (person_id) REFERENCES final.personas(person_id),
ADD CONSTRAINT colision_persona_accidente_fk FOREIGN KEY (collision_id) REFERENCES final.accidente(collision_id);