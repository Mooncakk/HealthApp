CREATE OR ALTER role dev_ops_role;
CREATE OR ALTER role engineer_role;
CREATE OR ALTER role app_role;

GRANT ROLE dev_ops_role TO USER DEPLOYMENT_USER;
GRANT ROLE engineer_role TO USER DEPLOYMENT_USER;
GRANT ROLE app_role TO USER DEPLOYMENT_USER;

-- DevOps role
GRANT ALL ON SCHEMA health_app.raw to role dev_ops_role;
GRANT ALL ON SCHEMA health_app.staging to role dev_ops_role;
GRANT ALL ON SCHEMA health_app.common to role dev_ops_role;

-- Engineer role
GRANT SELECT ON FUTURE TABLES in schema health_app.raw to role engineer_role;
GRANT SELECT ON FUTURE TABLES in schema health_app.staging to role engineer_role;
GRANT SELECT ON FUTURE TABLES in schema health_app.common to role engineer_role;

-- App role
GRANT SELECT ON FUTURE TABLES in schema health_app.raw to role app_role;
GRANT SELECT ON FUTURE TABLES in schema health_app.staging to role app_role;
GRANT SELECT ON FUTURE TABLES in schema health_app.common to role app_role;

GRANT INSERT ON FUTURE TABLES in schema health_app.raw to role app_role;
GRANT INSERT ON FUTURE TABLES in schema health_app.staging to role app_role;
GRANT INSERT ON FUTURE TABLES in schema health_app.common to role app_role;

GRANT CREATE TASK ON SCHEMA health_app.raw TO ROLE app_role;
GRANT EXECUTE TASK ON ACCOUNT TO ROLE app_role;

