-- Stream permettant de capturer uniquement les nouvelles lignes insérées
-- dans la table RAW.RAW_EVENTS.
CREATE OR REPLACE STREAM COMMON.RAW_EVENTS_STREAM
ON TABLE raw.raw_events
APPEND_ONLY = TRUE;
