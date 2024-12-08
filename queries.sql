-- 1
-- Los ids no son únicos por lo que la cuenta de accidentes va a ser incorrecta
-- Además los ids de colision_vehiculo y vehiculos no coinciden correctamente

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