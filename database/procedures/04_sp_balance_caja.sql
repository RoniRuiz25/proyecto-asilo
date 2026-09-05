USE AsiloDB;
GO

CREATE PROCEDURE SP_ObtenerBalanceCaja
AS
BEGIN

    SET NOCOUNT ON;

    SELECT *
    FROM VW_BalanceCaja
    ORDER BY Fecha DESC;

END;
GO