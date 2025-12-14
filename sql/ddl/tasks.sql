CREATE OR ALTER TASK common.DATA_QUALITY_TASK
WAREHOUSE = ADA_COMPUTE
AS

DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO("CURRENT_TASK_GRAPH_RUN_GROUP_ID");
BEGIN
    CALL common.DATA_QUALITY(:GRAPH_RUN_GROUP_ID);
END;

;

CREATE OR ALTER TASK common.hih_listener_manager
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_listener_manager', 'HiH_ListenerManager', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.hih_hibroadcastutil
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_broadcast_util', 'HiH_HiBroadcastUtil', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.hih_hibroadcastutil
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_broadcast_util', 'HiH_HiBroadcastUtil', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.step_standstepcounter
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_stand_step_counter', 'Step_StandStepCounter', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.step_sputils
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_sp_utils', 'Step_SPUtils', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.step_lsc
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_lsc', 'Step_LSC', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.hih_hihealthdatainsertstore
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_health_data_insert_store', 'HiH_HiHealthDataInsertStore', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.hih_datastatmanager
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_data_stat_manager', 'HiH_DataStatManager', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.hih_hisyncutil
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_sync_util', 'HiH_HiSyncUtil', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.step_standreportreceiver
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_stand_report_receiver', 'Step_StandReportReceiver', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.step_screenutil
WAREHOUSE = ADA_COMPUTE
AFTER common.data_quality_task
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_screen_util', 'Step_ScreenUtil', :GRAPH_RUN_GROUP_ID);
END;

CREATE OR ALTER TASK common.FINALIZER_TRANSFORMATION
WAREHOUSE = ADA_COMPUTE
FINALIZE = 'common.IDENTIFY_NEW_DATA_TASK'
AS
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
    STARTED_AT TIMESTAMP := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_ORIGINAL_SCHEDULED_TIMESTAMP');
BEGIN
    CALL common.FINALIZE_TRANSFORMATION(:GRAPH_RUN_GROUP_ID, :STARTED_AT);
END;


ALTER TASK common.data_quality_task RESUME;
ALTER TASK common.hih_listener_manager RESUME;
ALTER TASK common.hih_hibroadcastutil RESUME;
ALTER TASK common.step_standstepcounter RESUME;
ALTER TASK common.step_sputils RESUME;
ALTER TASK common.step_lsc RESUME;
ALTER TASK common.hih_hihealthdatainsertstore RESUME;
ALTER TASK common.hih_datastatmanager RESUME;
ALTER TASK common.hih_hisyncutil RESUME;
ALTER TASK common.step_standreportreceiver RESUME;
ALTER TASK common.step_screenutil RESUME;

ALTER TASK common.FINALIZER_TRANSFORMATION RESUME; 