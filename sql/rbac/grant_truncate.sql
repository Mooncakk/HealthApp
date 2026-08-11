-- Autorise le rôle APP_RL à vider le contenu de la table
-- HEALTH_APP_DB.RAW.DATA_TO_PROCESS à l'aide de la commande TRUNCATE.
GRANT TRUNCATE ON TABLE HEALTH_APP_DB.RAW.DATA_TO_PROCESS TO ROLE APP_RL;
