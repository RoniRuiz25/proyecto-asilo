USE AsiloDB;
GO

CREATE PROCEDURE SP_BuscarPaciente

    @TextoBusqueda VARCHAR(150)

AS
BEGIN

    SET NOCOUNT ON;

    SELECT *

    FROM VW_Pacientes

    WHERE
        Nombres LIKE '%' + @TextoBusqueda + '%'

        OR

        Apellidos LIKE '%' + @TextoBusqueda + '%'

    ORDER BY Apellidos, Nombres;

END;
GO