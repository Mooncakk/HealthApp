CREATE OR ALTER role dev_ops_rl;
CREATE OR ALTER role engineer_rl;
CREATE OR ALTER role app_rl;

GRANT ROLE dev_ops_rl TO USER DEPLOYMENT_USER;
GRANT ROLE engineer_rl TO USER DEPLOYMENT_USER;
GRANT ROLE app_rl TO USER DEPLOYMENT_USER;

-- DevOps role
GRANT ALL ON SCHEMA health_app_db.raw to role dev_ops_rl;
GRANT ALL ON SCHEMA health_app_db.staging to role dev_ops_rl;
GRANT ALL ON SCHEMA health_app_db.common to role dev_ops_rl;

-- Engineer role
GRANT SELECT ON FUTURE TABLES in schema health_app_db.raw to role engineer_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.staging to role engineer_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.common to role engineer_rl;

-- App role
GRANT USAGE ON WAREHOUSE HEALTH_APP_WH TO ROLE app_rl;
GRANT USAGE ON DATABASE health_app_db TO ROLE app_rl;
GRANT USAGE ON SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT USAGE ON SCHEMA health_app_db.RAW TO ROLE app_rl;
GRANT USAGE ON SCHEMA health_app_db.STAGING TO ROLE app_rl;

GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT READ ON FUTURE STAGES IN SCHEMA health_app_db.COMMON TO ROLE app_rl;
GRANT SELECT ON FUTURE STREAMS IN SCHEMA health_app_db.COMMON TO ROLE app_rl;

GRANT SELECT ON FUTURE TABLES in schema health_app_db.raw to role app_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.staging to role app_rl;
GRANT SELECT ON FUTURE TABLES in schema health_app_db.common to role app_rl;

GRANT INSERT ON FUTURE TABLES in schema health_app_db.raw to role app_rl;
GRANT INSERT ON FUTURE TABLES in schema health_app_db.staging to role app_rl;
GRANT INSERT ON FUTURE TABLES in schema health_app_db.common to role app_rl;

GRANT CREATE TASK ON SCHEMA health_app_db.common TO ROLE app_rl;
GRANT EXECUTE TASK ON ACCOUNT TO ROLE app_rl;

