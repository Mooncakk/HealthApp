-- Suppression du schéma PUBLIC (non utilisé).
DROP SCHEMA IF EXISTS health_app_db.public;

-- Création (ou modification) des schémas RAW, STAGING et COMMON.
CREATE OR ALTER schema health_app_db.raw;
CREATE OR ALTER schema health_app_db.staging;
CREATE OR ALTER schema health_app_db.common;