USE Hospital_Central;

-- 1. Vista de Pacientes y Cobertura Medica (Visualiza que cobertura tiene cada paciente)

CREATE OR REPLACE VIEW vista_pacientes_cobertura AS
SELECT 
    p.id_paciente, 
    LEFT(p.nombre, 1) AS inicial_nombre, 
    LEFT(p.apellido, 1) AS inicial_apellido, 
    c.nombre AS cobertura
FROM paciente p
JOIN cobertura_medica c ON p.id_cobertura_medica = c.id_cobertura_medica;

-- 2. Vista de Profesionales Agrupados por Especialidad

CREATE OR REPLACE VIEW vista_especialidad_profesionales AS
SELECT 
    e.nombre AS especialidad,
    GROUP_CONCAT(
        CONCAT(p.apellido, ' ', p.nombre, ' (MN: ', p.matricula, ')') 
        SEPARATOR ' / '
    ) AS lista_profesionales
FROM profesional p
JOIN especialidad e ON p.id_especialidad = e.id_especialidad
GROUP BY e.nombre;

-- 3. Vista de Facturación por Tipo de Atención (Resumen financiero)

CREATE OR REPLACE VIEW vista_resumen_facturacion AS
SELECT 
    tipo_atencion, 
    COUNT(*) AS cantidad_facturas, 
    SUM(monto) AS total_recaudado,
    AVG(monto) AS promedio_monto
FROM factura
GROUP BY tipo_atencion;


-- 4. Vista detallada que vincula paciente, diagnóstico, tratamiento y medicamento para cada paciente.

CREATE OR REPLACE VIEW vista_diagnostico_tratamiento_completo AS
SELECT 
    p.id_paciente,
    CONCAT(LEFT(p.nombre, 1), '.', LEFT(p.apellido, 1), '.') AS NA_paciente,
    d.descripcion AS Diagnostico,
    t.descripcion AS Tratamiento,
    m.nombre AS Medicamento,
    m.tipo AS Tipo_Medicamento,
    tm.dosis AS Dosis
FROM paciente p

LEFT JOIN turno tu ON p.id_paciente = tu.id_paciente
LEFT JOIN consulta c ON tu.id_turno = c.id_turno
LEFT JOIN internacion i ON p.id_paciente = i.id_paciente
JOIN diagnostico d ON (c.id_consulta = d.id_consulta OR i.id_internacion = d.id_internacion)

JOIN tratamiento t ON d.id_diagnostico = t.id_diagnostico
JOIN tratamiento_medicamento tm ON t.id_tratamiento = tm.id_tratamiento
JOIN medicamento m ON tm.id_medicamento = m.id_medicamento;

-- 5. Vista de Turnos por Paciente

CREATE OR REPLACE VIEW vista_control_turnos AS
SELECT 
    id_paciente,
    fecha AS Fecha_turno,
    estado AS Estado_turno
FROM turno;

-- 6. Vista que relaciona el paciente con su habitacion de internacion y el enfermero asignado.

CREATE OR REPLACE VIEW vista_asignacion_enfermeria AS
SELECT 
   h.tipo AS Tipo_habitacion,
    p.id_paciente,
    CONCAT(LEFT(p.nombre, 1), '.', LEFT(p.apellido, 1), '.') AS Paciente,
    i.fecha_ingreso,
    i.fecha_egreso,
    h.numero AS Numero_habitacion,
    CONCAT(e.nombre, ' ', e.apellido) AS Nombre_Enfermero
FROM internacion i
JOIN paciente p ON i.id_paciente = p.id_paciente
JOIN habitacion h ON i.id_habitacion = h.id_habitacion
JOIN internacion_enfermero ie ON i.id_internacion = ie.id_internacion
JOIN enfermero e ON ie.id_enfermero = e.id_enfermero
ORDER BY h.tipo, i.fecha_ingreso;




