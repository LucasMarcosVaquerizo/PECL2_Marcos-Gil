-- 1
select * from final.vehículos
where vehicle_id in (select vehicle_id from final.colision_vehiculo
                        group by vehicle_id
                        having count(*) > 1);

-- 2
select * from final.vehículos
where 2024-vehicle_year > 35; -- hay que usar año actual o se puede 2024

-- 3
select left(vehicle_make, position(' ' in vehicle_make) - 1) as marca, count(*) as total
from final.vehículos
where vehicle_make notnull
group by Marca
order by total DESC
LIMIT 5;

-- 5
select * from final.personas
where person_id in (select person_id from final.colision_persona
                    where position_in_vehicle = 'Driver' and (person_age > 65 or colision_persona.person_age < 26))
order by person_dob DESC; -- ASC es de menor a mayor o order by ASC

-- 6
select * from final.personas as P
where P.person_id in (select CP.person_id
                      from final.colision_persona as CP
                      where CP.vehicle_id in (select V.vehicle_id
                                              from final.vehículos as V
                                              where V.vehicle_type ilike 'Pick-up Truck')); -- vehicles.id dont match

-- 7
