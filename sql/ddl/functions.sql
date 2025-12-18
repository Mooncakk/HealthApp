CREATE OR REPLACE FUNCTION COMMON.EXTRACT_LOG_TRIGGER("MESSAGE" VARCHAR)
RETURNS VARCHAR
LANGUAGE PYTHON
RUNTIME_VERSION = '3.12'
HANDLER = 'extract_log_trigger'
AS '
def extract_log_trigger(message: str) -> str:
    return message.strip().split('' '')[0].split('':'')[0].split(''='')[0].strip()
';


CREATE OR REPLACE FUNCTION COMMON.EXTRACT_LOG_MESSAGE("MESSAGE" VARCHAR)
RETURNS VARCHAR
LANGUAGE PYTHON
RUNTIME_VERSION = '3.12'
HANDLER = 'extract_log_message'
AS '
def extract_log_message(message: str) -> str:
    msg_trigger = message.strip().split(" ")[0].split(":")[0].split("=")[0].strip()
    return message.replace(msg_trigger, "").strip()
';


CREATE OR REPLACE FUNCTION COMMON.CHECK_CORRECT_TIMESTAMP("EVENT_TIMESTAMP" TIMESTAMP_NTZ(9))
RETURNS BOOLEAN
LANGUAGE SQL
AS '
    event_timestamp > ''2016-01-01 00:00:00''::TIMESTAMP AND event_timestamp <= current_timestamp()
';


CREATE OR REPLACE FUNCTION COMMON.CHECK_CORRECT_PROCESS_NAME("PROCESS_NAME" VARCHAR)
RETURNS BOOLEAN
LANGUAGE SQL
AS '
    PROCESS_NAME IN (
        ''Step_LSC'',
        ''Step_HGNH'',
        ''HiH_HiSyncUtil'',
        ''HiH_ListenerManager'',
        ''Step_StandStepCounter'',
        ''Step_ScreenUtil'',
        ''HiH_'',
        ''Step_StandStepDataManager'',
        ''HiH_HiHealthBinder'',
        ''Step_DataCache'',
        ''Step_ExtSDM'',
        ''HiH_HiHealthDataInsertStore'',
        ''HiH_HiSyncControl'',
        ''HiH_HiBroadcastUtil'',
        ''Step_StandReportReceiver'',
        ''Step_SPUtils'',
        ''HiH_DataStatManager'',
        ''HiH_HiAppUtil'',
        ''Step_FlushableStepDataCache'',
        ''Step_NotificationUtil''
    )
';

--CHECK SI LA DONNÉE A PLUS DE 5 JOURS
CREATE OR ALTER FUNCTION COMMON.ARRIVEE_TARDIVE (EVENT_TIMESTAMP TIMESTAMP)
RETURNS BOOLEAN
LANGUAGE SQL
AS
'
    EVENT_TIMESTAMP < TIMESTAMPADD(DAYS, -6, CURRENT_TIMESTAMP())
'
;