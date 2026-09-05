USE AsiloDB;
GO

-- =============================================
-- ÍNDICES PARA OPTIMIZACIÓN DE CONSULTAS
-- =============================================


-- PACIENTES

CREATE INDEX IX_Pacientes_Apellidos
ON Pacientes(Apellidos);
GO


CREATE INDEX IX_Pacientes_Nombres
ON Pacientes(Nombres);
GO


-- FAMILIARES

CREATE INDEX IX_Familiares_IdPaciente
ON Familiares(IdPaciente);
GO


-- CONSULTAS MÉDICAS

CREATE INDEX IX_ConsultasMedicas_IdPaciente
ON ConsultasMedicas(IdPaciente);
GO


CREATE INDEX IX_ConsultasMedicas_FechaConsulta
ON ConsultasMedicas(FechaConsulta);
GO


-- SIGNOS VITALES

CREATE INDEX IX_SignosVitales_IdPaciente
ON SignosVitales(IdPaciente);
GO


-- PAGOS

CREATE INDEX IX_Pagos_IdPaciente
ON Pagos(IdPaciente);
GO


CREATE INDEX IX_Pagos_FechaPago
ON Pagos(FechaPago);
GO


-- DONACIONES

CREATE INDEX IX_Donaciones_IdDonante
ON Donaciones(IdDonante);
GO


CREATE INDEX IX_Donaciones_FechaDonacion
ON Donaciones(FechaDonacion);
GO


-- MOVIMIENTOS DE CAJA

CREATE INDEX IX_MovimientosCaja_Fecha
ON MovimientosCaja(FechaMovimiento);
GO


CREATE INDEX IX_MovimientosCaja_Tipo
ON MovimientosCaja(TipoMovimiento);
GO


-- INVENTARIO

CREATE INDEX IX_InventarioMedicamentos_IdMedicamento
ON InventarioMedicamentos(IdMedicamento);
GO


CREATE INDEX IX_MovimientosInventario_IdMedicamento
ON MovimientosInventario(IdMedicamento);
GO