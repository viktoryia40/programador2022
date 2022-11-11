CREATE DATABASE peluqueria_canina;

USE peluqueria_canina;

CREATE TABLE Dueno (
DNI int NOT NULL UNIQUE,
Nombre varchar(40) NOT NULL,
Apellido varchar(40) NOT NULL,
Telefono int NOT NULL,
Direccion varchar(200),
PRIMARY KEY (DNI)
);

CREATE TABLE Perro (
ID_Perro int NOT NULL UNIQUE,
Nombre varchar(20) NOT NULL,
Fecha_nac datetime,
Sexo varchar(10),
DNI_dueno int NOT NULL,
PRIMARY KEY (ID_Perro),
FOREIGN KEY (DNI_dueno) REFERENCES Dueno (DNI)
);

CREATE TABLE Historial (
ID_Historial int NOT NULL UNIQUE,
Fecha datetime NOT NULL,
Perro int NOT NULL,
Descripcion varchar(200),
Monto float NOT NULL,
PRIMARY KEY (ID_Historial),
FOREIGN KEY (Perro) REFERENCES Perro (ID_Perro)
);

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion)
VALUES 
(34317654, "Vanessa", "Veizaga", 3517366652, "Bv. Los Granaderos 2858"),
(31768712, "Esteban", "Ramos", 3517966652, "Bv. Los Granaderos 2858"),
(17154740, "Viviana", "Pertiñez", 3516892152, "Paloma 539");

ALTER TABLE Dueno 
MODIFY Telefono bigint NOT NULL;

INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_dueno)
VALUES 
(1, "Zuka", "01-07-2009", "Hembra", 34317654),
(2, "Popis", "11-04-2011", "Hembra", 34317654),
(3, "Luna", "10-03-2012", "Hembra", 17154740),
(4, "Pancho", "25-11-2011", "Macho", 31768712);

INSERT INTO Historial (ID_Historial, Fecha, Perro, Descripcion, Monto)
VALUES 
(1, "20-05-03", 1, "Baño", 200),
(2, "20-06-10", 2, "Baño", 250),
(3, "20-08-17", 3, "Baño", 150),
(4, "20-10-25", 4, "Baño", 200),
(5, "21-03-02", 1, "Corte de pelo", 300),
(6, "21-07-18", 3, "Corte de pelo", 200),
(7, "21-12-31", 3, "Baño", 250),
(8, "22-05-03", 2, "Corte de pelo", 220),
(9, "22-07-23", 4, "Baño", 280),
(10, "22-08-07", 1, "Corte de pelo", 350);

/* Ejercicio 6 */

SELECT ID_Perro, Nombre, Fecha
FROM Perro 
JOIN Historial
ON ID_Perro = Perro
WHERE Fecha >= "2022-01-01";