-- Création du stage
CREATE OR ALTER STAGE raw.internal_stage
FILE_FORMAT = (TYPE = CSV, FIELD_DELIMITER='|', TIMESTAMP_FORMAT='YYYYMMDD-HH24:MI:SS:FF3')
-- ou, une fois le file format créé
-- FILE_FORMAT = raw.csv_file
;

-- Voir les options du stage
desc stage raw.internal_stage;

-- Voir les fichiers dans le stage
List @raw.internal_stage;

-- Chargement 1: avec COPY INTO
COPY INTO RAW.RAW_EVENTS (event_timestamp, process_name, process_id, message)
FROM
(SELECT
    $1 AS event_timestamp,
    $2 AS process_name,
    $3 AS process_id,
    $4 AS message
FROM @raw.internal_stage);

-- Chargement 2: avec INSERT INTO
INSERT INTO raw.raw_events
SELECT
    $1 AS event_timestamp,
    $2 AS process_name,
    $3 AS process_id,
    $4 AS message
FROM @raw.internal_stage;
