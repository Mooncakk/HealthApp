#Creation de la connection, si elle n'existe pas
if [ ! -f ./connection/config.toml ]; then
  touch ./connection/config.toml && \
  snow --config-file ./connection/config.toml connection add \
  --connection-name default \
  --user deployment_user \
  --authenticator SNOWFLAKE_JWT \
  --private-key ./connection/rsa_key.p8 \
  --role dev_sec_ops_role \
  --no-interactive
fi && \
chown $USER "connection/config.toml" && \
chmod 0600 "connection/config.toml"
