# Exécute l'ensemble des scripts DDL nécessaires au déploiement
# des objets Snowflake de l'application.
snow --config-file ./connection/config.toml sql \
  # Création des tables de la couche RAW.
  -f sql/ddl/tables_raw.sql \
  # Création des tables de la couche STAGING.
  -f sql/ddl/tables_staging.sql \
  # Création des tables de la couche COMMON.
  -f sql/ddl/tables_common.sql \
  # Création du format de fichier utilisé lors des chargements.
  -f sql/ddl/file_format.sql \
  # Création du stage interne.
  -f sql/ddl/internal_stage.sql \
  # Création des fonctions SQL.
  -f sql/ddl/functions.sql \
  # Création des procédures stockées.
  -f sql/ddl/procedures.sql \
  # Création des streams.
  -f sql/ddl/stream.sql \
  # Warehouse utilisé pour l'exécution des requêtes.
  --warehouse HEALTH_APP_WH \
  # Base de données cible.
  --database HEALTH_APP_DB \
  # Rôle utilisé pour le déploiement.
  --role dev_ops_rl
