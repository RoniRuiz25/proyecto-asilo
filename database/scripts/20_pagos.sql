USE AsiloDB;
GO

-- =============================================
-- TABLA: Pagos
-- Descripción:
-- Registra los pagos realizados por los pacientes,
-- familiares o responsables.
-- =============================================

CREATE TABLE Pagos (

    IdPago INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL,

    IdFamiliar INT NULL,

    IdConceptoPago INT NOT NULL,

    IdUsuario INT NOT NULL,

    FechaPago DATETIME NOT NULL DEFAULT GETDATE(),

    Monto DECIMAL(12,2) NOT NULL,

    MetodoPago VARCHAR(30) NOT NULL,

    NumeroReferencia VARCHAR(100) NULL,

    Observaciones VARCHAR(500) NULL,

    Estado VARCHAR(20) NOT NULL DEFAULT 'Pagado',

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Pagos_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente),

    CONSTRAINT FK_Pagos_Familiares
        FOREIGN KEY (IdFamiliar)
        REFERENCES Familiares(IdFamiliar),

    CONSTRAINT FK_Pagos_ConceptosPago
        FOREIGN KEY (IdConceptoPago)
        REFERENCES ConceptosPago(IdConceptoPago),

    CONSTRAINT FK_Pagos_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario),

    CONSTRAINT CK_Pagos_Monto
        CHECK (Monto > 0),

    CONSTRAINT CK_Pagos_MetodoPago
        CHECK (
            MetodoPago IN
            (
                'Efectivo',
                'Transferencia',
                'Deposito',
                'Tarjeta',
                'Otro'
            )
        ),

    CONSTRAINT CK_Pagos_Estado
        CHECK (
            Estado IN
            (
                'Pendiente',
                'Pagado',
                'Anulado'
            )
        )
);
GO