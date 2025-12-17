#Chargement du fichier dans le stage
snow --config-file ./connection/config.toml \
  stage copy ./dataset/HealthApp_2k.log @common.internal_stage \
  --warehouse ADA_COMPUTE \
  --database HEALTH_APP \
  --role app_role && \

#Création des taches et finalizer
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/tasks.sql \
  --warehouse ADA_COMPUTE \
  --database HEALTH_APP \
  --role app_role