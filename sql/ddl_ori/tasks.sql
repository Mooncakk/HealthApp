CREATE OR ALTER TASK raw.data_quality_task
WAREHOUSE = COMPUTE_WH
SCHEDULE = '1 HOURS'
AS
    CALL raw.data_quality();

CREATE OR ALTER TASK raw.hih_listener_manager
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('hih_listener_manager', 'HiH_ListenerManager');


CREATE OR ALTER TASK raw.hih_hibroadcastutil
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('hih_hi_broadcast_util', 'HiH_HiBroadcastUtil');

CREATE OR ALTER TASK raw.step_standstepcounter
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('step_stand_step_counter', 'Step_StandStepCounter');

CREATE OR ALTER TASK raw.step_sputils
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('step_sp_utils', 'Step_SPUtils');

CREATE OR ALTER TASK raw.step_lsc
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('step_lsc', 'Step_LSC');

CREATE OR ALTER TASK raw.hih_hihealthdatainsertstore
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('hih_hi_health_data_insert_store', 'HiH_HiHealthDataInsertStore');

CREATE OR ALTER TASK raw.hih_datastatmanager
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('hih_data_stat_manager', 'HiH_DataStatManager');

CREATE OR ALTER TASK raw.hih_hisyncutil
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('hih_hi_sync_util', 'HiH_HiSyncUtil');

CREATE OR ALTER TASK raw.step_standreportreceiver
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('step_stand_report_receiver', 'Step_StandReportReceiver');

CREATE OR ALTER TASK raw.step_screenutil
WAREHOUSE = COMPUTE_WH
AFTER raw.data_quality_task
AS
    CALL raw.enrich_data('step_screen_util', 'Step_ScreenUtil');


ALTER TASK raw.hih_listener_manager RESUME;
ALTER TASK raw.hih_hibroadcastutil RESUME;
ALTER TASK raw.step_standstepcounter RESUME;
ALTER TASK raw.step_sputils RESUME;
ALTER TASK raw.step_lsc RESUME;
ALTER TASK raw.hih_hihealthdatainsertstore RESUME;
ALTER TASK raw.hih_datastatmanager RESUME;
ALTER TASK raw.hih_hisyncutil RESUME;
ALTER TASK raw.step_standreportreceiver RESUME;
ALTER TASK raw.step_screenutil RESUME;

EXECUTE TASK raw.data_quality_task;

SELECT *
  FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(
    SCHEDULED_TIME_RANGE_START=>DATEADD('hour',-1,current_timestamp())
    ));