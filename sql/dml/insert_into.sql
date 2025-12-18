COPY INTO RAW.RAW_EVENTS (event_timestamp, process_name, process_id, message)
FROM
(SELECT
    $1 AS event_timestamp,
    $2 AS process_name,
    $3 AS process_id,
    $4 AS message
FROM @common.internal_stage);