USE AsiloDB;
GO

CREATE PROCEDURE SP_ObtenerPacientes
AS
BEGIN

    SET NOCOUNT ON;

    SELECT *
    FROM VW_Pacientes
    ORDER BY Apellidos, Nombres;

END;
GO