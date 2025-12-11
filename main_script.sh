sh scripts/devsecops_role_creation.sh && \

sh scripts/config_snow_cli.sh && \

sh scripts/db_creation.sh && \

sh scripts/db_privileges.sh && \

snow --config-file ./config.toml sql -f sql/rbac/roles_creation.sql && \

sh scripts/devops_queries.sh
