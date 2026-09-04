USE AsiloDB;
GO

-- =============================================
-- TABLA: InventarioMedicamentos
-- Descripción:
-- Controla los lotes y existencias de medicamentos
-- disponibles en farmacia.
-- =============================================

CREATE TABLE InventarioMedicamentos (

    IdInventario INT IDENTITY(1,1) PRIMARY KEY,

    IdMedicamento INT NOT NULL,

    NumeroLote VARCHAR(100) NULL,

    FechaVencimiento DATE NULL,

    CantidadDisponible INT NOT NULL DEFAULT 0,

    StockMinimo INT NOT NULL DEFAULT 10,

    Ubicacion VARCHAR(100) NULL,

    Estado BIT NOT NULL DEFAULT 1,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT FK_InventarioMedicamentos_Medicamentos
        FOREIGN KEY (IdMedicamento)
        REFERENCES Medicamentos(IdMedicamento),

    CONSTRAINT CK_Inventario_Cantidad
        CHECK (CantidadDisponible >= 0),

    CONSTRAINT CK_Inventario_StockMinimo
        CHECK (StockMinimo >= 0)
);
GO