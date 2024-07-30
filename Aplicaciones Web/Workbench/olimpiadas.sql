CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE TipoSede (
  id_sede INT PRIMARY KEY,
  nombre VARCHAR(100),
  num_complejos INT,
  presupuesto_aprox DECIMAL(10, 2)
);

CREATE TABLE ComplejoDeportivo (
  id_complejo INT PRIMARY KEY,
  id_sede INT,
  tipoDeporte VARCHAR(50),
  localizacion VARCHAR(100),
  jefe_organizacion VARCHAR(100),
  area DECIMAL(8, 2),
  FOREIGN KEY (id_sede) REFERENCES TipoSede(id_sede)
);

CREATE TABLE Evento (
  id_evento INT PRIMARY KEY,
  id_complejo INT,
  fecha DATE,
  duracion TIME,
  num_participantes INT,
  FOREIGN KEY (id_complejo) REFERENCES ComplejoDeportivo(id_complejo)
);

CREATE TABLE Comisario (
  id_comisario INT PRIMARY KEY,
  nombre VARCHAR(100),
  labor VARCHAR(50)
);

CREATE TABLE Equipamiento (
  id_equipamiento INT PRIMARY KEY,
  tipoEquipo VARCHAR(50)
);

CREATE TABLE EventoEquipamiento (
  id_evento INT,
  id_equipamiento INT,
  PRIMARY KEY (id_evento, id_equipamiento),
  FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
  FOREIGN KEY (id_equipamiento) REFERENCES Equipamiento(id_equipamiento)
);

CREATE TABLE ComisarioEvento (
  id_comisario INT,
  id_evento INT,
  PRIMARY KEY (id_comisario, id_evento),
  FOREIGN KEY (id_comisario) REFERENCES Comisario(id_comisario),
  FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);




SET PASSWORD = PASSWORD('your_new_password');


UPDATE mysql.user SET Password=PASSWORD('your_new_password') WHERE User='root';


ALTER USER 'root'@'localhost' IDENTIFIED BY 'tu_nueva_contraseña';
