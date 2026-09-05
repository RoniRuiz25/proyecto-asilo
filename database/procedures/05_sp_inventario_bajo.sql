USE AsiloDB;
GO

CREATE PROCEDURE SP_ObtenerInventarioBajo
AS
BEGIN

    SET NOCOUNT ON;

    SELECT *

    FROM VW_InventarioFarmacia

    WHERE EstadoInventario IN
    (
        'Agotado',
        'Stock Bajo'
    );

END;
GO