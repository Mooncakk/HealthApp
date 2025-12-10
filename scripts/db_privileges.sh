#Attribution des privileges sur la base de donnée
snow sql -f sql/rbac/dev_sec_ops_privileges.sql \
--temporary-connection \
--account CXB69141 \
--user admin