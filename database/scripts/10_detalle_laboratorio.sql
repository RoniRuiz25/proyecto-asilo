USE AsiloDB;
GO

-- =============================================
-- TABLA: DetalleLaboratorio
-- Descripción:
-- Almacena los exámenes y resultados asociados
-- a una solicitud de laboratorio.
-- =============================================

CREATE TABLE DetalleLaboratorio (

    IdDetalleLaboratorio INT IDENTITY(1,1) PRIMARY KEY,

    IdSolicitudLaboratorio INT NOT NULL,

    NombreExamen VARCHAR(150) NOT NULL,

    Resultado VARCHAR(500) NULL,

    ValoresReferencia VARCHAR(250) NULL,

    FechaResultado DATETIME NULL,

    Estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',

    Observaciones VARCHAR(500) NULL,

    CONSTRAINT FK_DetalleLaboratorio_Solicitud
        FOREIGN KEY (IdSolicitudLaboratorio)
        REFERENCES SolicitudesLaboratorio(IdSolicitudLaboratorio),

    CONSTRAINT CK_DetalleLaboratorio_Estado
        CHECK (Estado IN ('Pendiente', 'Procesado', 'Entregado'))
);
GO