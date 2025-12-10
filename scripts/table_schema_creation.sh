#Creation de la base de donnée et schemas
snow --config-file ./config.toml sql -f sql/ddl/database.sql \
-f sql/ddl/schema.sql