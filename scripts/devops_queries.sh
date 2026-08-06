
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/tables_raw.sql \
  -f sql/ddl/tables_staging.sql \
  -f sql/ddl/tables_common.sql \
  -f sql/ddl/file_format.sql \
  -f sql/ddl/internal_stage.sql \
  -f sql/ddl/functions.sql \
  -f sql/ddl/procedures.sql \
  -f sql/ddl/stream.sql \
  --warehouse HEALTH_APP_WH \
  --database HEALTH_APP_DB \
  --role dev_ops_rl