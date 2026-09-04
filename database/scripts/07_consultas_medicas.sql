USE AsiloDB;
GO

-- =============================================
-- TABLA: ConsultasMedicas
-- Descripción:
-- Registra las consultas médicas realizadas
-- a los pacientes del asilo.
-- =============================================

CREATE TABLE ConsultasMedicas (

    IdConsulta INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL,

    IdUsuario INT NOT NULL,

    FechaConsulta DATETIME NOT NULL DEFAULT GETDATE(),

    MotivoConsulta VARCHAR(500) NOT NULL,

    Diagnostico VARCHAR(1000) NULL,

    Tratamiento VARCHAR(1000) NULL,

    Observaciones VARCHAR(1000) NULL,

    Estado VARCHAR(20) NOT NULL DEFAULT 'Finalizada',

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    FechaModificacion DATETIME NULL,

    CONSTRAINT FK_ConsultasMedicas_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente),

    CONSTRAINT FK_ConsultasMedicas_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario),

    CONSTRAINT CK_ConsultasMedicas_Estado
        CHECK (Estado IN ('Pendiente', 'EnProceso', 'Finalizada', 'Cancelada'))
);
GO