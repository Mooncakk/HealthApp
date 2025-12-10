-- Création d'un pipe d'ingestion automatique
CREATE PIPE raw.load_raw_data
  AUTO_INGEST = TRUE
  AS
    COPY INTO RAW.RAW_EVENTS (event_timestamp, process_name, process_id, message)
    FROM
    (SELECT
        $1 AS event_timestamp,
        $2 AS process_name,
        $3 AS process_id,
        $4 AS message
    FROM @raw.internal_stage)
  FILE_FORMAT = raw.csv_file;

-- Monitoring du chargement des données par Snowpipe
select *
from table(
    information_schema.copy_history(
        TABLE_NAME=>'raw_events',
        START_TIME=> DATEADD(hours, -1, CURRENT_TIMESTAMP()
        )
    )
);