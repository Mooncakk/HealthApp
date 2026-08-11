-- Création (ou modification) du format de fichier CSV utilisé pour le chargement des données
-- (délimiteur '|' et format de timestamp personnalisé).
CREATE OR ALTER FILE FORMAT common.csv_file
TYPE=CSV
FIELD_DELIMITER='|'
TIMESTAMP_FORMAT='YYYYMMDD-HH24:MI:SS:FF3';
