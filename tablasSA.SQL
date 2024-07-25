CREATE DATABASE p_verificacion;

USE p_verificacion;

CREATE TABLE Rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Usuario (
    cedula VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo_electronico VARCHAR(255) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES Rol(id_rol)
);

CREATE TABLE Insumos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id VARCHAR(50),
    insumo1 INT DEFAULT 0,
    insumo2 INT DEFAULT 0,
    insumo3 INT DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(cedula)
);

CREATE TABLE Permisos (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(255) NOT NULL
);

CREATE TABLE Roles_Permisos (
    id_rol INT,
    id_permiso INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    FOREIGN KEY (id_permiso) REFERENCES Permisos(id_permiso)
);

CREATE TABLE Nivel (
    id_nivel INT PRIMARY KEY AUTO_INCREMENT,
    nombre NVARCHAR(50)
);

CREATE TABLE Cursos (
    id_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Curso VARCHAR(255) NOT NULL,
    Materia VARCHAR(255) NOT NULL,
    Docente VARCHAR(255) NOT NULL,
    Horario VARCHAR(255) NOT NULL,
    id_nivel INT,
    FOREIGN KEY (id_nivel) REFERENCES Nivel(id_nivel)
);

CREATE TABLE Matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    cedula_usuario VARCHAR(50),
    id_cursos INT,
    FOREIGN KEY (cedula_usuario) REFERENCES Usuario(cedula),
    FOREIGN KEY (id_cursos) REFERENCES Cursos(id_Curso)
);

-- Insertar datos
INSERT INTO Rol (nombre) VALUES ('Estudiante'), ('Docente'), ('Secretario');

INSERT INTO Usuario (cedula, nombre, correo_electronico, contraseña, rol_id) VALUES 
('2233445566', 'Ana Gómez', 'ana@example.com', 'passwordabc', 3),
('3344556677', 'Pedro Martínez', 'pedro@example.com', 'passworddef', 3),
('12345678', 'Juan Pérez', 'juan@example.com', 'contraseña', 1),
('87654321', 'Ana Gómez', 'ana@example.com', 'contraseña', 2),
('0951995240', 'Paul Rizo', 'paul@gmail.com', '123', 3),
('0955308374', 'Josue', 'josue@gmail.com', '123', 3),
('0950741306', 'Bruno BAQUE', 'BRUNO@baque.com', '12345', 3);

INSERT INTO Insumos (usuario_id, insumo1, insumo2, insumo3) VALUES 
('2233445566', 15, 25, 35),
('3344556677', 20, 30, 40),
('0955308374', 10, 10, 10),
('0951995240', 10, 5, 10);



INSERT INTO Permisos (nombre_permiso) VALUES 
('Ver Calificaciones'), ('Ingresar Calificaciones'), ('Ver Asistencia');

INSERT INTO Roles_Permisos (id_rol, id_permiso) VALUES
(1, 2), -- Docente puede ingresar calificaciones
(1, 1), -- Docente puede ver calificaciones
(2, 3); -- Secretario puede ver asistencia

INSERT INTO Nivel (nombre) VALUES 
('Nivel 1'),
('Nivel 2'),
('Nivel 3');

INSERT INTO Cursos (Curso, Materia, Docente, Horario, id_nivel) VALUES 
('1-1', 'Grammar', 'Ana Torres', 'Lunes 10:00-12:00', 1),
('2-1', 'Listening', 'Carlos Méndez', 'Martes 14:00-16:00', 1),
('3-1', 'Speaking', 'Laura Fernández', 'Miércoles 09:00-11:00', 2),
('1-2', 'Grammar', 'Jorge López', 'Jueves 11:00-13:00', 2),
('2-2', 'Listening', 'Marta García', 'Viernes 15:00-17:00', 3),
('3-2', 'Speaking', 'Luis Pérez', 'Sábado 10:00-12:00', 3);
INSERT INTO Matricula (id_matricula, cedula_usuario, id_cursos) VALUES
(1, '0955308374', 2),
(2, '0951995240', 3);
