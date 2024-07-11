-- Creación de la tabla rol
CREATE TABLE rol (
  id_rol int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(255) NOT NULL,
  PRIMARY KEY (id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserción de los roles específicos
INSERT INTO rol (id_rol, nombre) VALUES
(1, 'Secretaria'),
(2, 'Docente');

-- Creación de la tabla usuario
CREATE TABLE usuario (
  cedula varchar(15) NOT NULL,
  nombre varchar(255) NOT NULL,
  correo_electronico varchar(255) NOT NULL,
  contraseña varchar(255) NOT NULL,
  rol_id int(11) DEFAULT NULL,
  PRIMARY KEY (cedula),
  KEY fk_usuario_rol (rol_id),
  CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES rol (id_rol) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE permisos (
  id_permiso int(11) NOT NULL AUTO_INCREMENT,
  -- otras columnas según sea necesario,
  PRIMARY KEY (id_permiso)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE roles_permisos (
  id_rol int(11) NOT NULL,
  id_permiso int(11) NOT NULL,
  PRIMARY KEY (id_rol, id_permiso),
  CONSTRAINT fk_roles_permisos_rol FOREIGN KEY (id_rol) REFERENCES rol (id_rol) ON DELETE CASCADE,
  CONSTRAINT fk_roles_permisos_permisos FOREIGN KEY (id_permiso) REFERENCES permisos (id_permiso) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Inserción de usuarios de ejemplo con los nuevos roles
INSERT INTO usuario (cedula, nombre, correo_electronico, contraseña, rol_id) VALUES
('0931116255', 'Marcos Baya', 'davidbayas95@hotmail.com', 'contraseña123', 2),
('2150337331', 'Maybeth Jimenez', 'mbayas@assist.com.uy', 'usuario456', 1);