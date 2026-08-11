-- Création (ou remplacement) de la fonction qui extrait le déclencheur (premier mot-clé) d'un message de log.
CREATE OR REPLACE FUNCTION COMMON.EXTRACT_LOG_TRIGGER("MESSAGE" VARCHAR)
RETURNS VARCHAR
LANGUAGE PYTHON
RUNTIME_VERSION = '3.12'
HANDLER = 'extract_log_trigger'
AS '
def extract_log_trigger(message: str) -> str:
    return message.strip().split('' '')[0].split('':'')[0].split(''='')[0].strip()
';


-- Création (ou remplacement) de la fonction qui extrait le message de log en retirant le déclencheur identifié.
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


-- Création (ou remplacement) de la fonction qui vérifie que le timestamp de l'événement est cohérent (postérieur à 2016 et non futur).
CREATE OR REPLACE FUNCTION COMMON.CHECK_CORRECT_TIMESTAMP("EVENT_TIMESTAMP" TIMESTAMP_NTZ(9))
RETURNS BOOLEAN
LANGUAGE SQL
AS '
    event_timestamp > ''2016-01-01 00:00:00''::TIMESTAMP AND event_timestamp <= current_timestamp()
';


-- Création (ou remplacement) de la fonction qui vérifie que le nom du process fait partie de la liste des process valides.
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

-- Création (ou modification) de la fonction qui vérifie si la donnée a plus de 5 jours de retard.
CREATE OR ALTER FUNCTION COMMON.ARRIVEE_TARDIVE (EVENT_TIMESTAMP TIMESTAMP)
RETURNS BOOLEAN
LANGUAGE SQL
AS
'
    EVENT_TIMESTAMP < TIMESTAMPADD(DAYS, -6, CURRENT_TIMESTAMP())
'
;
