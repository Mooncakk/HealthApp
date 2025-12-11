#Creation de la connection
touch ./config.toml && \
snow --config-file ./config.toml connection add \
  --connection-name default \
  --user deployment_user \
  --authenticator SNOWFLAKE_JWT \
  --private-key ./rsa_key.p8 \
  --role dev_sec_ops_role \
  --no-interactive
chown $USER "config.toml" && \
chmod 0600 "config.toml"
