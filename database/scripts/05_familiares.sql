USE AsiloDB;
GO

-- =============================================
-- TABLA: Familiares
-- Descripción:
-- Almacena la información de familiares o personas
-- responsables de los pacientes registrados.
-- =============================================

CREATE TABLE Familiares (

    IdFamiliar INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL,

    Nombres VARCHAR(100) NOT NULL,

    Apellidos VARCHAR(100) NOT NULL,

    Parentesco VARCHAR(50) NOT NULL,

    Telefono VARCHAR(20) NOT NULL,

    Correo VARCHAR(150) NULL,

    Direccion VARCHAR(255) NULL,

    EsContactoPrincipal BIT NOT NULL DEFAULT 0,

    Estado BIT NOT NULL DEFAULT 1,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT FK_Familiares_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente)
);
GO