#Chargement du fichier dans le stage
snow --config-file ./connection/config.toml \
  stage copy ./dataset/HealthApp_2k.log @common.internal_stage \
  --warehouse HEALTH_APP_WH \
  --database HEALTH_APP_DB \
  --role app_rl && \

#Insertion des données dans la table raw.raw_events
snow --config-file ./connection/config.toml sql \
  -f ./sql/dml/copy_into.sql \
  --warehouse HEALTH_APP_WH \
  --database HEALTH_APP_DB \
  --role app_rl

