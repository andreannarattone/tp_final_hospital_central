CREATE DATABASE Hospital_Central;
USE Hospital_Central;

CREATE TABLE cobertura_medica (
id_cobertura_medica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
tipo_cobertura VARCHAR(50)
);

CREATE TABLE paciente (
id_paciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dni VARCHAR(10) UNIQUE NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(100) NOT NULL,
fecha_nacimiento DATE NOT NULL,
sexo VARCHAR(10),
telefono VARCHAR(20),
email VARCHAR(100),
id_cobertura_medica INT,
FOREIGN KEY (id_cobertura_medica) REFERENCES cobertura_medica(id_cobertura_medica)
);

CREATE TABLE historia_clinica (
id_historia_clinica INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_inicio DATE,
antecedentes TEXT,
id_paciente INT,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente)
);

CREATE TABLE especialidad (
id_especialidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50)
);

CREATE TABLE profesional (
id_profesional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
apellido VARCHAR (100),
matricula VARCHAR (10),
id_especialidad INT,
FOREIGN KEY (id_especialidad) REFERENCES especialidad (id_especialidad)
);

CREATE TABLE turno (
id_turno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
hora TIME,
estado VARCHAR (50),
id_paciente INT,
id_profesional INT,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente),
FOREIGN KEY (id_profesional) REFERENCES profesional (id_profesional)
);

CREATE TABLE consulta (
id_consulta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
observaciones TEXT,           
id_turno INT,
FOREIGN KEY (id_turno) REFERENCES turno (id_turno)
);

CREATE TABLE habitacion (
id_habitacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
numero VARCHAR (5),
piso VARCHAR (5),
tipo VARCHAR (50)
);

CREATE TABLE internacion (
id_internacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_ingreso DATE,
fecha_egreso DATE,
motivo VARCHAR (200),
id_paciente INT,
id_profesional INT,
id_habitacion INT,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente),
FOREIGN KEY (id_profesional) REFERENCES profesional (id_profesional),
FOREIGN KEY (id_habitacion) REFERENCES habitacion (id_habitacion)
);

CREATE TABLE diagnostico (
id_diagnostico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR (100),
id_consulta INT,
id_internacion INT,
FOREIGN KEY (id_consulta) REFERENCES consulta (id_consulta),
FOREIGN KEY (id_internacion) REFERENCES internacion (id_internacion)
);

CREATE TABLE tratamiento (
id_tratamiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR (200),
fecha_inicio DATE,
fecha_finalizacion DATE,
id_diagnostico INT,
FOREIGN KEY (id_diagnostico) REFERENCES diagnostico (id_diagnostico)
);

CREATE TABLE medicamento (
id_medicamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
tipo VARCHAR (50),
descripcion VARCHAR (100)
);

CREATE TABLE tratamiento_medicamento (
id_tratamiento INT,
id_medicamento INT,
dosis VARCHAR (50),
PRIMARY KEY (id_tratamiento,id_medicamento),
FOREIGN KEY (id_tratamiento) REFERENCES tratamiento (id_tratamiento),
FOREIGN KEY (id_medicamento) REFERENCES medicamento (id_medicamento)
);

CREATE TABLE enfermero (
id_enfermero INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50),
apellido VARCHAR (100),
matricula VARCHAR (10) UNIQUE
);

CREATE TABLE internacion_enfermero (
id_internacion INT,
id_enfermero INT,
fecha_asignacion DATE,
fecha_terminacion DATE,
PRIMARY KEY (id_internacion,id_enfermero),
FOREIGN KEY (id_internacion) REFERENCES internacion (id_internacion),
FOREIGN KEY (id_enfermero) REFERENCES enfermero (id_enfermero)
);

CREATE TABLE factura (
id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
monto DECIMAL(10,2),
tipo_atencion VARCHAR (20),
id_paciente INT,
FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente)
);