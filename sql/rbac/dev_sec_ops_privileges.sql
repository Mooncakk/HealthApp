GRANT USAGE ON DATABASE health_app TO ROLE dev_sec_ops_role;
GRANT CREATE SCHEMA ON DATABASE health_app TO ROLE dev_sec_ops_role;
GRANT USAGE ON SCHEMA health_app.RAW TO ROLE dev_sec_ops_role;
GRANT USAGE ON SCHEMA health_app.STAGING TO ROLE dev_sec_ops_role;
GRANT USAGE ON SCHEMA health_app.COMMON TO ROLE dev_sec_ops_role;

