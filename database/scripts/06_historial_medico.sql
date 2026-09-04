USE AsiloDB;
GO

-- =============================================
-- TABLA: HistorialMedico
-- Descripción:
-- Almacena la información médica general y
-- antecedentes clínicos de cada paciente.
-- =============================================

CREATE TABLE HistorialMedico (

    IdHistorial INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL UNIQUE,

    TipoSangre VARCHAR(5) NULL,

    Alergias VARCHAR(500) NULL,

    EnfermedadesCronicas VARCHAR(1000) NULL,

    AntecedentesMedicos VARCHAR(1000) NULL,

    MedicamentosActuales VARCHAR(1000) NULL,

    Observaciones VARCHAR(1000) NULL,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT FK_HistorialMedico_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente)
);
GO