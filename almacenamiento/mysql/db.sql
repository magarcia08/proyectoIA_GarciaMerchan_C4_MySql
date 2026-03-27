CREATE DATABASE IF NOT EXISTS medisistema;
USE medisistema;

CREATE TABLE IF NOT EXISTS medicos (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nombre_medico VARCHAR(50),
    identificacion_medico INT,
    tel_medico INT,
    experiencia_medico INT
);

CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_paciente VARCHAR(50),
    identificacion_paciente INT,
    tel_paciente INT,
    fecha_nac_paciente DATE
);

CREATE TABLE IF NOT EXISTS especialidades (
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_especialidad VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS medico_especialidad (
    id_medico_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT,
    id_especialidad INT,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS cita (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    tipo_cita VARCHAR(88),
    fecha_cita DATE,
    descripcion_cita VARCHAR(60),
    estado_cita ENUM('pendiente', 'asignada', 'cancelada', 'reasignada', 'completada') DEFAULT 'pendiente',
    id_medico INT,
    id_paciente INT,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE RESTRICT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    motivo_consulta VARCHAR(140),
    diagnostico VARCHAR(140),
    fecha_consulta DATE,
    recomendacion VARCHAR(100),
    id_cita INT,
    FOREIGN KEY (id_cita) REFERENCES cita(id_cita) ON DELETE CASCADE
);


ALTER TABLE medicos
MODIFY COLUMN tel_medico BIGINT;

ALTER TABLE pacientes
MODIFY COLUMN tel_paciente BIGINT;