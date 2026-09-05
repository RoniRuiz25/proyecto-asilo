USE AsiloDB;
GO

CREATE VIEW VW_Donaciones
AS

SELECT

    D.IdDonacion,

    DO.Nombre AS Donante,

    DO.TipoDonante,

    D.TipoDonacion,

    D.Monto,

    D.Descripcion,

    D.FechaDonacion,

    D.Estado,

    U.Nombre + ' ' + U.Apellido AS RegistradoPor

FROM Donaciones D

INNER JOIN Donantes DO
    ON D.IdDonante = DO.IdDonante

INNER JOIN Usuarios U
    ON D.IdUsuario = U.IdUsuario;
GO