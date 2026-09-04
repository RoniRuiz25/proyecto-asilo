USE AsiloDB;
GO

-- =============================================
-- TABLA: Donaciones
-- Descripción:
-- Registra las donaciones económicas y en especie
-- recibidas por el asilo.
-- =============================================

CREATE TABLE Donaciones (

    IdDonacion INT IDENTITY(1,1) PRIMARY KEY,

    IdDonante INT NOT NULL,

    IdUsuario INT NOT NULL,

    TipoDonacion VARCHAR(20) NOT NULL,

    FechaDonacion DATETIME NOT NULL DEFAULT GETDATE(),

    Monto DECIMAL(12,2) NULL,

    Descripcion VARCHAR(500) NULL,

    Observaciones VARCHAR(500) NULL,

    Estado VARCHAR(20) NOT NULL DEFAULT 'Registrada',

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Donaciones_Donantes
        FOREIGN KEY (IdDonante)
        REFERENCES Donantes(IdDonante),

    CONSTRAINT FK_Donaciones_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario),

    CONSTRAINT CK_Donaciones_Tipo
        CHECK (TipoDonacion IN ('Economica', 'Especie')),

    CONSTRAINT CK_Donaciones_Estado
        CHECK (Estado IN ('Registrada', 'Procesada', 'Cancelada')),

    CONSTRAINT CK_Donaciones_Monto
        CHECK (Monto IS NULL OR Monto >= 0)
);
GO