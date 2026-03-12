USE Hospital_Central;

-- Creacion de triggers

-- Trigger 1. Evita que se registren turnos con fecha pasada.

DELIMITER //

CREATE TRIGGER tr_validar_fecha_turno
BEFORE INSERT ON turno
FOR EACH ROW
BEGIN
    IF NEW.fecha < CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se pueden registrar turnos con fechas pasadas.';
    END IF;
END //

DELIMITER ;

-- Trigger 2. Registra cambios en la medicacion.

CREATE TABLE auditoria_medicacion (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_tratamiento INT,
    id_medicamento_anterior INT,
    id_medicamento_nuevo INT,
    dosis_anterior VARCHAR(100),
    dosis_nueva VARCHAR(100),
    usuario VARCHAR(50),
    fecha_modificacion DATETIME,
    accion VARCHAR(20)
);

DELIMITER //

CREATE TRIGGER tr_auditar_cambio_medicacion
AFTER UPDATE ON tratamiento_medicamento
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_medicacion (
        id_tratamiento, 
        id_medicamento_anterior, 
        id_medicamento_nuevo, 
        dosis_anterior, 
        dosis_nueva, 
        usuario, 
        fecha_modificacion, 
        accion
    )
    VALUES (
        OLD.id_tratamiento,
        OLD.id_medicamento,
        NEW.id_medicamento,
        OLD.dosis,
        NEW.dosis,
        USER(),     
        NOW(),      
        'ACTUALIZACION'
    );
END //

DELIMITER ;

