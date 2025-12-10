CREATE OR REPLACE FUNCTION raw.extract_log_trigger(message STRING)
  RETURNS STRING
  LANGUAGE PYTHON
  RUNTIME_VERSION = '3.12'
  HANDLER = 'extract_log_trigger'
AS $$
def extract_log_trigger(message: str):
       return message.strip().split(" ")[0].split(":")[0].split("=")[0].strip()
$$;