USE AsiloDB;
GO

CREATE VIEW VW_BalanceCaja
AS

SELECT

    CAST(FechaMovimiento AS DATE) AS Fecha,

    SUM(
        CASE
            WHEN TipoMovimiento = 'Ingreso'
            THEN Monto
            ELSE 0
        END
    ) AS TotalIngresos,

    SUM(
        CASE
            WHEN TipoMovimiento = 'Egreso'
            THEN Monto
            ELSE 0
        END
    ) AS TotalEgresos,

    SUM(
        CASE
            WHEN TipoMovimiento = 'Ingreso'
            THEN Monto

            WHEN TipoMovimiento = 'Egreso'
            THEN -Monto

            ELSE 0
        END
    ) AS Balance

FROM MovimientosCaja

WHERE Estado = 'Registrado'

GROUP BY CAST(FechaMovimiento AS DATE);
GO