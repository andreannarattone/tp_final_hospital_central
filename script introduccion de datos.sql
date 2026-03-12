USE Hospital_Central;

-- 1. COBERTURA MÉDICA (5 registros)
INSERT INTO cobertura_medica (id_cobertura_medica, nombre, tipo_cobertura) VALUES
(1, 'OSDE 210', 'Prepaga'),
(2, 'PAMI', 'Obra Social'),
(3, 'IOMA', 'Obra Social'),
(4, 'Particular', 'Particular'),
(5, 'Swiss Medical', 'Prepaga');

-- 2. ESPECIALIDAD (10 registros)
INSERT INTO especialidad (id_especialidad, nombre) VALUES
(1, 'Cardiología'), (2, 'Pediatría'), (3, 'Clínica Médica'), (4, 'Traumatología'), (5, 'Dermatología'),
(6, 'Ginecología'), (7, 'Neurología'), (8, 'Oftalmología'), (9, 'Psiquiatría'), (10, 'Gastroenterología');

-- 3. HABITACIÓN (9 registros)
INSERT INTO habitacion (id_habitacion, numero, piso, tipo) VALUES
(1, '101', '1', 'Sala Comun'), (2, '102', '1', 'Sala Comun'), (3, '103', '1', 'Sala Comun'), 
(4, '201', '2', 'UTI'), (5, '202', '2', 'UTI'), (6, '203', '2', 'UTI'),
(7, '301', '3', 'Aislamiento'), (8, '302', '3', 'Aislamiento'), (9, '401', '4', 'UCO');

-- 4. MEDICAMENTO (6 registros)
INSERT INTO medicamento (id_medicamento, nombre, tipo, descripcion) VALUES
(1, 'Ibuprofeno 600', 'Analgésico', 'Comprimidos'),
(2, 'Paracetamol 500', 'Analgésico', 'Comprimidos'),
(3, 'Amoxicilina 500', 'Antibiótico', 'Cápsulas'),
(4, 'Losartán 50', 'Antihipertensivo', 'Comprimidos'),
(5, 'Omeprazol 20', 'Protector Gástrico', 'Cápsulas'),
(6, 'Metformina 850', 'Antidiabético', 'Comprimidos');

-- 5. PROFESIONAL (15 registros)
INSERT INTO profesional (id_profesional, nombre, apellido, matricula, id_especialidad) VALUES
(1, 'Alejandro', 'Peralta', '12201', 1), (2, 'Beatriz', 'Mendez', '23202', 2), 
(3, 'Carlos', 'Vargas', '19203', 3), (4, 'Daniela', 'Rios', '17204', 4), 
(5, 'Eduardo', 'Cabrera', '10205', 3), (6, 'Fernanda', 'Morales', '15206', 6), 
(7, 'Gustavo', 'Ibañez', '17207', 10), (8, 'Hilda', 'Ferreyra', '12208', 10), 
(9, 'Ivan', 'Dominguez', '21209', 1), (10, 'Jorgelina', 'Paz', '19210', 2), 
(11, 'Kevin', 'Vega', '20211', 3), (12, 'Lorena', 'Soria', '21212', 4), 
(13, 'Mariano', 'Luna', '22213', 7), (14, 'Natalia', 'Carrizo', '14214', 5), 
(15, 'Oscar', 'Farias', '19215', 3);

-- 6. ENFERMERO (15 registros)
INSERT INTO enfermero (id_enfermero, nombre, apellido, matricula) VALUES
(1, 'Lucas', 'Martinez', '12101'), (2, 'Sofia', 'Gonzalez', '15702'), (3, 'Mateo', 'Rodriguez', '13573'), 
(4, 'Valentina', 'Lopez', '17104'), (5, 'Santiago', 'Diaz', '19105'), (6, 'Isabella', 'Garcia', '17106'), 
(7, 'Benjamin', 'Perez', '16197'), (8, 'Camila', 'Sanchez', '13108'), (9, 'Tomas', 'Romero', '12909'), 
(10, 'Martina', 'Sosa', '11810'), (11, 'Nicolas', 'Alvarez', '14811'), (12, 'Lucia', 'Torres', '21712'), 
(13, 'Joaquin', 'Ruiz', '21713'), (14, 'Catalina', 'Ramirez', '15314'), (15, 'Felipe', 'Flores', '19015');

-- 7. PACIENTE (30 registros)
INSERT INTO paciente (id_paciente, dni, nombre, apellido, fecha_nacimiento, sexo, id_cobertura_medica) VALUES
(1, '28234101', 'Juan', 'Rossi', '1980-01-01', 'Masculino', 1), (2, '32572102', 'Maria', 'Bianchi', '1985-02-02', 'Femenino', 1),
(3, '35876103', 'Pedro', 'Ferrari', '1990-03-03', 'Masculino', 2), (4, '37982104', 'Ana', 'Romano', '1992-04-04', 'Femenino', 2),
(5, '24789105', 'Jose', 'Colombo', '1975-05-05', 'Masculino', 4), (6, '34289106', 'Laura', 'Ricci', '1988-06-06', 'Femenino', 1),
(7, '38293107', 'Diego', 'Marino', '1995-07-07', 'Masculino', 2), (8, '30897108', 'Carla', 'Perez', '1982-08-08', 'Femenino', 2),
(9, '21473109', 'Luis', 'Gallo', '1970-09-09', 'Masculino', 1), (10, '16789110', 'Silvia', 'Conti', '1965-10-10', 'Femenino', 1),
(11, '28609111', 'Hugo', 'Sosa', '1980-11-11', 'Masculino', 3), (12, '32179112', 'Marta', 'Lopez', '1985-12-12', 'Femenino', 3),
(13, '35421113', 'Raul', 'Diaz', '1990-01-13', 'Masculino', 5), (14, '37893114', 'Elena', 'Perez', '1992-02-14', 'Femenino', 5),
(15, '24752115', 'Nora', 'Ruiz', '1975-03-15', 'Femenino', 1), (16, '34189116', 'Omar', 'Gomez', '1988-04-16', 'Masculino', 1),
(17, '38083117', 'Ines', 'Vega', '1995-05-17', 'Femenino', 2), (18, '30891118', 'Saul', 'Sosa', '1982-06-18', 'Masculino', 2),
(19, '21418119', 'Rene', 'Diaz', '1970-07-19', 'Masculino', 4), (20, '16249120', 'Zoe', 'Rios', '1965-08-20', 'Femenino', 4),
(21, '28519121', 'Ariel', 'Cruz', '1980-09-21', 'Masculino', 5), (22, '32081122', 'Luz', 'Morachi', '1985-10-22', 'Femenino', 5),
(23, '35901123', 'Alberto', 'Baeza', '1990-11-23', 'Masculino', 1), (24, '37027124', 'Sara', 'Vera', '1992-12-24', 'Femenino', 1),
(25, '24014125', 'Felipe', 'Cano', '1975-01-25', 'Masculino', 2), (26, '34103126', 'Adabel', 'Lopez', '1988-02-26', 'Femenino', 2),
(27, '38105127', 'Emanuela', 'Duran', '1995-03-27', 'Femenino', 3), (28, '30173128', 'Abel', 'Gomez', '1982-04-28', 'Masculino', 3),
(29, '21901129', 'Nestor', 'Soto', '1970-05-29', 'Masculino', 4), (30, '16025130', 'Mia', 'Fernandez', '1965-06-30', 'Femenino', 1);

-- 8. HISTORIA CLÍNICA (30 registros - Antecedentes variados y repetidos)
INSERT INTO historia_clinica (id_historia_clinica, fecha_inicio, antecedentes, id_paciente) VALUES
(1, '2024-01-10', 'Hipertensión arterial controlada y tabaquismo', 1),
(2, '2024-01-12', 'Asma bronquial desde la infancia', 2),
(3, '2024-01-15', 'Sin antecedentes de relevancia', 3),
(4, '2024-01-18', 'Diabetes Tipo 2 y obesidad grado 1', 4),
(5, '2024-01-20', 'Sin antecedentes de relevancia', 5),
(6, '2024-01-22', 'Hipertensión arterial y sedentarismo', 6),
(7, '2024-01-25', 'Asma bronquial y alergia al polen', 7),
(8, '2024-01-28', 'Alergia a la penicilina y mariscos', 8),
(9, '2024-02-01', 'Sin antecedentes de relevancia', 9),
(10, '2024-02-03', 'Diabetes Tipo 2 en tratamiento con metformina', 10),
(11, '2024-02-05', 'Hipertensión arterial y colesterol alto', 11),
(12, '2024-02-07', 'Sin antecedentes de relevancia', 12),
(13, '2024-02-10', 'Cirugía previa de rodilla (2018)', 13),
(14, '2024-02-12', 'Sin antecedentes de relevancia', 14),
(15, '2024-02-14', 'Fumador crónico (20 cigarrillos/día)', 15),
(16, '2024-02-16', 'Fumador crónico y EPOC leve', 16),
(17, '2024-02-18', 'Sin antecedentes de relevancia', 17),
(18, '2024-02-20', 'Sin antecedentes de relevancia', 18),
(19, '2024-02-22', 'Hipertensión arterial mal controlada', 19),
(20, '2024-02-25', 'Asma bronquial y rinitis alérgica', 20),
(21, '2024-02-28', 'Sin antecedentes de relevancia', 21),
(22, '2024-03-01', 'Sin antecedentes de relevancia', 22),
(23, '2024-03-03', 'Hipotiroidismo en tratamiento', 23),
(24, '2024-03-05', 'Sin antecedentes de relevancia', 24),
(25, '2024-03-08', 'Diabetes Tipo 2 e insuficiencia renal leve', 25),
(26, '2024-03-10', 'Diabetes Tipo 2 controlada con dieta', 26),
(27, '2024-03-12', 'Alergia a la penicilina (Shock anafiláctico)', 27),
(28, '2024-03-15', 'Sin antecedentes de relevancia', 28),
(29, '2024-03-18', 'Hipertensión arterial y arritmia leve', 29),
(30, '2024-03-20', 'Hipertensión arterial y antecedentes familiares de ACV', 30);

-- 9. TURNO (12 registros)
INSERT INTO turno (id_turno, fecha, hora, estado, id_paciente, id_profesional) VALUES
(1, '2024-06-01', '08:00', 'Atendido', 1, 1), (2, '2024-06-01', '08:30', 'Atendido', 2, 1),
(3, '2024-06-01', '09:00', 'Atendido', 3, 2), (4, '2024-06-01', '09:30', 'Atendido', 4, 3),
(5, '2024-06-02', '10:00', 'Atendido', 5, 4), (6, '2024-06-02', '10:30', 'Atendido', 6, 5),
(7, '2024-06-02', '11:00', 'Atendido', 7, 1), (8, '2024-06-02', '11:30', 'Atendido', 8, 2),
(9, '2024-06-03', '08:00', 'Atendido', 9, 3), (10, '2024-06-03', '08:30', 'Atendido', 10, 4),
(11, '2024-06-03', '09:00', 'Atendido', 11, 5), (12, '2024-06-03', '09:30', 'Atendido', 12, 1);

-- 10. CONSULTA (12 registros - Observaciones variadas)
INSERT INTO consulta (id_consulta, fecha, observaciones, id_turno) VALUES
(1, '2024-06-01', 'Control de presión arterial', 1), (2, '2024-06-01', 'Cuadro febril y tos', 2),
(3, '2024-06-01', 'Control sano de rutina', 3), (4, '2024-06-01', 'Dolor abdominal agudo', 4),
(5, '2024-06-02', 'Control de presión arterial', 5), (6, '2024-06-02', 'Renovación de recetas', 6),
(7, '2024-06-02', 'Control sano de rutina', 7), (8, '2024-06-02', 'Cuadro febril y tos', 8),
(9, '2024-06-03', 'Control de presión arterial', 9), (10, '2024-06-03', 'Dolor abdominal agudo', 10),
(11, '2024-06-03', 'Control sano de rutina', 11), (12, '2024-06-03', 'Dolor de garganta', 12);

-- 11. INTERNACIÓN (18 registros)
INSERT INTO internacion (id_internacion, fecha_ingreso, fecha_egreso, motivo, id_paciente, id_profesional, id_habitacion) VALUES
(1, '2024-05-01', '2024-05-05', 'Cirugía programada', 13, 7, 1), (2, '2024-05-02', '2024-05-06', 'Cirugía programada', 14, 8, 2),
(3, '2024-05-03', '2024-05-10', 'Neumonía grave', 15, 11, 3), (4, '2024-05-04', '2024-05-11', 'Neumonía grave', 16, 11, 4),
(5, '2024-05-05', '2024-05-08', 'Observación', 17, 3, 5), (6, '2024-05-06', '2024-05-09', 'Observación', 18, 3, 6),
(7, '2024-05-07', '2024-05-15', 'Fractura expuesta', 19, 4, 1), (8, '2024-05-08', '2024-05-16', 'Fractura expuesta', 20, 12, 2),
(9, '2024-05-09', '2024-05-12', 'Gastroenteritis', 21, 7, 3), (10, '2024-05-10', '2024-05-13', 'Gastroenteritis', 22, 7, 4),
(11, '2024-05-11', '2024-05-14', 'Post-operatorio', 23, 15, 1), (12, '2024-05-12', '2024-05-15', 'Post-operatorio', 24, 15, 2),
(13, '2024-05-13', '2024-05-20', 'Infección urinaria', 25, 3, 5), (14, '2024-05-14', '2024-05-21', 'Infección urinaria', 26, 3, 6),
(15, '2024-05-15', '2024-05-18', 'Deshidratación', 27, 5, 3), (16, '2024-05-16', '2024-05-19', 'Deshidratación', 28, 5, 4),
(17, '2024-05-17', '2024-05-25', 'Traumatismo craneal', 29, 4, 1), (18, '2024-05-18', '2024-05-26', 'Traumatismo craneal', 30, 4, 2);

-- 12. DIAGNÓSTICO (30 registros - 12 de Consultas y 18 de Internaciones)
INSERT INTO diagnostico (id_diagnostico, descripcion, id_consulta, id_internacion) VALUES
-- Diagnósticos de Consultas (IDs 1-12)
(1, 'Hipertensión arterial sistémica', 1, NULL),
(2, 'Gripe viral estacional', 2, NULL),
(3, 'Control de salud preventivo', 3, NULL),
(4, 'Dermatitis atópica', 4, NULL),
(5, 'Hipertensión arterial sistémica', 5, NULL),
(6, 'Chequeo general de rutina', 6, NULL),
(7, 'Control de salud preventivo', 7, NULL),
(8, 'Gripe viral estacional', 8, NULL),
(9, 'Diabetes Mellitus tipo 2', 9, NULL),
(10, 'Migraña crónica', 10, NULL),
(11, 'Diabetes Mellitus tipo 2', 11, NULL),
(12, 'Faringitis aguda', 12, NULL),

-- Diagnósticos de Internaciones (IDs 13-30)
(13, 'Apendicitis aguda fase 2', NULL, 1),
(14, 'Apendicitis aguda fase 1', NULL, 2),
(15, 'Neumonía bacteriana bilateral', NULL, 3),
(16, 'Neumonía bacteriana bilateral', NULL, 4),
(17, 'Gastroenteritis infecciosa', NULL, 5),
(18, 'Gastroenteritis infecciosa', NULL, 6),
(19, 'Fractura de fémur desplazada', NULL, 7),
(20, 'Fractura de radio y cúbito', NULL, 8),
(21, 'Gastroenteritis infecciosa', NULL, 9),
(22, 'Gastroenteritis infecciosa', NULL, 10),
(23, 'Recuperación post-operatoria', NULL, 11),
(24, 'Recuperación post-operatoria', NULL, 12),
(25, 'Pielonefritis aguda', NULL, 13),
(26, 'Pielonefritis aguda', NULL, 14),
(27, 'Deshidratación severa', NULL, 15),
(28, 'Deshidratación severa', NULL, 16),
(29, 'Traumatismo craneoencefálico', NULL, 17),
(30, 'Traumatismo craneoencefálico', NULL, 18);

-- 13. TRATAMIENTO (10 tipos repetidos vinculados a diagnósticos)
INSERT INTO tratamiento (id_tratamiento, descripcion, fecha_inicio,fecha_finalizacion, id_diagnostico) VALUES
-- Tratamientos para Diagnósticos de Consultas (IDs 1-12)
(1, 'Control de dieta baja en sodio y medicación diaria', '2024-06-01', '2024-12-31', 1),
(2, 'Reposo relativo, hidratación y antitérmicos', '2024-06-01', '2024-06-07', 2),
(3, 'Sin tratamiento médico activo (Control anual)', '2024-06-01', NULL, 3),
(4, 'Corticoides tópicos y evitar agentes irritantes', '2024-06-01', '2024-06-15', 4),
(5, 'Ajuste de dosis de antihipertensivos', '2024-06-02', '2024-12-31', 5),
(6, 'Estudios de laboratorio complementarios', '2024-06-02', '2024-06-10', 6),
(7, 'Sin tratamiento médico activo (Control anual)', '2024-06-02', NULL, 7),
(8, 'Reposo relativo y paracetamol cada 8 horas', '2024-06-02', '2024-06-08', 8),
(9, 'Plan alimentario y Metformina 850mg', '2024-06-03', '2025-06-03', 9),
(10, 'Analgésicos específicos y evitar luces fuertes', '2024-06-03', '2024-06-05', 10),
(11, 'Plan alimentario y control de glucemia', '2024-06-03', '2025-06-03', 11),
(12, 'Antibióticos orales y gárgaras salinas', '2024-06-03', '2024-06-10', 12),

-- Tratamientos para Diagnósticos de Internaciones (IDs 13-30)
(13, 'Cirugía (Apendicectomía) y antibióticos IV', '2024-05-01', '2024-05-15', 13),
(14, 'Cirugía (Apendicectomía) y antibióticos IV', '2024-05-02', '2024-05-16', 14),
(15, 'Oxigenoterapia y antibióticos de amplio espectro', '2024-05-03', '2024-05-20', 15),
(16, 'Oxigenoterapia y antibióticos de amplio espectro', '2024-05-04', '2024-05-21', 16),
(17, 'Reposición de electrolitos y dieta blanda', '2024-05-05', '2024-05-10', 17),
(18, 'Reposición de electrolitos y dieta blanda', '2024-05-06', '2024-05-11', 18),
(19, 'Reducción quirúrgica y osteosíntesis', '2024-05-07', '2024-08-07', 19),
(20, 'Inmovilización con yeso y analgésicos', '2024-05-08', '2024-06-20', 20),
(21, 'Hidratación endovenosa y antiespasmódicos', '2024-05-09', '2024-05-14', 21),
(22, 'Hidratación endovenosa y antiespasmódicos', '2024-05-10', '2024-05-15', 22),
(23, 'Curaciones diarias y kinesiología motora', '2024-05-11', '2024-05-25', 23),
(24, 'Curaciones diarias y kinesiología motora', '2024-05-12', '2024-05-26', 24),
(25, 'Antibióticos parenterales y monitoreo renal', '2024-05-13', '2024-05-27', 25),
(26, 'Antibióticos parenterales y monitoreo renal', '2024-05-14', '2024-05-28', 26),
(27, 'Suero fisiológico y control de signos vitales', '2024-05-15', '2024-05-18', 27),
(28, 'Suero fisiológico y control de signos vitales', '2024-05-16', '2024-05-19', 28),
(29, 'Protocolo de neuro-observación y reposo absoluto', '2024-05-17', '2024-06-17', 29),
(30, 'Protocolo de neuro-observación y reposo absoluto', '2024-05-18', '2024-06-18', 30);

-- 14. TRATAMIENTO_MEDICAMENTO
INSERT INTO tratamiento_medicamento (id_tratamiento, id_medicamento, dosis) VALUES
(1, 4, '1 comp/día'), (2, 3, '1 comp/8hs'), (3, 1, 'N/A'), (4, 5, 'Aplicar c/12hs'),
(5, 4, '1 comp/día'), (6, 2, '1 comp/8hs'), (7, 1, 'N/A'), (8, 2, '1 comp/8hs'),
(9, 6, '1 comp c/almuerzo'), (10, 1, '1 comp c/8hs'), (11, 6, '1 comp c/almuerzo'), (12, 3, '1 comp c/12hs'),
(13, 3, 'Inyectable c/6hs'), (14, 3, 'Inyectable c/6hs'), (15, 3, 'Inyectable c/8hs'), (16, 3, 'Inyectable c/8hs'),
(17, 5, '1 comp c/12hs'), (18, 5, '1 comp c/12hs'), (19, 1, '1 comp c/8hs'), (20, 2, '1 comp c/6hs'),
(21, 5, '1 comp c/8hs'), (22, 5, '1 comp c/8hs'), (23, 2, '1 comp c/8hs'), (24, 2, '1 comp c/8hs'),
(25, 3, 'Inyectable c/12hs'), (26, 3, 'Inyectable c/12hs'), (27, 2, '1 comp c/8hs'), (28, 2, '1 comp c/8hs'),
(29, 1, '1 comp c/6hs'), (30, 1, '1 comp c/6hs');

-- 15. INTERNACION_ENFERMERO (Repitiendo enfermeros para carga de trabajo)
INSERT INTO internacion_enfermero (id_internacion, id_enfermero, fecha_asignacion) VALUES
(1, 1, '2024-05-01'), (2, 1, '2024-05-02'), (3, 2, '2024-05-03'), (4, 2, '2024-05-04'),
(5, 3, '2024-05-05'), (6, 3, '2024-05-06'), (7, 4, '2024-05-07'), (8, 5, '2024-05-08'),
(9, 1, '2024-05-09'), (10, 1, '2024-05-10'), (11, 6, '2024-05-11'), (12, 7, '2024-05-12'),
(13, 8, '2024-05-13'), (14, 9, '2024-05-14'), (15, 10, '2024-05-15'), (16, 11, '2024-05-16'),
(17, 12, '2024-05-17'), (18, 13, '2024-05-18');

-- 16. FACTURA (30 registros - Montos variados)
INSERT INTO factura (id_factura, fecha, monto, tipo_atencion, id_paciente) VALUES
-- Facturas por Consultas (Pacientes 1 al 12)
(1, '2024-06-30', 4500.00, 'Consulta', 1),
(2, '2024-06-30', 5000.00, 'Consulta', 2),
(3, '2024-06-30', 4800.00, 'Consulta', 3),
(4, '2024-06-30', 6000.00, 'Consulta', 4),
(5, '2024-06-30', 4500.00, 'Consulta', 5),
(6, '2024-06-30', 5500.00, 'Consulta', 6),
(7, '2024-06-30', 4800.00, 'Consulta', 7),
(8, '2024-06-30', 5200.00, 'Consulta', 8),
(9, '2024-06-30', 6000.00, 'Consulta', 9),
(10, '2024-06-30', 5800.00, 'Consulta', 10),
(11, '2024-06-30', 4500.00, 'Consulta', 11),
(12, '2024-06-30', 4900.00, 'Consulta', 12);

-- Facturas por Internaciones (Pacientes 13 al 30)
INSERT INTO factura (id_factura, fecha, monto, tipo_atencion, id_paciente) VALUES
(13, '2024-06-30', 45000.00, 'Internación', 13),
(14, '2024-06-30', 42000.00, 'Internación', 14),
(15, '2024-06-30', 85000.00, 'Internación', 15),
(16, '2024-06-30', 82000.00, 'Internación', 16),
(17, '2024-06-30', 25000.00, 'Internación', 17),
(18, '2024-06-30', 25000.00, 'Internación', 18),
(19, '2024-06-30', 65000.00, 'Internación', 19),
(20, '2024-06-30', 60000.00, 'Internación', 20),
(21, '2024-06-30', 32000.00, 'Internación', 21),
(22, '2024-06-30', 31500.00, 'Internación', 22),
(23, '2024-06-30', 28000.00, 'Internación', 23),
(24, '2024-06-30', 29000.00, 'Internación', 24),
(25, '2024-06-30', 35000.00, 'Internación', 25),
(26, '2024-06-30', 37000.00, 'Internación', 26),
(27, '2024-06-30', 22000.00, 'Internación', 27),
(28, '2024-06-30', 25500.00, 'Internación', 28),
(29, '2024-06-30', 70000.00, 'Internación', 29),
(30, '2024-06-30', 75000.00, 'Internación', 30);