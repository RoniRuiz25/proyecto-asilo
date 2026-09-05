USE AsiloDB;
GO

CREATE VIEW VW_Pagos
AS

SELECT

    P.IdPago,

    PA.Nombres + ' ' + PA.Apellidos AS Paciente,

    CASE
        WHEN F.IdFamiliar IS NULL
        THEN 'No registrado'
        ELSE F.Nombres + ' ' + F.Apellidos
    END AS FamiliarResponsable,

    CP.Nombre AS Concepto,

    P.Monto,

    P.MetodoPago,

    P.NumeroReferencia,

    P.FechaPago,

    P.Estado,

    U.Nombre + ' ' + U.Apellido AS RegistradoPor

FROM Pagos P

INNER JOIN Pacientes PA
    ON P.IdPaciente = PA.IdPaciente

LEFT JOIN Familiares F
    ON P.IdFamiliar = F.IdFamiliar

INNER JOIN ConceptosPago CP
    ON P.IdConceptoPago = CP.IdConceptoPago

INNER JOIN Usuarios U
    ON P.IdUsuario = U.IdUsuario;
GO