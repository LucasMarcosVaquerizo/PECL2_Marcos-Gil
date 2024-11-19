create database PECL2;

create schema temporal;

create schema final;

create table vehículos(
    VEHICLE_ID TEXT,
    STATE_REGISTRATION TEXT,
    VEHICLE_TYPE TEXT,
    VEHICLE_MAKE TEXT,
    VEHICLE_MODEL TEXT,
    VEHICLE_YEAR TEXT
);

create table personas(
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

create table colision_persona(
PERSON_ID TEXT,
PERSON_TYPE TEXT,
PERSON_INJURY TEXT,
VEHICLE_ID TEXT,
PERSON_AGE TEXT,
EJECTION TEXT,
EMOTIONAL_STATUS TEXT,
BODILY_INJURY TEXT,
POSITION_IN_VEHICLE TEXT,
SAFETY_EQUIPMENT TEXT,
PED_LOCATION TEXT,
PED_ACTION TEXT,
COMPLAINT TEXT,
PED_ROLE TEXT,
CONTRIBUTING_FACTOR_1 TEXT,
CONTRIBUTING_FACTOR_2 TEXT,
PERSON_SEX TEXT
);

create table colision_vehiculo(
VEHICLE_ID TEXT,
TRAVEL_DIRECTION TEXT,
VEHICLE_OCCUPANTS TEXT,
DRIVER_SEX TEXT,
DRIVER_LICENSE_STATUS TEXT,
DRIVER_LICENSE_JURISDICTION TEXT,
PRE_CRASH TEXT,
POINT_OF_IMPACT TEXT,
VEHICLE_DAMAGE TEXT,
VEHICLE_DAMAGE_1 TEXT,
VEHICLE_DAMAGE_2 TEXT,
VEHICLE_DAMAGE_3 TEXT,
PUBLIC_PROPERTY_DAMAGE TEXT,
PUBLIC_PROPERTY_DAMAGE_TYPE TEXT,
CONTRIBUTING_FACTOR_1 TEXT,
CONTRIBUTING_FACTOR_2 TEXT
);

create table accidente(
CRASH_DATE TEXT,
CRASH_TIME TEXT,
BOROUGH TEXT,
ZIP_CODE TEXT,
LATITUDE REAL,
LONGITUDE REAL,
LOCATION TEXT,
ON_STREET_NAME TEXT,
CROSS_STREET_NAME TEXT,
OFF_STREET_NAME TEXT,
NUMBER_OF_PERSONS_INJURED TEXT,
NUMBER_OF_PERSONS_KILLED TEXT,
NUMBER_OF_PEDESTRIANS_INJURED TEXT,
NUMBER_OF_PEDESTRIANS_KILLED TEXT,
NUMBER_OF_CYCLISTS_INJURED TEXT,
NUMBER_OF_CYCLISTS_KILLED TEXT,
NUMBER_OF_MOTORISTS_INJURED TEXT,
NUMBER_OF_MOTORISTS_KILLED TEXT,
CONTRIBUTING_FACTOR_VEHICLE_1 TEXT,
CONTRIBUTING_FACTOR_VEHICLE_2 TEXT,
CONTRIBUTING_FACTOR_VEHICLE_3 TEXT,
CONTRIBUTING_FACTOR_VEHICLE_4 TEXT,
CONTRIBUTING_FACTOR_VEHICLE_5 TEXT
);