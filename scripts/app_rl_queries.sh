#Chargement du fichier dans le stage
snow --config-file ./connection/config.toml \
  stage copy ./dataset/HealthApp_2k.log @common.internal_stage \
  --warehouse HEALTH_APP_WH \
  --database HEALTH_APP_DB \
  --role app_rl && \

#Création des taches et finalizer
#Insertion des données
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/tasks.sql \
  -f ./sql/dml/copy_into.sql \
  --warehouse HEALTH_APP_WH \
  --database HEALTH_APP_DB \
  --role app_rl

