-- Création (ou modification) du warehouse utilisé par le projet HealthApp.
CREATE OR ALTER WAREHOUSE health_app_wh
WAREHOUSE_SIZE = XSMALL
AUTO_SUSPEND = 300
AUTO_RESUME = TRUE
COMMENT = "Warehouse pour projet HealthApp";