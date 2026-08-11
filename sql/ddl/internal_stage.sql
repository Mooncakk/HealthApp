-- Création (ou modification) du stage interne utilisant le format de fichier CSV.
CREATE OR ALTER STAGE common.internal_stage
FILE_FORMAT = common.csv_file;