USE AsiloDB;
GO

-- =============================================
-- TABLA: Donantes
-- Descripción:
-- Almacena la información de las personas,
-- empresas o instituciones que realizan
-- donaciones al asilo.
-- =============================================

CREATE TABLE Donantes (

    IdDonante INT IDENTITY(1,1) PRIMARY KEY,

    TipoDonante VARCHAR(20) NOT NULL,

    Nombre VARCHAR(200) NOT NULL,

    Telefono VARCHAR(20) NULL,

    Correo VARCHAR(150) NULL,

    Direccion VARCHAR(250) NULL,

    Estado BIT NOT NULL DEFAULT 1,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT CK_Donantes_Tipo
        CHECK (TipoDonante IN ('Persona', 'Empresa', 'Institucion'))
);
GO