-- Creacion de funciones

USE Hospital_Central;

-- Funcion 1. Cálculo de facturación mensual por paciente.

DELIMITER //

DROP FUNCTION IF EXISTS Hospital_Central.fn_monto_final_paciente //

CREATE FUNCTION Hospital_Central.fn_monto_final_paciente(
_id_paciente INT, 
_mes INT,
_año INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
  DECLARE monto_final DECIMAL(12,2);
  
  SELECT sum(monto) INTO monto_final FROM factura
  WHERE id_paciente= _id_paciente
  AND MONTH(fecha)= _mes
  AND YEAR(fecha)= _año;
  
   RETURN monto_final;
END //

DELIMITER ;   

-- Funcion 2. Conteo mensual de pacientes por enfermero .

DELIMITER //

DROP FUNCTION IF EXISTS Hospital_Central.fn_cantidad_pacientes_x_enfermero //

CREATE FUNCTION Hospital_Central.fn_cantidad_pacientes_x_enfermero(
_id_enfermero INT, 
_mes INT,
_año INT
)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE cantidad_pacientes INT;
  
  SELECT COUNT( DISTINCT i.id_paciente) INTO cantidad_pacientes FROM internacion as i
  JOIN internacion_enfermero as ie ON i.id_internacion = ie.id_internacion
  WHERE ie.id_enfermero = _id_enfermero
  AND MONTH(ie.fecha_asignacion) = _mes
  AND YEAR(ie.fecha_asignacion) = _año;
 
   RETURN cantidad_pacientes;
END //
   
DELIMITER ;   

-- Funcion 3. Identificar qué tan solicitada es una especialidad médica.

DELIMITER //

DROP FUNCTION IF EXISTS fn_especialidad_mas_demandada //

CREATE FUNCTION fn_especialidad_mas_demandada(
    _id_especialidad INT, 
    _mes INT, 
    _año INT
) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE _total_turnos INT;
    
    SELECT COUNT(t.id_turno) INTO _total_turnos
    FROM turno AS t
    JOIN profesional AS p ON t.id_profesional = p.id_profesional
    WHERE p.id_especialidad = _id_especialidad
      AND MONTH(t.fecha) = _mes
      AND YEAR(t.fecha) = _año;
    
    RETURN IFNULL(_total_turnos, 0);
END //

DELIMITER ;

-- Funcion 4. Conteo de dias de internacion por paciente.

DELIMITER //

DROP FUNCTION IF EXISTS fn_dias_internacion //

CREATE FUNCTION fn_dias_internacion(_id_internacion INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE _dias INT;
    DECLARE _ingreso_internacion DATE;
    DECLARE _egreso_internacion DATE;
    
    SELECT fecha_ingreso, fecha_egreso INTO _ingreso_internacion, _egreso_internacion
    FROM internacion
    WHERE id_internacion = _id_internacion;
    
    RETURN DATEDIFF(IFNULL(_egreso_internacion, CURDATE()), _ingreso_internacion);
END //

DELIMITER ;

-- Creacion de Store Procedure

-- Store Procedure 1. Ordena la tabla pacientes por campo (apellido o edad) y sentido (asc o desc).

DELIMITER //

DROP PROCEDURE IF EXISTS sp_orden_pacientes //

CREATE PROCEDURE sp_orden_pacientes (
    IN _orden VARCHAR(200), 
    IN _sentido VARCHAR(10)
)
BEGIN
    SET @sentencia = CONCAT('SELECT * FROM paciente ORDER BY ', _orden, ' ', _sentido);
    
    PREPARE ejecutar_sql FROM @sentencia;
    EXECUTE ejecutar_sql;
    DEALLOCATE PREPARE ejecutar_sql;
END //
    
DELIMITER ;

-- Store Procedure 2. Insertar nuevos datos en la tabla medicamentos.

DELIMITER //

DROP PROCEDURE IF EXISTS sp_nuevo_medicamento //

CREATE PROCEDURE sp_nuevo_medicamento (
    IN _nombre VARCHAR(50), 
    IN _tipo VARCHAR(50),
    IN _descripcion VARCHAR(100)
)
BEGIN
   INSERT INTO medicamento (nombre, tipo, descripcion)
   VALUES (_nombre,_tipo,_descripcion);
   
   SELECT CONCAT('Medicamento "',_nombre, '" insertado correctamente') AS Resultado;
    
END //

DELIMITER ;

-- Store Procedure 3. Obtener el historial de internaciones de un paciente.

 DELIMITER //

DROP PROCEDURE IF EXISTS sp_historial_internaciones_paciente //

CREATE PROCEDURE sp_historial_internaciones_paciente(IN _dni_paciente VARCHAR(10))
BEGIN
  SELECT 
        i.fecha_ingreso, 
        i.fecha_egreso, 
        i.motivo, 
        h.tipo AS sector,
        prof.apellido AS medico_a_cargo
    FROM internacion AS i
    JOIN paciente AS p ON i.id_paciente = p.id_paciente
    JOIN habitacion AS h ON i.id_habitacion = h.id_habitacion
    JOIN profesional AS prof ON i.id_profesional = prof.id_profesional
    WHERE p.dni = _dni_paciente
    ORDER BY i.fecha_ingreso DESC;
END //

DELIMITER ; 

-- Store Procedure 4. Obtener un reporte detallado de facturación por cobertura médica.

DELIMITER //

DROP PROCEDURE IF EXISTS sp_facturacion_cobertura_medica //

CREATE PROCEDURE sp_facturacion_cobertura_medica(
    IN _id_cobertura INT,
    IN _mes INT,
    IN _año INT
)
BEGIN
    SELECT 
        c.nombre AS Cobertura_Medica,
        SUM(CASE WHEN f.tipo_atencion = 'Consulta' THEN f.monto ELSE 0 END) AS Total_Consultas,
        SUM(CASE WHEN f.tipo_atencion = 'Internación' THEN f.monto ELSE 0 END) AS Total_Internaciones,
        SUM(f.monto) AS Monto_Total
    FROM factura AS f
    JOIN paciente AS p ON f.id_paciente = p.id_paciente
    JOIN cobertura_medica AS c ON p.id_cobertura_medica = c.id_cobertura_medica
    WHERE p.id_cobertura_medica = _id_cobertura
      AND MONTH(f.fecha) = _mes
      AND YEAR(f.fecha) = _año
    GROUP BY c.nombre;
END //

DELIMITER ;