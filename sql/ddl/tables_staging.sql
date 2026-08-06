CREATE OR ALTER TABLE staging.hih_listener_manager (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER TABLE staging.hih_hi_broadcast_util (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER TABLE staging.step_stand_step_counter (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER TABLE staging.step_sp_utils (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER TABLE staging.step_lsc (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER  TABLE staging.hih_hi_health_data_insert_store (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER TABLE staging.hih_data_stat_manager (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER  TABLE staging.hih_hi_sync_util (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER  TABLE staging.step_stand_report_receiver (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR ALTER TABLE staging.step_screen_util (
    event_timestamp TIMESTAMP,
    log_trigger STRING,
    process_id NUMBER,
    message STRING,
    source_filename STRING,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);