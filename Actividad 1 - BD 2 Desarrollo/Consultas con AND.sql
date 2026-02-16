-- Buscar aprendices activos con cédula de ciudadanía
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', primer_apellido) AS nombre_completo,
    email,
    fecha_nacimiento,
    estado_aprendiz
FROM Aprendices
WHERE estado_aprendiz = 'Activo' 
  AND tipo_documento = 'CC';
  
  
-- Buscar matrículas activas de una ficha específica
SELECT 
    m.id_matricula,
    m.ficha,
    CONCAT(a.primer_nombre, ' ', a.primer_apellido) AS aprendiz,
    p.nombre_programa,
    m.fecha_inicio,
    m.estado
FROM Matriculas m
INNER JOIN Aprendices a ON m.Aprendices_id_aprendiz = a.id_aprendiz
INNER JOIN Programas_formacion p ON m.Programas_formacion_id_programa = p.id_programa
WHERE m.estado = 'Cursando' 
  AND m.ficha = 'FICHA-2024-001';
  
  
  -- Buscar modalidades presenciales con capacidad suficiente
SELECT 
    m.id_modalidad,
    m.tipo_modalidad,
    m.cupo_maximo,
    c.nombre_competencia,
    m.fecha_inicio,
    m.fecha_fin
FROM Modalidades m
INNER JOIN Competencias c ON m.Competencias_id_competencia = c.id_competencia
WHERE m.tipo_modalidad = 'Presencial' 
  AND m.cupo_maximo >= 20;
  
  
  
-- Buscar instructores activos especializados en desarrollo
SELECT 
    numero_documento,
    CONCAT(primer_nombre, ' ', segundo_nombre, ' ', primer_apellido) AS nombre_completo,
    email,
    telefono,
    especialidad,
    fecha_vinculacion
FROM Instructores
WHERE estado_instructor = 'Activo' 
  AND especialidad = 'Desarrollo de Software';
  
  
  
  -- Buscar programas tecnólogos actualmente activos
SELECT 
    id_programa,
    nombre_programa,
    descripcion,
    nivel_formacion,
    duracion,
    fecha_inicio
FROM Programas_formacion
WHERE nivel_formacion = 'Tecnólogo' 
  AND estado = 'Activo';
  