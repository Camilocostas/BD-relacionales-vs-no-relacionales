-- CONSULTAS

-- aprendices que primer nombre empiece con la letra A
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', primer_apellido, ' ', segundo_apellido) AS nombre_completo,
    email,
    estado_aprendiz
FROM Aprendices
WHERE primer_nombre LIKE 'A%';


-- Instructores con correo institucional SENA
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', segundo_nombre, ' ', primer_apellido) AS nombre_completo,
    email,
    especialidad,
    estado_instructor
FROM Instructores
WHERE email LIKE '%@sena.edu.co';


-- Buscar programas de formación de nivel Tecnología
SELECT 
    id_programa,
    nombre_programa,
    nivel_formacion,
    duracion,
    estado
FROM Programas_formacion
WHERE nombre_programa LIKE '%Tecnología%';



-- Buscar competencias relacionadas con datos
SELECT 
    c.id_competencia,
    c.nombre_competencia,
    c.horas_estimadas,
    p.nombre_programa
FROM Competencias c
INNER JOIN Programas_formacion p ON c.Programas_formacion_id_programa = p.id_programa
WHERE c.nombre_competencia LIKE '%Datos%';


-- Buscar aprendices con apellidos que terminan en "ez"
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', primer_apellido, ' ', segundo_apellido) AS nombre_completo,
    telefono,
    estado_aprendiz
FROM Aprendices
WHERE primer_apellido LIKE '%ez' OR segundo_apellido LIKE '%ez';