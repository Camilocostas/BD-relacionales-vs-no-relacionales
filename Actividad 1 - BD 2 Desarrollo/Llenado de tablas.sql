USE FormacionSena;

INSERT INTO Programas_formacion 
(nombre_programa, descripcion, nivel_formacion, duracion, estado, fecha_inicio, fecha_finalizacion) 
VALUES
('Tecnología en Análisis y Desarrollo de Software', 
 'Programa orientado al desarrollo de aplicaciones web, móviles y de escritorio utilizando lenguajes de programación modernos y metodologías ágiles.', 
 'Tecnólogo', 24, 'Activo', '2023-01-15', NULL),

('Técnico en Sistemas', 
 'Formación técnica en mantenimiento de equipos de cómputo, redes locales y soporte técnico a usuarios.', 
 'Técnico', 18, 'Activo', '2023-02-01', NULL),

('Tecnología en Gestión de Redes de Datos', 
 'Programa enfocado en el diseño, implementación y administración de infraestructuras de redes empresariales.', 
 'Tecnólogo', 24, 'Activo', '2023-01-20', NULL),

('Curso Especializado en Ciberseguridad', 
 'Formación especializada en seguridad informática, ethical hacking y protección de sistemas.', 
 'Curso corto', 6, 'Activo', '2024-03-01', '2024-08-31'),

('Tecnología en Gestión de Bases de Datos', 
 'Programa centrado en el diseño, implementación y administración de sistemas de bases de datos empresariales.', 
 'Tecnólogo', 24, 'Inactivo', '2022-01-10', '2023-12-31');




INSERT INTO Competencias 
(nombre_competencia, descripcion, horas_estimadas, Programas_formacion_id_programa) 
VALUES
('Programación Orientada a Objetos', 
 'Desarrollo de software aplicando los principios de POO con lenguajes como Java y C#.', 
 200, 1),

('Bases de Datos Relacionales', 
 'Diseño, implementación y consultas avanzadas en bases de datos relacionales con MySQL y PostgreSQL.', 
 150, 1),

('Mantenimiento de Equipos de Cómputo', 
 'Ensamble, diagnóstico, mantenimiento preventivo y correctivo de hardware.', 
 120, 2),

('Fundamentos de Redes TCP/IP', 
 'Conceptos de direccionamiento IP, subnetting, protocolos y modelo OSI.', 
 100, 3),

('Ethical Hacking y Pentesting', 
 'Técnicas de hacking ético, análisis de vulnerabilidades y pruebas de penetración.', 
 140, 4);




INSERT INTO Modalidades 
(tipo_modalidad, cupo_maximo, fecha_inicio, fecha_fin, Competencias_id_competencia) 
VALUES
('Presencial', 30, '2024-02-05', '2024-06-20', 1),
('Virtual', 50, '2024-03-01', '2024-06-15', 2),
('Presencial', 20, '2024-02-10', '2024-05-25', 3),
('Mixta', 25, '2024-02-08', '2024-05-15', 4),
('Presencial', 15, '2024-03-20', '2024-07-05', 5);




INSERT INTO Instructores 
(numero_documento, tipo_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
 email, telefono, especialidad, fecha_vinculacion, estado_instructor) 
VALUES
('1234567890', 'CC', 'Carlos', 'Andrés', 'Gómez', 'Martínez', 
 'carlos.gomez@sena.edu.co', '3001234567', 'Desarrollo de Software', '2020-01-15', 'Activo'),

('2345678901', 'CC', 'María', 'Fernanda', 'López', 'Rodríguez', 
 'maria.lopez@sena.edu.co', '3012345678', 'Bases de Datos', '2019-03-20', 'Activo'),

('3456789012', 'CC', 'Juan', 'Pablo', 'Ramírez', 'Torres', 
 'juan.ramirez@sena.edu.co', '3023456789', 'Redes y Telecomunicaciones', '2021-06-10', 'Activo'),

('4567890123', 'CC', 'Ana', 'María', 'Castro', 'Vargas', 
 'ana.castro@sena.edu.co', '3034567890', 'Seguridad Informática', '2020-08-05', 'Activo'),

('5678901234', 'CC', 'Luis', 'Eduardo', 'Méndez', 'Silva', 
 'luis.mendez@sena.edu.co', '3045678901', 'Mantenimiento de Hardware', '2018-02-12', 'Licencia');




INSERT INTO Instructores_Modalidades 
(fecha_asignacion, Instructores_id_instructor, Modalidades_id_modalidad) 
VALUES
('2024-01-25', 1, 1),
('2024-02-20', 2, 2),
('2024-02-05', 5, 3),
('2024-01-30', 3, 4),
('2024-03-10', 4, 5);




INSERT INTO Aprendices 
(numero_documento, tipo_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
 email, telefono, fecha_nacimiento, direccion, estado_aprendiz) 
VALUES
('1111111111', 'CC', 'Andrés', 'Felipe', 'Pérez', 'González', 
 'andres.perez@misena.edu.co', '3101111111', '2004-03-15', 'Calle 10 #20-30', 'Activo'),

('2222222222', 'CC', 'Laura', 'Daniela', 'García', 'Martínez', 
 'laura.garcia@misena.edu.co', '3102222222', '2003-07-22', 'Carrera 15 #30-40', 'Activo'),

('3333333333', 'CC', 'David', 'Santiago', 'Rodríguez', 'López', 
 'david.rodriguez@misena.edu.co', '3103333333', '2005-01-10', 'Avenida 5 #12-25', 'Activo'),

('4444444444', 'CC', 'Camila', 'Andrea', 'Martínez', 'Torres', 
 'camila.martinez@misena.edu.co', '3104444444', '2004-11-08', 'Calle 25 #18-45', 'Graduado'),

('5555555555', 'CC', 'Sebastián', 'Alejandro', 'Hernández', 'Castro', 
 'sebastian.hernandez@misena.edu.co', '3105555555', '2003-05-30', 'Carrera 8 #22-15', 'Retirado');



INSERT INTO Matriculas 
(ficha, fecha_inicio, fecha_fin, estado, Aprendices_id_aprendiz, Programas_formacion_id_programa) 
VALUES
('FICHA-2024-001', '2024-02-01', NULL, 'Cursando', 1, 1),
('FICHA-2024-001', '2024-02-01', NULL, 'Cursando', 2, 1),
('FICHA-2024-002', '2024-02-15', NULL, 'Cursando', 3, 2),
('FICHA-2024-003', '2024-02-05', '2024-08-05', 'Completado', 4, 3),
('FICHA-2024-004', '2024-03-20', '2024-05-20', 'Retirado', 5, 4);