CREATE OR REPLACE PROCEDURE raw.enrich_data()
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
BEGIN
        INSERT INTO staging.step_lsc (event_timestamp, process_id, log_trigger, message)
        WITH
            source AS
                (SELECT
                    event_timestamp,
                    process_name,
                    process_id,
                    raw.extract_log_trigger(message) AS log_trigger,
                    raw.extract_log_message(message) as message
                FROM raw.raw_events
                WHERE process_name = 'Step_LSC')
        SELECT
            event_timestamp,
            process_id,
            log_trigger,
            message
        FROM source;
END;
$$;


-- Une procédure un peu plus complète
CREATE OR REPLACE PROCEDURE raw.enrich_data(table_name STRING, process_name STRING)
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    full_table_name STRING := CONCAT('staging.', :table_name);
BEGIN
    LET sql_row_count_var INT := 0;
    INSERT INTO IDENTIFIER(:full_table_name) (event_timestamp, process_id, log_trigger, message)
    WITH
        source AS
            (SELECT
                event_timestamp,
                process_name,
                process_id,
                raw.extract_log_trigger(message) AS log_trigger,
                raw.extract_log_message(message) as message
            FROM raw.raw_events
            WHERE process_name = :process_name)
    SELECT
        event_timestamp,
        process_id,
        log_trigger,
        message
    FROM source;
    sql_row_count_var := SQLROWCOUNT;
    return :sql_row_count_var;
END;
$$;


-- Procédure pour identifier les nouvelles données
CREATE OR REPLACE PROCEDURE raw.identify_new_data(table_name STRING, process_name STRING)
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
    INSERT INTO raw.data_to_process (event_timestamp,process_name,process_id,message)
    (SELECT event_timestamp, process_name, process_id, message FROM raw.raw_events_stream);
$$;