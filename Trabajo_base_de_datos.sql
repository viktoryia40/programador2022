create database if not exists peluqueria_canina;
use peluqueria_canina;

create table if not exists Dueno (
DNI int not null,
Nombre varchar(100) not null,
Apellido varchar(100) not null,
Telefono int not null,
Dirección varchar(100) not null,

primary key(DNI)

);
insert into Dueno values ("42700199","Marianela","Agostini","466163","F. M. Esquiu 1385"),("25476333","Juan Carlos","Jimenez Rufino","354789","Salta 1355"),
("24485996","Pedro","Montero","514478","Maipu 742"),("43256662","Francisco","Rivera","244785","San Martín 2577"),("32496512","Pedro","Narvaez","655872","Belgrano 680");

create table if not exists Perro (
ID_Perro int not null auto_increment,
DNI_dueno int not null,
Nombre varchar(100) not null,
Fecha_nac date not null,
Sexo char(1) not null,

Primary key(ID_Perro),
Foreign key (DNI_dueno) references Dueno(DNI)

);
insert into Perro (DNI_dueno, Nombre, Fecha_nac, Sexo) values ("42700199","Fifi","2022-08-26","F"),("25476333","Toto","2017-05-13","M"),("24485996","Pichichu","2013-03-18","F"),
("43256662","Guauguau","2021-01-23","M"),("32496512","Tobi","2020-04-15","F");

Create table if not exists Historial (
ID_Historial int not null auto_increment,
Perro int not null,
Fecha date not null,
Descripcion varchar(500) not null,
Monto int not null,

primary key(ID_Historial),
foreign key(Perro) references Perro(ID_Perro)

);
insert into Historial (Perro, Fecha, Descripcion, Monto) values (1,"2022-08-10","Corte de pelo","5000"),(2,"2022-08-09","Corte de pelo","4000"),(3,"2022-08-08","Baño","2000"),
(4,"2022-08-08","Baño","2500"),(5,"2022-08-08","corte de uñas","1500");
