const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();

// ==========================================
// MIDDLEWARES
// ==========================================

// Permite solicitudes desde el frontend
app.use(cors());

// Permite recibir información en formato JSON
app.use(express.json());

// ==========================================
// RUTA DE PRUEBA
// ==========================================

app.get("/", (req, res) => {
    res.json({
        mensaje: "Servidor del Sistema de Administración del Asilo funcionando correctamente"
    });
});

// ==========================================
// CONFIGURACIÓN DEL SERVIDOR
// ==========================================

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});