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

);

create table colision_vehiculo(

);

create table accidente(

);