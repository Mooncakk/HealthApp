#Lancement des scripts de création des taches, finalizer et les active
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/tasks.sql \
  --warehouse HEALTH_APP_WH \
  --database HEALTH_APP_DB \
  --role app_rl