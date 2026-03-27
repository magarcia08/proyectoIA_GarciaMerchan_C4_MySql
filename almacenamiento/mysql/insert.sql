-- =============================================
-- INSERT.SQL - MEDISISTEMA
-- Datos de prueba generados con IA
-- =============================================

USE medisistema;

-- =============================================
-- ESPECIALIDADES
-- =============================================
INSERT INTO especialidades (id_especialidad, nombre_especialidad) VALUES
(NULL, 'Pediatría'),
(NULL, 'Cardiología'),
(NULL, 'Dermatología'),
(NULL, 'Neurología'),
(NULL, 'Ortopedia'),
(NULL, 'Ginecología'),
(NULL, 'Oftalmología');

-- =============================================
-- MEDICOS
-- =============================================
INSERT INTO medicos (id_medico, nombre_medico, identificacion_medico, tel_medico, experiencia_medico) VALUES
(NULL, 'Carlos García', 10234567, 3001234567, 20),
(NULL, 'Laura Martínez', 10345678, 3012345678, 8),
(NULL, 'Pedro Rodríguez', 10456789, 3023456789, 17),
(NULL, 'Ana López', 10567890, 3034567890, 5),
(NULL, 'Jorge Hernández', 10678901, 3045678901, 25),
(NULL, 'María Gómez', 10789012, 3056789012, 12),
(NULL, 'Luis Pérez', 10890123, 3067890123, 3),
(NULL, 'Sandra Torres', 10901234, 3078901234, 18),
(NULL, 'Andrés Ramírez', 11012345, 3089012345, 7),
(NULL, 'Patricia Vargas', 11123456, 3090123456, 22);

-- =============================================
-- PACIENTES
-- =============================================
INSERT INTO pacientes (id_paciente, nombre_paciente, identificacion_paciente, tel_paciente, fecha_nac_paciente) VALUES
(NULL, 'Juan Pérez', 20234567, 3101234567, '1970-03-15'),
(NULL, 'Sofía Ruiz', 20345678, 3112345678, '1985-07-22'),
(NULL, 'Miguel Castro', 20456789, 3123456789, '1960-11-08'),
(NULL, 'Valentina Díaz', 20567890, 3134567890, '1992-04-30'),
(NULL, 'Roberto Moreno', 20678901, 3145678901, '1955-09-12'),
(NULL, 'Camila Ortiz', 20789012, 3156789012, '1998-01-25'),
(NULL, 'Felipe Reyes', 20890123, 3167890123, '1948-06-03'),
(NULL, 'Isabella Mendoza', 20901234, 3178901234, '1975-12-18'),
(NULL, 'Sebastián Cruz', 21012345, 3189012345, '2000-08-14'),
(NULL, 'Daniela Flores', 21123456, 3190123456, '1965-02-27'),
(NULL, 'Tomás Herrera', 21234567, 3201234567, '1952-10-05'),
(NULL, 'Gabriela Santos', 21345678, 3212345678, '1988-05-19'),
(NULL, 'Nicolás Guerrero', 21456789, 3223456789, '1942-03-30'),
(NULL, 'Mariana Jiménez', 21567890, 3234567890, '1995-11-11'),
(NULL, 'Alejandro Mora', 21678901, 3245678901, '1978-07-07');

-- =============================================
-- MEDICO_ESPECIALIDAD
-- =============================================
INSERT INTO medico_especialidad (id_medico_especialidad, id_medico, id_especialidad) VALUES
(NULL, 1, 1),
(NULL, 1, 2),
(NULL, 2, 3),
(NULL, 3, 2),
(NULL, 3, 4),
(NULL, 4, 1),
(NULL, 5, 5),
(NULL, 6, 6),
(NULL, 7, 3),
(NULL, 8, 4),
(NULL, 9, 2),
(NULL, 10, 1),
(NULL, 10, 6),
(NULL, 5, 2),
(NULL, 6, 1);
-- Oftalmología (id=7) sin médicos asignados ✅

-- =============================================
-- CITA
-- =============================================
INSERT INTO cita (id_cita, tipo_cita, fecha_cita, descripcion_cita, estado_cita, id_medico, id_paciente) VALUES
(NULL, 'Consulta General', '2026-03-27', 'Control rutinario', 'pendiente', 1, 1),
(NULL, 'Consulta General', '2026-03-27', 'Revisión pediátrica', 'pendiente', 4, 6),
(NULL, 'Especializada', '2026-03-20', 'Dolor en el pecho', 'completada', 3, 3),
(NULL, 'Especializada', '2026-03-15', 'Revisión neurológica', 'completada', 8, 5),
(NULL, 'Consulta General', '2026-03-10', 'Revisión de piel', 'completada', 2, 2),
(NULL, 'Especializada', '2026-02-28', 'Control cardiológico', 'completada', 9, 7),
(NULL, 'Consulta General', '2026-02-20', 'Dolor de cabeza', 'completada', 8, 10),
(NULL, 'Especializada', '2026-02-15', 'Revisión ginecológica', 'completada', 6, 4),
(NULL, 'Consulta General', '2026-03-05', 'Dolor articular', 'cancelada', 5, 8),
(NULL, 'Especializada', '2026-03-08', 'Control dermatológico', 'cancelada', 7, 9),
(NULL, 'Consulta General', '2026-02-10', 'Revisión general', 'completada', 1, 11),
(NULL, 'Especializada', '2026-02-05', 'Control ortopédico', 'completada', 5, 12),
(NULL, 'Consulta General', '2026-01-25', 'Dolor en rodilla', 'completada', 5, 13),
(NULL, 'Especializada', '2026-01-20', 'Revisión cardiológica', 'completada', 3, 14),
(NULL, 'Consulta General', '2026-01-15', 'Control general', 'completada', 10, 15),
(NULL, 'Especializada', '2026-03-22', 'Revisión neurológica', 'completada', 8, 1),
(NULL, 'Consulta General', '2026-03-18', 'Control pediátrico', 'completada', 4, 6),
(NULL, 'Especializada', '2026-03-12', 'Revisión ginecológica', 'completada', 6, 2),
(NULL, 'Consulta General', '2026-03-25', 'Control general', 'asignada', 1, 3),
(NULL, 'Especializada', '2026-03-26', 'Revisión cardiológica', 'asignada', 9, 4);

-- CONSULTAS
INSERT INTO consultas (id_consulta, motivo_consulta, diagnostico, fecha_consulta, recomendacion, id_cita) VALUES
(NULL, 'Control rutinario', 'Paciente en buen estado', '2026-03-27', 'Continuar controles anuales', 1),
(NULL, 'Revisión pediátrica', 'Desarrollo normal', '2026-03-27', 'Vacunas al día', 2),
(NULL, 'Dolor en el pecho', 'Arritmia leve', '2026-03-20', 'Medicamento diario y reposo', 3),
(NULL, 'Revisión neurológica', 'Migraña crónica', '2026-03-15', 'Evitar estrés y tomar medicamento', 4),
(NULL, 'Revisión de piel', 'Dermatitis leve', '2026-03-10', 'Crema hidratante dos veces al día', 5),
(NULL, 'Control cardiológico', 'Hipertensión controlada', '2026-02-28', 'Dieta baja en sal', 6),
(NULL, 'Dolor de cabeza', 'Tensión muscular', '2026-02-20', 'Reposo y analgésicos', 7),
(NULL, 'Revisión ginecológica', 'Sin novedades', '2026-02-15', 'Control en 6 meses', 8),
(NULL, 'Dolor articular', 'Artritis temprana', '2026-02-10', 'Fisioterapia semanal', 11),
(NULL, 'Control ortopédico', 'Fractura en recuperación', '2026-02-05', 'Reposo absoluto 4 semanas', 12),
(NULL, 'Dolor en rodilla', 'Desgaste meniscal', '2026-01-25', 'Cirugía programada', 13),
(NULL, 'Revisión cardiológica', 'Colesterol elevado', '2026-01-20', 'Dieta y ejercicio', 14),
(NULL, 'Control general', 'Paciente saludable', '2026-01-15', 'Control anual', 15),
(NULL, 'Revisión neurológica', 'Estrés crónico', '2026-03-22', 'Terapia psicológica', 16),
(NULL, 'Control pediátrico', 'Crecimiento normal', '2026-03-18', 'Alimentación balanceada', 17),
(NULL, 'Revisión ginecológica', 'Sin novedades', '2026-03-12', 'Control en un año', 18),
(NULL, 'Control general', 'Presión arterial alta', '2026-03-25', 'Medicamento diario', 19),
(NULL, 'Revisión cardiológica', 'Ritmo cardíaco normal', '2026-03-26', 'Continuar tratamiento', 20);


