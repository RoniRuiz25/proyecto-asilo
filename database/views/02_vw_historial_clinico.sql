USE AsiloDB;
GO

CREATE VIEW VW_HistorialClinico
AS

SELECT

    P.IdPaciente,

    P.Nombres + ' ' + P.Apellidos AS Paciente,

    C.IdConsulta,

    C.FechaConsulta,

    C.MotivoConsulta,

    C.Diagnostico,

    C.Tratamiento,

    U.Nombre + ' ' + U.Apellido AS MedicoResponsable

FROM Pacientes P

INNER JOIN ConsultasMedicas C
    ON P.IdPaciente = C.IdPaciente

INNER JOIN Usuarios U
    ON C.IdUsuario = U.IdUsuario;
GO