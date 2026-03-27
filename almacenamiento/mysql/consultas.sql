
-- CONSULTAS.SQL - MEDISISTEMA

USE medisistema;

-- 1. Listar todos los médicos junto con sus especialidades
SELECT m.nombre_medico, e.nombre_especialidad
FROM medicos m
JOIN medico_especialidad me ON m.id_medico = me.id_medico
JOIN especialidades e ON me.id_especialidad = e.id_especialidad;

-- 2. Buscar médicos con especialidad Pediatría
SELECT m.nombre_medico
FROM medicos m
JOIN medico_especialidad me ON m.id_medico = me.id_medico
JOIN especialidades e ON me.id_especialidad = e.id_especialidad
WHERE e.nombre_especialidad = 'Pediatría';

-- 3. Contar el total de médicos
SELECT COUNT(*) AS total_medicos
FROM medicos;

-- 4. Médicos con más de 15 años de experiencia
SELECT nombre_medico, experiencia_medico
FROM medicos
WHERE experiencia_medico > 15;

-- 5. Listar especialidades únicas
SELECT DISTINCT nombre_especialidad
FROM especialidades;

-- 6. Pacientes en orden alfabético por apellido
SELECT nombre_paciente
FROM pacientes
ORDER BY nombre_paciente ASC;

-- 7. Buscar paciente por número de documento
SELECT *
FROM pacientes
WHERE identificacion_paciente = 20234567;

-- 8. Consultas programadas para hoy
SELECT c.*, p.nombre_paciente, m.nombre_medico
FROM cita c
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico
WHERE c.fecha_cita = CURDATE()
AND c.estado_cita = 'pendiente';

-- 9. Contar citas completadas
SELECT COUNT(*) AS citas_completadas
FROM cita
WHERE estado_cita = 'completada';

-- 10. Historial completo de citas de un paciente
SELECT c.fecha_cita, c.tipo_cita, c.estado_cita,
       co.motivo_consulta, co.diagnostico
FROM cita c
LEFT JOIN consultas co ON c.id_cita = co.id_cita
WHERE c.id_paciente = 1;

-- 11. Médicos que han atendido más de 10 pacientes distintos
SELECT m.nombre_medico, COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM medicos m
JOIN cita c ON m.id_medico = c.id_medico
WHERE c.estado_cita = 'completada'
GROUP BY m.id_medico, m.nombre_medico
HAVING COUNT(DISTINCT c.id_paciente) > 10;

-- 12. Último diagnóstico de un paciente
SELECT co.diagnostico, co.fecha_consulta
FROM consultas co
JOIN cita c ON co.id_cita = c.id_cita
WHERE c.id_paciente = 1
ORDER BY co.fecha_consulta DESC
LIMIT 1;

-- 13. Promedio de consultas por médico al mes
SELECT m.nombre_medico,
       COUNT(co.id_consulta) / COUNT(DISTINCT DATE_FORMAT(co.fecha_consulta, '%Y-%m')) AS promedio_mensual
FROM medicos m
JOIN cita c ON m.id_medico = c.id_medico
JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY m.id_medico, m.nombre_medico;

-- 14. Especialidades sin médicos asignados
SELECT e.nombre_especialidad
FROM especialidades e
LEFT JOIN medico_especialidad me ON e.id_especialidad = me.id_especialidad
WHERE me.id_medico IS NULL;

-- 15. Pacientes con citas canceladas
SELECT DISTINCT p.nombre_paciente
FROM pacientes p
JOIN cita c ON p.id_paciente = c.id_paciente
WHERE c.estado_cita = 'cancelada';

-- 16. Médico con mayor volumen de consultas
SELECT m.nombre_medico, COUNT(co.id_consulta) AS total_consultas
FROM medicos m
JOIN cita c ON m.id_medico = c.id_medico
JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY m.id_medico, m.nombre_medico
ORDER BY total_consultas DESC
LIMIT 1;

-- 17. Pacientes mayores de 50 años
SELECT nombre_paciente,
       TIMESTAMPDIFF(YEAR, fecha_nac_paciente, CURDATE()) AS edad
FROM pacientes
WHERE TIMESTAMPDIFF(YEAR, fecha_nac_paciente, CURDATE()) > 50;

-- 18. Consultas por especialidad
SELECT e.nombre_especialidad, COUNT(co.id_consulta) AS total_consultas
FROM especialidades e
JOIN medico_especialidad me ON e.id_especialidad = me.id_especialidad
JOIN medicos m ON me.id_medico = m.id_medico
JOIN cita c ON m.id_medico = c.id_medico
JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY e.id_especialidad, e.nombre_especialidad;

-- 19. Motivo de consulta más repetido en el último semestre
SELECT motivo_consulta, COUNT(*) AS total
FROM consultas
WHERE fecha_consulta >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY motivo_consulta
ORDER BY total DESC
LIMIT 1;

-- 20. Médico con fecha de última actividad
SELECT m.nombre_medico, MAX(co.fecha_consulta) AS ultima_actividad
FROM medicos m
JOIN cita c ON m.id_medico = c.id_medico
JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY m.id_medico, m.nombre_medico;






