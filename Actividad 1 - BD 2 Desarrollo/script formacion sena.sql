CREATE DATABASE FormacionSena;
USE FormacionSena;

CREATE TABLE Programas_formacion (
    id_programa INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_programa VARCHAR(200) NOT NULL,
    descripcion TEXT,
    nivel_formacion ENUM('Técnico', 'Tecnólogo', 'Especialización', 'Curso corto') NOT NULL,
    duracion INT NOT NULL,
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    fecha_inicio DATE NOT NULL,
    fecha_finalizacion DATE
) ENGINE=InnoDB;


CREATE TABLE Competencias (
    id_competencia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_competencia VARCHAR(200) NOT NULL,
    descripcion TEXT,
    horas_estimadas INT,
    
    Programas_formacion_id_programa INT NOT NULL,
    
    CONSTRAINT fk_Competencias_Programas_formacion 
    FOREIGN KEY (Programas_formacion_id_programa)
    REFERENCES Programas_formacion(id_programa)
) ENGINE=InnoDB;

CREATE TABLE Modalidades (
    id_modalidad INT AUTO_INCREMENT PRIMARY KEY,
    tipo_modalidad ENUM('Presencial', 'Virtual', 'Mixta') NOT NULL,
    cupo_maximo INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    
    Competencias_id_competencia INT NOT NULL,
    
    CONSTRAINT fk_Modalidades_Competencias 
    FOREIGN KEY (Competencias_id_competencia)
    REFERENCES Competencias(id_competencia)
) ENGINE=InnoDB;

CREATE TABLE Instructores (
    id_instructor INT AUTO_INCREMENT PRIMARY KEY,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    tipo_documento ENUM('CC', 'CE', 'TI', 'Pasaporte') NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    especialidad VARCHAR(150),
    fecha_vinculacion DATE,
    estado_instructor ENUM('Activo', 'Inactivo', 'Licencia') DEFAULT 'Activo'
) ENGINE=InnoDB;

CREATE TABLE Instructores_Modalidades (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_asignacion DATE NOT NULL,
    
    Instructores_id_instructor INT NOT NULL,
    Modalidades_id_modalidad INT NOT NULL,
    
    CONSTRAINT fk_InstMod_Instructores 
    FOREIGN KEY (Instructores_id_instructor)
    REFERENCES Instructores(id_instructor),
    
    CONSTRAINT fk_InstMod_Modalidades 
    FOREIGN KEY (Modalidades_id_modalidad)
    REFERENCES Modalidades(id_modalidad),
    
    CONSTRAINT uq_instructor_modalidad UNIQUE (Instructores_id_instructor, Modalidades_id_modalidad)
) ENGINE=InnoDB;


CREATE TABLE Aprendices (
    id_aprendiz INT AUTO_INCREMENT PRIMARY KEY,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    tipo_documento ENUM('CC', 'CE', 'TI', 'Pasaporte') NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    direccion VARCHAR(200),
    estado_aprendiz ENUM('Activo', 'Inactivo', 'Graduado', 'Retirado') DEFAULT 'Activo'
) ENGINE=InnoDB;


CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    ficha VARCHAR(20) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado ENUM('Cursando', 'Completado', 'Retirado', 'Aplazado') DEFAULT 'Cursando',
    
    Aprendices_id_aprendiz INT NOT NULL,
    Programas_formacion_id_programa INT NOT NULL,
    
    CONSTRAINT fk_Matriculas_Aprendices FOREIGN KEY (Aprendices_id_aprendiz)
        REFERENCES Aprendices(id_aprendiz),
    CONSTRAINT fk_Matriculas_Programas FOREIGN KEY (Programas_formacion_id_programa)
        REFERENCES Programas_formacion(id_programa)
) ENGINE=InnoDB;