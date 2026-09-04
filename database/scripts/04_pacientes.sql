USE AsiloDB;
GO

-- =============================================
-- TABLA: Pacientes
-- Descripción:
-- Almacena la información personal y administrativa
-- de los adultos mayores registrados en el asilo.
-- =============================================

CREATE TABLE Pacientes (

    IdPaciente INT IDENTITY(1,1) PRIMARY KEY,

    Nombres VARCHAR(100) NOT NULL,

    Apellidos VARCHAR(100) NOT NULL,

    DPI VARCHAR(20) NULL UNIQUE,

    FechaNacimiento DATE NOT NULL,

    Sexo CHAR(1) NOT NULL,

    Direccion VARCHAR(255) NULL,

    Telefono VARCHAR(20) NULL,

    FechaIngreso DATE NOT NULL DEFAULT GETDATE(),

    Estado VARCHAR(20) NOT NULL DEFAULT 'Activo',

    Observaciones VARCHAR(500) NULL,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT CK_Pacientes_Sexo
        CHECK (Sexo IN ('M', 'F')),

    CONSTRAINT CK_Pacientes_Estado
        CHECK (Estado IN ('Activo', 'Inactivo', 'Fallecido'))
);
GO