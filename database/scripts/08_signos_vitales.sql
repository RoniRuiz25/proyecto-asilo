USE AsiloDB;
GO

-- =============================================
-- TABLA: SignosVitales
-- Descripción:
-- Almacena los registros de signos vitales
-- realizados a los pacientes.
-- =============================================

CREATE TABLE SignosVitales (

    IdSignoVital INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL,

    IdUsuario INT NOT NULL,

    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),

    Temperatura DECIMAL(4,2) NULL,

    PresionSistolica INT NULL,

    PresionDiastolica INT NULL,

    FrecuenciaCardiaca INT NULL,

    FrecuenciaRespiratoria INT NULL,

    SaturacionOxigeno DECIMAL(5,2) NULL,

    Peso DECIMAL(6,2) NULL,

    Estatura DECIMAL(5,2) NULL,

    Observaciones VARCHAR(500) NULL,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_SignosVitales_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente),

    CONSTRAINT FK_SignosVitales_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario)
);
GO