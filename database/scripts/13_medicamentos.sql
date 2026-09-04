USE AsiloDB;
GO

-- =============================================
-- TABLA: Medicamentos
-- Descripción:
-- Almacena el catálogo general de medicamentos
-- utilizados por el asilo.
-- =============================================

CREATE TABLE Medicamentos (

    IdMedicamento INT IDENTITY(1,1) PRIMARY KEY,

    Nombre VARCHAR(150) NOT NULL,

    Descripcion VARCHAR(500) NULL,

    Presentacion VARCHAR(100) NULL,

    Concentracion VARCHAR(100) NULL,

    UnidadMedida VARCHAR(50) NULL,

    Estado BIT NOT NULL DEFAULT 1,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT UQ_Medicamentos_Nombre UNIQUE (Nombre)
);
GO