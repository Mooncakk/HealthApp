-- Création (ou modification) de la tâche déclenchée dès que le stream RAW_EVENTS_STREAM contient des données : identifie les nouvelles données à traiter.
CREATE OR ALTER TASK COMMON.IDENTIFY_NEW_DATA_TASK
WAREHOUSE=HEALTH_APP_WH
WHEN SYSTEM$STREAM_HAS_DATA('COMMON.RAW_EVENTS_STREAM')
AS
CALL common.identify_new_data();

-- Création (ou modification) de la tâche de contrôle qualité des données, exécutée après IDENTIFY_NEW_DATA_TASK.
CREATE OR ALTER TASK COMMON.DATA_QUALITY_TASK
WAREHOUSE = HEALTH_APP_WH
AFTER COMMON.IDENTIFY_NEW_DATA_TASK
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.DATA_QUALITY(:GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process HiH_ListenerManager.
CREATE OR ALTER TASK common.hih_listener_manager
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_listener_manager', 'HiH_ListenerManager', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process HiH_HiBroadcastUtil.
CREATE OR ALTER TASK common.hih_hibroadcastutil
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_broadcast_util', 'HiH_HiBroadcastUtil', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process Step_StandStepCounter.
CREATE OR ALTER TASK common.step_standstepcounter
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_stand_step_counter', 'Step_StandStepCounter', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process Step_SPUtils.
CREATE OR ALTER TASK common.step_sputils
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_sp_utils', 'Step_SPUtils', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process Step_LSC.
CREATE OR ALTER TASK common.step_lsc
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_lsc', 'Step_LSC', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process HiH_HiHealthDataInsertStore.
CREATE OR ALTER TASK common.hih_hihealthdatainsertstore
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_health_data_insert_store', 'HiH_HiHealthDataInsertStore', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process HiH_DataStatManager.
CREATE OR ALTER TASK common.hih_datastatmanager
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_data_stat_manager', 'HiH_DataStatManager', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process HiH_HiSyncUtil.
CREATE OR ALTER TASK common.hih_hisyncutil
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('hih_hi_sync_util', 'HiH_HiSyncUtil', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process Step_StandReportReceiver.
CREATE OR ALTER TASK common.step_standreportreceiver
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_stand_report_receiver', 'Step_StandReportReceiver', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche d'enrichissement des données pour le process Step_ScreenUtil.
CREATE OR ALTER TASK common.step_screenutil
WAREHOUSE = HEALTH_APP_WH
AFTER common.data_quality_task
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
BEGIN
    CALL common.enrich_data('step_screen_util', 'Step_ScreenUtil', :GRAPH_RUN_GROUP_ID);
END;
$$;

-- Création (ou modification) de la tâche finale du graphe : enregistre le statut du pipeline et vide la table des données à traiter.
CREATE OR ALTER TASK common.FINALIZER_TRANSFORMATION
WAREHOUSE = HEALTH_APP_WH
FINALIZE = 'common.IDENTIFY_NEW_DATA_TASK'
AS
EXECUTE IMMEDIATE
$$
DECLARE
    GRAPH_RUN_GROUP_ID STRING := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_RUN_GROUP_ID');
    STARTED_AT TIMESTAMP := SYSTEM$TASK_RUNTIME_INFO('CURRENT_TASK_GRAPH_ORIGINAL_SCHEDULED_TIMESTAMP');
BEGIN
    CALL common.FINALIZE_TRANSFORMATION(:GRAPH_RUN_GROUP_ID, :STARTED_AT);
END;
$$;


-- Activation (reprise) de toutes les tâches du pipeline.
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
ALTER TASK common.identify_new_data_task RESUME;
