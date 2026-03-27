
-- CONSULTAS.SQL - MEDISISTEMA

USE medisistema;


-- 1. Listar todos los médicos junto con sus especialidades (utilizando la tabla intermedia).
SELECT m.nombre_medico, e.nombre_especialidad
FROM medicos m
INNER JOIN medico_especialidad me ON m.id_medico = me.id_medico
INNER JOIN especialidades e ON me.id_especialidad = e.id_especialidad;
 
-- 2. Buscar médicos que cuenten con la especialidad de "Pediatría".
SELECT m.nombre_medico, e.nombre_especialidad
FROM medicos m
INNER JOIN medico_especialidad me ON m.id_medico = me.id_medico
INNER JOIN especialidades e ON me.id_especialidad = e.id_especialidad
WHERE e.nombre_especialidad = 'Pediatría';
 
-- 3. Contar el total de médicos registrados en la institución.
SELECT COUNT(*) AS total_medicos
FROM medicos;
 
-- 4. Obtener los médicos que tienen más de 15 años de experiencia profesional.
SELECT nombre_medico, experiencia_medico AS años_experiencia
FROM medicos
WHERE experiencia_medico > 15
ORDER BY experiencia_medico DESC;
 
-- 5. Listar las especialidades únicas que ofrece el centro médico.
SELECT DISTINCT nombre_especialidad
FROM especialidades
ORDER BY nombre_especialidad;
 
 
-- 6. Mostrar todos los pacientes registrados en orden alfabético por apellido.
SELECT nombre_paciente, identificacion_paciente, tel_paciente
FROM pacientes
ORDER BY nombre_paciente ASC;
 
-- 7. Buscar la información de un paciente mediante su número de documento.
SELECT *
FROM pacientes
WHERE identificacion_paciente = 20234567;
 
-- 8. Listar las consultas programadas para el día de hoy.
SELECT c.id_cita, m.nombre_medico, p.nombre_paciente,
       c.tipo_cita, c.fecha_cita, c.estado_cita
FROM cita c
INNER JOIN medicos m ON c.id_medico = m.id_medico
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
WHERE c.fecha_cita = CURDATE()
AND c.estado_cita = 'pendiente';
 
-- 9. Contar cuántas citas han sido marcadas como "Completadas".
SELECT COUNT(*) AS citas_completadas
FROM cita
WHERE estado_cita = 'completada';
 
-- 10. Obtener el historial completo de citas de un paciente específico.
SELECT c.id_cita, c.fecha_cita, c.tipo_cita, c.estado_cita,
       co.motivo_consulta, co.diagnostico, co.recomendacion
FROM cita c
LEFT JOIN consultas co ON c.id_cita = co.id_cita
WHERE c.id_paciente = 1
ORDER BY c.fecha_cita DESC;
 
 
-- 11. Identificar a los médicos que han atendido a más de 10 pacientes distintos.
SELECT m.nombre_medico, COUNT(DISTINCT c.id_paciente) AS total_pacientes
FROM medicos m
INNER JOIN cita c ON m.id_medico = c.id_medico
WHERE c.estado_cita = 'completada'
GROUP BY m.id_medico, m.nombre_medico
HAVING COUNT(DISTINCT c.id_paciente) > 10;
 
-- 12. Mostrar el último diagnóstico registrado para un paciente determinado.
SELECT co.diagnostico, co.fecha_consulta, co.motivo_consulta
FROM consultas co
INNER JOIN cita c ON co.id_cita = c.id_cita
WHERE c.id_paciente = 1
ORDER BY co.fecha_consulta DESC
LIMIT 1;
 
-- 13. Calcular el promedio de consultas atendidas por cada médico al mes.
SELECT m.nombre_medico,
       COUNT(co.id_consulta) AS total_consultas,
       COUNT(co.id_consulta) / 3 AS promedio_mensual
FROM medicos m
INNER JOIN cita c ON m.id_medico = c.id_medico
INNER JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY m.id_medico, m.nombre_medico
ORDER BY promedio_mensual DESC;


-- 14. Listar las especialidades que actualmente no tienen ningún médico asignado.
SELECT e.nombre_especialidad
FROM especialidades e
LEFT JOIN medico_especialidad me ON e.id_especialidad = me.id_especialidad
WHERE me.id_medico IS NULL;
 
-- 15. Filtrar los pacientes que tienen citas en estado "Cancelada".
SELECT DISTINCT p.nombre_paciente, p.identificacion_paciente, p.tel_paciente
FROM pacientes p
INNER JOIN cita c ON p.id_paciente = c.id_paciente
WHERE c.estado_cita = 'cancelada';
 
-- 16. Encontrar al médico con el mayor volumen de consultas realizadas.
SELECT m.nombre_medico, COUNT(co.id_consulta) AS total_consultas
FROM medicos m
INNER JOIN cita c ON m.id_medico = c.id_medico
INNER JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY m.id_medico, m.nombre_medico
ORDER BY total_consultas DESC
LIMIT 1;
 
-- 17. Listar los pacientes cuya edad sea superior a los 50 años.
SELECT nombre_paciente,
       fecha_nac_paciente,
       2026 - YEAR(fecha_nac_paciente) AS edad
FROM pacientes
WHERE 2026 - YEAR(fecha_nac_paciente) > 50
ORDER BY edad DESC;
 
-- 18. Contar la cantidad de consultas realizadas desglosadas por cada especialidad.
SELECT e.nombre_especialidad, COUNT(co.id_consulta) AS total_consultas
FROM especialidades e
INNER JOIN medico_especialidad me ON e.id_especialidad = me.id_especialidad
INNER JOIN medicos m ON me.id_medico = m.id_medico
INNER JOIN cita c ON m.id_medico = c.id_medico
INNER JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY e.id_especialidad, e.nombre_especialidad
ORDER BY total_consultas DESC;
 
-- 19. Determinar el motivo de consulta que más se ha repetido en el último semestre.
SELECT motivo_consulta, COUNT(*) AS total
FROM consultas
WHERE YEAR(fecha_consulta) = 2026
GROUP BY motivo_consulta
ORDER BY total DESC
LIMIT 1;
 
-- 20. Mostrar cada médico junto con la fecha de su última actividad registrada.
SELECT m.nombre_medico, MAX(co.fecha_consulta) AS ultima_actividad
FROM medicos m
INNER JOIN cita c ON m.id_medico = c.id_medico
INNER JOIN consultas co ON c.id_cita = co.id_cita
GROUP BY m.id_medico, m.nombre_medico
ORDER BY ultima_actividad DESC;
 





