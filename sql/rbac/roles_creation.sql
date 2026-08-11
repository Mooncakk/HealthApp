-- Création (ou mise à jour) des rôles utilisés par l'application.
CREATE OR ALTER role dev_ops_rl;
CREATE OR ALTER role engineer_rl;
CREATE OR ALTER role app_rl;

-- Attribution des rôles au compte de déploiement.
GRANT ROLE dev_ops_rl TO USER DEPLOYMENT_USER;
GRANT ROLE engineer_rl TO USER DEPLOYMENT_USER;
GRANT ROLE app_rl TO USER DEPLOYMENT_USER;

-- Autorisations complètes sur les schémas pour le rôle DevOps.
GRANT ALL ON SCHEMA health_app_db.raw to role dev_ops_rl;
GRANT ALL ON SCHEMA health_app_db.staging to role dev_ops_rl;
GRANT ALL ON SCHEMA health_app_db.common to role dev_ops_rl;

-- Autorisations de lecture sur les futures tables pour le rôle Data Engineer.
GRANT SELECT ON FUTURE TABLES in schema health_app_db.raw to role engineer_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.staging to role engineer_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.common to role engineer_rl;

-- Autorisations nécessaires au fonctionnement de l'application accordé à app_rl.
GRANT USAGE ON WAREHOUSE HEALTH_APP_WH TO ROLE app_rl;
GRANT USAGE ON DATABASE health_app_db TO ROLE app_rl;
GRANT USAGE ON SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT USAGE ON SCHEMA health_app_db.RAW TO ROLE app_rl;
GRANT USAGE ON SCHEMA health_app_db.STAGING TO ROLE app_rl;

-- Accès aux futurs objets du schéma COMMON.
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT READ ON FUTURE STAGES IN SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT SELECT ON FUTURE STREAMS IN SCHEMA health_app_db.COMMON TO ROLE app_rl;

-- Autorisations de lecture sur les futures tables.
GRANT SELECT ON FUTURE TABLES in schema health_app_db.raw to role app_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.staging to role app_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.common to role app_rl;

-- Autorisations d'insertion sur les futures tables.
GRANT INSERT ON FUTURE TABLES in schema health_app_db.raw to role app_rl;
GRANT INSERT ON FUTURE TABLES in schema health_app_db.staging to role app_rl;
GRANT INSERT ON FUTURE TABLES in schema health_app_db.common to role app_rl;

-- Autorisations de création et d'exécution des tâches Snowflake.
GRANT CREATE TASK ON SCHEMA health_app_db.common TO ROLE app_rl;
GRANT EXECUTE TASK ON ACCOUNT TO ROLE app_rl;
