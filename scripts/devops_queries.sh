
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/raw_tables.sql \
  -f sql/ddl/staging_tables.sql \
  -f sql/ddl/common_tables.sql \
  -f sql/ddl/file_format.sql \
  -f sql/ddl/internal_stage.sql \
  -f sql/ddl/functions.sql \
  -f sql/ddl/procedures.sql \
  -f sql/ddl/stream.sql \
  --warehouse ADA_COMPUTE \
  --database HEALTH_APP \
  --role dev_ops_role