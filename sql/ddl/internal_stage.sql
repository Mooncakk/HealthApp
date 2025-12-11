-- Création du stage
CREATE OR ALTER STAGE common.internal_stage
FILE_FORMAT = common.csv_file;