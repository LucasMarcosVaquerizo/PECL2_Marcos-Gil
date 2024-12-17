
--consultas yb arreglos de la base de datos de la PECL2

--Ejercicio1:

DELETE FROM final.vehículos WHERE vehicle_id is NULL or vehicle_id LIKE '' or length(vehicle_id) < 10;

DELETE FROM final.colision_vehiculo WHERE vehicle_id is NULL or vehicle_id LIKE '' or length(vehicle_id) < 10;

ALTER TABLE final.colision_persona DROP COLUMN vehicle_id;

--Ejercicio2:

DELETE FROM final.personas WHERE personas.person_id is NULL or personas.person_id LIKE '' or length(person_id) < 10;

--Ejercicio3:


--Ejercicio4:

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
WHERE  state_registration NULL or state_registration LIKE '';