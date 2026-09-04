USE AsiloDB;
GO

-- =============================================
-- TABLA: DetalleRecetas
-- Descripción:
-- Almacena los medicamentos indicados
-- dentro de una receta médica.
-- =============================================

CREATE TABLE DetalleRecetas (

    IdDetalleReceta INT IDENTITY(1,1) PRIMARY KEY,

    IdReceta INT NOT NULL,

    NombreMedicamento VARCHAR(150) NOT NULL,

    Dosis VARCHAR(100) NOT NULL,

    Frecuencia VARCHAR(100) NOT NULL,

    Duracion VARCHAR(100) NULL,

    Indicaciones VARCHAR(500) NULL,

    CONSTRAINT FK_DetalleRecetas_Receta
        FOREIGN KEY (IdReceta)
        REFERENCES RecetasMedicas(IdReceta)
);
GO