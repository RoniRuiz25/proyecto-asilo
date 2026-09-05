USE AsiloDB;
GO

CREATE VIEW VW_InventarioFarmacia
AS

SELECT

    M.IdMedicamento,

    M.Nombre AS Medicamento,

    M.Descripcion,

    M.Presentacion,

    I.CantidadDisponible,

    I.StockMinimo,

    CASE

        WHEN I.CantidadDisponible <= 0
        THEN 'Agotado'

        WHEN I.CantidadDisponible <= I.StockMinimo
        THEN 'Stock Bajo'

        ELSE 'Disponible'

    END AS EstadoInventario

FROM Medicamentos M

INNER JOIN InventarioMedicamentos I
    ON M.IdMedicamento = I.IdMedicamento;
GO