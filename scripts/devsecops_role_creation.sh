#Creation du role dev_sec_ops_role
snow sql -f sql/rbac/dev_sec_ops_role_creation.sql \
--temporary-connection \
--account CXB69141 \
--user admin