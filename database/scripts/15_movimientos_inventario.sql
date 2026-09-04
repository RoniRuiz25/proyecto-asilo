USE AsiloDB;
GO

-- =============================================
-- TABLA: MovimientosInventario
-- Descripción:
-- Registra todas las entradas y salidas
-- realizadas sobre el inventario de medicamentos.
-- =============================================

CREATE TABLE MovimientosInventario (

    IdMovimiento INT IDENTITY(1,1) PRIMARY KEY,

    IdInventario INT NOT NULL,

    IdUsuario INT NOT NULL,

    TipoMovimiento VARCHAR(20) NOT NULL,

    Cantidad INT NOT NULL,

    Motivo VARCHAR(255) NULL,

    FechaMovimiento DATETIME NOT NULL DEFAULT GETDATE(),

    Observaciones VARCHAR(500) NULL,

    CONSTRAINT FK_MovimientosInventario_Inventario
        FOREIGN KEY (IdInventario)
        REFERENCES InventarioMedicamentos(IdInventario),

    CONSTRAINT FK_MovimientosInventario_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario),

    CONSTRAINT CK_MovimientosInventario_Tipo
        CHECK (TipoMovimiento IN ('Entrada', 'Salida', 'Ajuste')),

    CONSTRAINT CK_MovimientosInventario_Cantidad
        CHECK (Cantidad > 0)
);
GO