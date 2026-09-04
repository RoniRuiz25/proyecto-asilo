USE AsiloDB;
GO

-- =============================================
-- TABLA: SolicitudesLaboratorio
-- Descripción:
-- Registra las solicitudes de exámenes de laboratorio
-- realizadas para los pacientes.
-- =============================================

CREATE TABLE SolicitudesLaboratorio (

    IdSolicitudLaboratorio INT IDENTITY(1,1) PRIMARY KEY,

    IdPaciente INT NOT NULL,

    IdConsulta INT NULL,

    IdUsuario INT NOT NULL,

    FechaSolicitud DATETIME NOT NULL DEFAULT GETDATE(),

    Estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',

    Observaciones VARCHAR(500) NULL,

    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_SolicitudesLaboratorio_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente),

    CONSTRAINT FK_SolicitudesLaboratorio_Consultas
        FOREIGN KEY (IdConsulta)
        REFERENCES ConsultasMedicas(IdConsulta),

    CONSTRAINT FK_SolicitudesLaboratorio_Usuarios
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuarios(IdUsuario),

    CONSTRAINT CK_SolicitudesLaboratorio_Estado
        CHECK (Estado IN ('Pendiente', 'EnProceso', 'Finalizada', 'Cancelada'))
);
GO