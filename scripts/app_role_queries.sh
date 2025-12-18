#Chargement du fichier dans le stage
snow --config-file ./connection/config.toml \
  stage copy ./dataset/HealthApp_2k.log @common.internal_stage \
  --warehouse ADA_COMPUTE \
  --database HEALTH_APP \
  --role app_role && \

#Création des taches et finalizer
#Insertion des données
snow --config-file ./connection/config.toml sql \
  -f sql/ddl/tasks.sql \
  -f ./sql/dml/insert_into.sql \
  --warehouse ADA_COMPUTE \
  --database HEALTH_APP \
  --role app_role

