# 🏥 Base de Datos Hospital Central

## 📌 Descripción

Este proyecto contiene el diseño y la implementación de la base de datos **Hospital_Central**, desarrollada en SQL. Su objetivo es gestionar la información clínica, administrativa y operativa de un hospital, incluyendo pacientes, profesionales, turnos, internaciones, diagnósticos, tratamientos, medicamentos y facturación.

La base está diseñada siguiendo principios de normalización y utiliza claves primarias y foráneas para garantizar la integridad referencial.

---

## 🧱 Estructura de la Base de Datos

La base de datos está compuesta por las siguientes entidades principales:

### 👤 Pacientes y Cobertura Médica

* **paciente**: almacena información personal del paciente.
* **cobertura_medica**: contiene los datos de obras sociales o seguros médicos.
* **historia_clinica**: registra antecedentes médicos del paciente.

### 👨‍⚕️ Personal Médico

* **profesional**: médicos y especialistas.
* **especialidad**: especialidades médicas.
* **enfermero**: personal de enfermería.

### 📅 Gestión de Atención Médica

* **turno**: turnos asignados entre pacientes y profesionales.
* **consulta**: consultas médicas realizadas.
* **diagnostico**: diagnósticos derivados de consultas o internaciones.
* **tratamiento**: tratamientos asociados a diagnósticos.

### 💊 Medicación

* **medicamento**: catálogo de medicamentos.
* **tratamiento_medicamento**: relación entre tratamientos y medicamentos (tabla intermedia).

### 🛏️ Internaciones

* **internacion**: registros de hospitalización.
* **habitacion**: habitaciones del hospital.
* **internacion_enfermero**: asignación de enfermeros a internaciones.

### 💰 Facturación

* **factura**: facturación de servicios médicos al paciente.

---

## 🔗 Relaciones Principales

* Un paciente puede tener:

  * Una cobertura médica
  * Una historia clínica
  * Muchos turnos
  * Muchas internaciones
  * Muchas facturas

* Un profesional:

  * Pertenece a una especialidad
  * Atiende muchos turnos
  * Puede estar a cargo de internaciones

* Un diagnóstico puede generar:

  * Uno o varios tratamientos

* Un tratamiento puede tener:

  * Uno o varios medicamentos

* Una internación puede tener:

  * Una habitación asignada
  * Varios enfermeros asignados

---

## 🧩 Modelo Relacional (Resumen)

```
Paciente ────< Turno >──── Profesional ──── Especialidad
   │              │
   │              └──── Consulta ──── Diagnóstico ──── Tratamiento ──── Medicamento
   │
   ├──── Historia Clínica
   │
   ├──── Internación ──── Habitación
   │         │
   │         └──── Enfermero
   │
   └──── Factura
```

---

## ⚙️ Tecnologías Utilizadas

* SQL (MySQL / MariaDB compatible)
* Modelo relacional
* Claves primarias y foráneas
* Integridad referencial

---

## 🚀 Instalación

1. Clonar el repositorio:

```bash
git clone https://github.com/tuusuario/hospital-central-db.git
```

2. Abrir tu gestor de base de datos (MySQL Workbench, DBeaver, phpMyAdmin, etc.)

3. Ejecutar el script SQL:

```sql
SOURCE "script hospital central.sql";
```

O copiar y ejecutar el contenido manualmente.

---

## 📊 Funcionalidades

* Gestión de pacientes
* Gestión de profesionales y especialidades
* Asignación de turnos
* Registro de consultas médicas
* Gestión de internaciones
* Registro de diagnósticos y tratamientos
* Control de medicamentos
* Asignación de enfermeros
* Facturación de servicios médicos

---

## 📁 Estructura del Proyecto

```
hospital-central-db/
│
├── script hospital central.sql
└── README.md
```

---

## 🧠 Mejoras Futuras

* Sistema de usuarios y roles
* Auditoría de cambios
* Índices para optimización
* Vistas para reportes
* Stored Procedures
* Triggers para validaciones automáticas

---

## 👨‍💻 Autor

Desarrollado como proyecto de base de datos para gestión hospitalaria.

---

## 📄 Licencia

Este proyecto es de uso libre para fines educativos y de aprendizaje.
