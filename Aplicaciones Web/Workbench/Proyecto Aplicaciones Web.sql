CREATE DATABASE fotos;
USE fotos;

CREATE TABLE Usuarios (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(25) NOT NULL,
    correo_electronico VARCHAR(30) NOT NULL UNIQUE,
    contrasena VARCHAR(25) NOT NULL
);

CREATE TABLE Resenas (
    idComen INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5) NOT NULL,
    comentario TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
);

CREATE TABLE Citas (
    idCita INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    fecha_cita DATE,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
);
