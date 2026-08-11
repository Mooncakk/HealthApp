#Chargement du dataset dans le stage et ingestion des données dans la table brut.
sh connection/config_snow_cli.sh && \

sh scripts/db_creation.sh && \

snow --config-file ./connection/config.toml sql -f sql/rbac/roles_creation.sql && \

sh scripts/devops_queries.sh && \

snow --config-file ./connection/config.toml sql -f sql/rbac/grant_truncate.sql && \

sh scripts/task_creation.sh