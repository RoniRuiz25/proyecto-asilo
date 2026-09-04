USE AsiloDB;
GO

-- =============================================
-- TABLA: RecetasMedicas
-- Descripción:
-- Almacena las recetas médicas generadas
-- durante las consultas.
-- =============================================

CREATE TABLE RecetasMedicas (

    IdReceta INT IDENTITY(1,1) PRIMARY KEY,

    IdConsulta INT NOT NULL,

    FechaReceta DATETIME NOT NULL DEFAULT GETDATE(),

    IndicacionesGenerales VARCHAR(1000) NULL,

    Estado VARCHAR(20) NOT NULL DEFAULT 'Activa',

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_RecetasMedicas_Consultas
        FOREIGN KEY (IdConsulta)
        REFERENCES ConsultasMedicas(IdConsulta),

    CONSTRAINT CK_RecetasMedicas_Estado
        CHECK (Estado IN ('Activa', 'Finalizada', 'Cancelada'))
);
GO