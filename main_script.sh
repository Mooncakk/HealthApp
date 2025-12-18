sh scripts/devsecops_role_creation.sh && \

sh connection/config_snow_cli.sh && \

sh scripts/db_creation.sh && \

sh scripts/db_privileges.sh && \

snow --config-file ./connection/config.toml sql -f sql/rbac/roles_creation.sql && \

sh scripts/devops_queries.sh && \

snow --config-file ./connection/config.toml sql -f sql/rbac/grant_truncate.sql && \

sh scripts/app_role_queries.sh
