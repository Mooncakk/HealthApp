# Lance les scripts de création du warehouse, de la base de donnée et des schemas
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/warehouse.sql \
  -f sql/ddl/database.sql \
  -f sql/ddl/schema.sql