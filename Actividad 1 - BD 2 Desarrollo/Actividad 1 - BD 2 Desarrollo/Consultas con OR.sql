-- Buscar aprendices que ya no están cursando activamente
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', primer_apellido, ' ', segundo_apellido) AS nombre_completo,
    email,
    estado_aprendiz,
    fecha_nacimiento
FROM Aprendices
WHERE estado_aprendiz = 'Graduado' 
   OR estado_aprendiz = 'Retirado';
   
   
   
   -- Buscar instructores disponibles o temporalmente ausentes
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', primer_apellido) AS nombre_completo,
    email,
    especialidad,
    estado_instructor,
    fecha_vinculacion
FROM Instructores
WHERE estado_instructor = 'Activo' 
   OR estado_instructor = 'Licencia';
   
   
   
-- Buscar modalidades no presenciales
SELECT 
    m.id_modalidad,
    m.tipo_modalidad,
    c.nombre_competencia,
    m.cupo_maximo,
    m.fecha_inicio,
    m.fecha_fin
FROM Modalidades m
INNER JOIN Competencias c ON m.Competencias_id_competencia = c.id_competencia
WHERE m.tipo_modalidad = 'Virtual' 
   OR m.tipo_modalidad = 'Mixta';
   
   
   
-- Buscar matrículas finalizadas (exitosas o no exitosas)
SELECT 
    m.id_matricula,
    m.ficha,
    CONCAT(a.primer_nombre, ' ', a.primer_apellido) AS aprendiz,
    p.nombre_programa,
    m.fecha_inicio,
    m.fecha_fin,
    m.estado
FROM Matriculas m
INNER JOIN Aprendices a ON m.Aprendices_id_aprendiz = a.id_aprendiz
INNER JOIN Programas_formacion p ON m.Programas_formacion_id_programa = p.id_programa
WHERE m.estado = 'Completado' 
   OR m.estado = 'Retirado';
   
   

-- Buscar competencias de duración corta o extensa
SELECT 
    c.id_competencia,
    c.nombre_competencia,
    c.horas_estimadas,
    p.nombre_programa,
    p.nivel_formacion
FROM Competencias c
INNER JOIN Programas_formacion p ON c.Programas_formacion_id_programa = p.id_programa
WHERE c.horas_estimadas = 100 
   OR c.horas_estimadas = 200;