USE AsiloDB;
GO

-- =============================================
-- TABLA: DetalleDonaciones
-- Descripción:
-- Almacena el detalle de los productos recibidos
-- en las donaciones en especie.
-- =============================================

CREATE TABLE DetalleDonaciones (

    IdDetalleDonacion INT IDENTITY(1,1) PRIMARY KEY,

    IdDonacion INT NOT NULL,

    NombreArticulo VARCHAR(200) NOT NULL,

    Descripcion VARCHAR(500) NULL,

    Cantidad INT NOT NULL,

    UnidadMedida VARCHAR(50) NULL,

    ValorEstimado DECIMAL(12,2) NULL,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_DetalleDonaciones_Donaciones
        FOREIGN KEY (IdDonacion)
        REFERENCES Donaciones(IdDonacion),

    CONSTRAINT CK_DetalleDonaciones_Cantidad
        CHECK (Cantidad > 0),

    CONSTRAINT CK_DetalleDonaciones_Valor
        CHECK (ValorEstimado IS NULL OR ValorEstimado >= 0)
);
GO