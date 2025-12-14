#Creation de la connection
touch ./connection/config.toml && \&& \
snow --config-file ./connection/config.toml connection add \
  --connection-name default \
  --user deployment_user \
  --authenticator SNOWFLAKE_JWT \
  --private-key ./connection/rsa_key.p8 \
  --role dev_sec_ops_role \
  --no-interactive && \
chown $USER "connection/config.toml" && \
chmod 0600 "connection/config.toml"
