--Création des schemas
DROP SCHEMA IF EXISTS health_app_db.public;

CREATE OR ALTER schema health_app_db.raw;
CREATE OR ALTER schema health_app_db.staging;
CREATE OR ALTER schema health_app_db.common;