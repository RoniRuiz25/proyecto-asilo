USE AsiloDB;
GO

-- =============================================
-- TABLA: MovimientosCaja
-- Descripción:
-- Registra todos los ingresos, egresos y ajustes
-- financieros realizados dentro del asilo.
-- =============================================

CREATE TABLE MovimientosCaja (

    IdMovimientoCaja INT IDENTITY(1,1) PRIMARY KEY,

    IdPago INT NULL,

    IdDonacion INT NULL,

    IdUsuario INT NOT NULL,

    TipoMovimiento VARCHAR(20) NOT NULL,

    Concepto VARCHAR(200) NOT NULL,

    Monto DECIMAL(12,2) NOT NULL,

    FechaMovimiento DATETIME NOT NULL DEFAULT GETDATE(),

    MetodoPago VARCHAR(30) NULL,

    NumeroReferencia VARCHAR(100) NULL,

    Observaciones VARCHAR(500) NULL,

    Estado VARCHAR(20) NOT NULL DEFAULT 'Registrado',

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_MovimientosCaja_Pagos
        FOREIGN KEY (IdPago)
        REFERENCES Pagos(IdPago),

    CONSTRAINT FK_MovimientosCaja_Donaciones
        FOREIGN KEY (IdDonacion)
        REFERENCES Donaciones(IdDonacion),

    CONSTRAINT FK_MovimientosCaja_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario),

    CONSTRAINT CK_MovimientosCaja_Tipo
        CHECK (
            TipoMovimiento IN
            (
                'Ingreso',
                'Egreso',
                'Ajuste'
            )
        ),

    CONSTRAINT CK_MovimientosCaja_Monto
        CHECK (Monto > 0),

    CONSTRAINT CK_MovimientosCaja_Estado
        CHECK (
            Estado IN
            (
                'Registrado',
                'Anulado'
            )
        )
);
GO