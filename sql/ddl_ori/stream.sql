CREATE STREAM raw.raw_events_stream ON TABLE raw.raw_events APPEND_ONLY = TRUE;

INSERT INTO raw.raw_events (event_timestamp, process_name, process_id, message)
VALUES
('2017-12-23 22:15:29.606'::TIMESTAMP, 'Step_LSC', 30002312, 'onStandStepChanged 3579');