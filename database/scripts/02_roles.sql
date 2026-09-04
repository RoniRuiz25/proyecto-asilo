USE AsiloDB;
GO

-- =============================================
-- TABLA: Roles
-- Descripción:
-- Almacena los diferentes roles disponibles
-- para los usuarios del sistema.
-- =============================================

CREATE TABLE Roles (
    IdRol INT IDENTITY(1,1) PRIMARY KEY,
    
    Nombre VARCHAR(50) NOT NULL UNIQUE,
    
    Descripcion VARCHAR(255),
    
    Estado BIT NOT NULL DEFAULT 1,
    
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE()
);
GO

-- =============================================
-- DATOS INICIALES
-- =============================================

INSERT INTO Roles (Nombre, Descripcion)
VALUES
('Administrador', 'Acceso completo al sistema'),
('Medico', 'Gestion de consultas e historial medico'),
('Enfermero', 'Registro de signos vitales y atencion de pacientes'),
('Caja', 'Gestion de pagos y movimientos financieros');
GO