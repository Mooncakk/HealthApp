INSERT INTO staging.step_lsc (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'Step_LSC')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.hih_listener_manager (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'HiH_ListenerManager')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.hih_hi_broadcast_util (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'HiH_HiBroadcastUtil')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.step_stand_step_counter (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'Step_StandStepCounter')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.step_sp_utils (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'Step_SPUtils')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.hih_hi_health_data_insert_store (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'HiH_HiHealthDataInsertStore')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.hih_data_stat_manager (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'HiH_DataStatManager')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.hih_hi_sync_util (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'HiH_HiSyncUtil')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.step_stand_report_receiver (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'Step_StandReportReceiver')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

INSERT INTO staging.step_screen_util (event_timestamp, process_id, log_trigger, message)
WITH
    source AS
        (SELECT
            event_timestamp,
            process_name,
            process_id,
            raw.extract_log_trigger(message) as log_trigger,
            raw.extract_log_message(message) as message,
        FROM raw.raw_events
        WHERE process_name = 'Step_ScreenUtil')
SELECT
    event_timestamp,
    process_id,
    log_trigger,
    message
FROM source;

