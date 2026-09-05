USE AsiloDB;
GO

CREATE VIEW VW_Pacientes
AS

SELECT

    P.IdPaciente,

    P.Nombres,

    P.Apellidos,

    P.FechaNacimiento,

    DATEDIFF(YEAR, P.FechaNacimiento, GETDATE())
    -
    CASE
        WHEN DATEADD(
            YEAR,
            DATEDIFF(YEAR, P.FechaNacimiento, GETDATE()),
            P.FechaNacimiento
        ) > GETDATE()
        THEN 1
        ELSE 0
    END AS Edad,

    P.Sexo,

    P.Direccion,

    P.Telefono,

    P.Estado,

    P.FechaCreacion

FROM Pacientes P;
GO