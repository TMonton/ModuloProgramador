CREATE DATABASE acelerador_DB;
CREATE TABLE inventores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nacionalidad VARCHAR(50),
    fecha_nacimiento date,
    fecha_fallecimiento date,
    logros VARCHAR(300)
) ENGINE=InnoDB;

CREATE TABLE aceleradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(50),
	fecha DATE,
    id_inventor INT,
	descripcion VARCHAR(300),
    CONSTRAINT FK_Acelerador_Inventor FOREIGN KEY(Id) REFERENCES Inventores(Id)
) ENGINE=InnoDB;

CREATE TABLE experimento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    descripcion VARCHAR(300),
    id_acelerador INT,
    id_inventor INT,
    CONSTRAINT FK_experimento_acelerador FOREIGN KEY(Id_acelerador) REFERENCES aceleradores(Id),
    CONSTRAINT FK_experimento_inventor FOREIGN KEY(Id_inventor) REFERENCES Inventores(Id)
) ENGINE=InnoDB;

CREATE TABLE resultado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(300),
    valor INT,
    fecha_registro DATE,
    id_experimento INT,
    CONSTRAINT FK_resultado_experimento FOREIGN KEY(Id_experimento) REFERENCES experimento(Id)
) ENGINE=InnoDB;

use acelerador_db;

INSERT INTO inventores (nombre, nacionalidad, fecha_nacimiento, fecha_fallecimiento, logros)
VALUES
('John Cockcroft', 'Británico', '1897-05-27', '1967-09-18', 'Premio Nobel de Física en 1951'),
('Ernest Walton', 'Irlandés', '1903-10-06', '1995-06-25', 'Desarrollador del acelerador Cockcroft-Walton'),
('Robert J. Van de Graaff', 'Estadounidense', '1901-12-20', '1967-01-16', 'Inventor del generador Van de Graaff'),
('Simon van der Meer', 'Neerlandés', '1925-11-24', '2011-03-04', 'Premio Nobel de Física en 1984 por su trabajo en el CERN');

INSERT INTO aceleradores (nombre_modelo, fecha, id_inventor, descripcion)
VALUES
('Cockcroft-Walton', '1932-05-01', 1, 'Acelerador lineal desarrollado en la Universidad de Cambridge.'),
('Van de Graaff', '1930-06-01', 3, 'Generador electrostático de alta tensión para acelerar partículas.'),
('Sincrotrón', '1980-09-01', 4, 'Acelerador circular utilizado para generar luz sincrotrón en el CERN.');

INSERT INTO experimento (nombre, fecha_inicio, fecha_fin, descripcion, id_acelerador, id_inventor)
VALUES
('Experimento Cockcroft-Walton', '1932-07-01', '1932-07-15', 'Primer experimento exitoso de aceleración de partículas', 1, 1),
('Van de Graaff Prueba 1', '1930-07-01', '1930-07-15', 'Prueba de tensión electrostática con el generador', 2, 3),
('CERN Luz Sincrotrón', '1981-05-01', '1981-12-31', 'Generación de luz sincrotrón para estudiar la estructura atómica', 3, 4);


INSERT INTO resultado (descripcion, valor, fecha_registro, id_experimento)
VALUES
('Éxito en la primera aceleración de protones', 100, '1932-07-15', 1),
('Generación de 2 MV de potencial electrostático', 90, '1930-07-15', 2),
('Luz sincrotrón de alta intensidad', 95, '1981-12-31', 3);

SELECT * FROM inventores;

SELECT nombre, nacionalidad FROM inventores WHERE fecha_nacimiento < '1900-01-01';

SELECT * FROM experimento WHERE id>=2;

SELECT fecha_registro, descripcion FROM resultado;

SELECT fecha_registro, nacionalidad FROM resultado, inventores;