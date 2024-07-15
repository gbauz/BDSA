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
