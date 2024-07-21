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
INSERT INTO Usuario (cedula, nombre, correo_electronico, contraseña, rol_id) VALUES 
('2233445566', 'Ana Gómez', 'ana@example.com', 'passwordabc', 3),
('3344556677', 'Pedro Martínez', 'pedro@example.com', 'passworddef', 3);

CREATE TABLE Insumos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id VARCHAR(50),
    insumo1 INT DEFAULT 0,
    insumo2 INT DEFAULT 0,
    insumo3 INT DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(cedula)
);
INSERT INTO Insumos (usuario_id, insumo1, insumo2, insumo3) VALUES 
('2233445566', 15, 25, 35),
('3344556677', 20, 30, 40);
CREATE TABLE Permisos (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_permiso VARCHAR(255) NOT NULL
);
INSERT INTO Rol (nombre) VALUES ('Docente'), ('Secretario');

INSERT INTO Usuario (cedula, nombre, correo_electronico, contraseña, rol_id) VALUES
('12345678', 'Juan Pérez', 'juan@example.com', 'contraseña', 1),
('87654321', 'Ana Gómez', 'ana@example.com', 'contraseña', 2);

INSERT INTO Permisos (nombre_permiso) VALUES ('Ver Calificaciones'), ('Ingresar Calificaciones'), ('Ver Asistencia');

INSERT INTO Roles_Permisos (id_rol, id_permiso) VALUES
(1, 2), -- Docente puede ingresar calificaciones
(1, 1), -- Docente puede ver calificaciones
(2, 3); -- Secretario puede ver asistencia
CREATE TABLE Roles_Permisos (
    id_rol INT,
    id_permiso INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    FOREIGN KEY (id_permiso) REFERENCES Permisos(id_permiso)
);

create table Cursos(
id_Curso int primary Key AUTO_INCREMENT,
Curso varchar(255) not null,
Materia varchar(255) not null,
Docente varchar (255) not null,
Horario varchar(255) not null,
id_nivel int,
FOREIGN KEY (id_nivel) REFERENCES Nivel(id_nivel)
);
create table Matricula(
id_matricula int AUTO_INCREMENT PRIMARY KEY,
cedula_usuario VARCHAR(50),
id_cursos int,
FOREIGN KEY (cedula_usuario) REFERENCES Usuario(cedula),
FOREIGN KEY (id_cursos) References Cursos(id_Curso)
);

create table nivel(
id_nivel int primary key auto_increment,
 nombre nvarchar(50)
);

INSERT INTO Rol (nombre) VALUES ('Estudiante')

INSERT INTO Usuario (cedula, nombre, correo_electronico, contraseña, rol_id) VALUES
('0950741306', 'Bruno BAQUE', 'BRUNO@baque.com', '12345', 3),
