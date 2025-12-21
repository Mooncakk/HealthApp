COPY INTO RAW.RAW_EVENTS (event_timestamp, process_name, process_id, message, SOURCE_FILENAME, FILE_CREATED_TIME)
FROM
(SELECT
    $1 AS event_timestamp,
    $2 AS process_name,
    $3 AS process_id,
    $4 AS message,
    METADATA$FILENAME AS SOURCE_FILENAME,
    METADATA$FILE_LAST_MODIFIED AS FILE_CREATED_TIME
FROM @common.internal_stage);