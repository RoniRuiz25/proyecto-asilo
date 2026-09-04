USE AsiloDB;
GO

-- =============================================
-- TABLA: Usuarios
-- Descripción:
-- Almacena la información de los usuarios
-- autorizados para acceder al sistema.
-- =============================================

CREATE TABLE Usuarios (
    
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    
    IdRol INT NOT NULL,
    
    Nombre VARCHAR(100) NOT NULL,
    
    Apellido VARCHAR(100) NOT NULL,
    
    Usuario VARCHAR(50) NOT NULL UNIQUE,
    
    Correo VARCHAR(150) NOT NULL UNIQUE,
    
    ContrasenaHash VARCHAR(255) NOT NULL,
    
    Estado BIT NOT NULL DEFAULT 1,
    
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    
    FechaModificacion DATETIME NULL,
    
    CONSTRAINT FK_Usuarios_Roles
        FOREIGN KEY (IdRol)
        REFERENCES Roles(IdRol)
);
GO