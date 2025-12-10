-- Essaie de construire cette fonction et reviens voir la correction
CREATE OR REPLACE FUNCTION raw.extract_log_message(message STRING)
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.12'
  HANDLER = 'extract_log_trigger'
AS $$
def extract_log_trigger(message: str):
       msg_trigger = message.strip().split(" ")[0].split(":")[0].split("=")[0].strip()
       return message.replace(msg_trigger, "").strip()
$$;
