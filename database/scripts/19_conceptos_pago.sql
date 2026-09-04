USE AsiloDB;
GO

-- =============================================
-- TABLA: ConceptosPago
-- Descripción:
-- Almacena el catálogo de conceptos o servicios
-- que pueden generar un cobro dentro del sistema.
-- =============================================

CREATE TABLE ConceptosPago (

    IdConceptoPago INT IDENTITY(1,1) PRIMARY KEY,

    Nombre VARCHAR(150) NOT NULL,

    Descripcion VARCHAR(500) NULL,

    MontoSugerido DECIMAL(12,2) NULL,

    Estado BIT NOT NULL DEFAULT 1,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT UQ_ConceptosPago_Nombre
        UNIQUE (Nombre),

    CONSTRAINT CK_ConceptosPago_Monto
        CHECK (MontoSugerido IS NULL OR MontoSugerido >= 0)
);
GO