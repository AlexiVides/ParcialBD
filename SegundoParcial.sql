Create database VeterinariaParcialBD;
use VeterinariaParcialBD;


create table municipio(
mumId int primary key identity (1,1) not null,
municipioN nvarchar(100) not null unique
);

insert into municipio(municipioN)
values('Ojos de agua');
insert into municipio(municipioN)
values('Chalatenango');

create table departamento(
depId int primary key identity (1,1) not null,
departamento nvarchar(50) not null unique,
municipioN int foreign key references  municipio(mumId) not null
);

insert into departamento(departamento,municipioN)
values('San salvador',1);
insert into departamento(departamento,municipioN)
values('Chalatenago',2);

create table direccion(
dirId int primary key identity (1,1) not null,
direccion nvarchar(50) not null,
departamento int foreign key references departamento(depId) not null,
codigoPostal int not null
);

insert into direccion(direccion,departamento,codigoPostal)
values('Barrio el centro',1,1244);
insert into direccion(direccion,departamento,codigoPostal)
values('Barrio el centro',2,12345);


create table Telefono(
IdTelefono int primary key identity (1,1) not null,
Telefono int not null
);

insert into Telefono(Telefono)
values(23456789);
insert into Telefono(Telefono)
values(64589345);
insert into Telefono(Telefono)
values(72422346);
insert into Telefono(Telefono)
values(34712345);

create table Dueno_mascota(
dmID int primary key identity (1,1) not null,
NumIdentidad int not null unique,
nombre nvarchar(50) not null,
apellido nvarchar(50) not null,
direccion int foreign key references direccion(dirId) not null,
IdTelefono int foreign key references Telefono(IdTelefono) not null
);

insert into Dueno_mascota(NumIdentidad,nombre,apellido,direccion,IdTelefono)
values(1342,'Daniel','Tejada',1,1);
insert into Dueno_mascota(NumIdentidad,nombre,apellido,direccion,IdTelefono)
values(234,'Juan','Menjivar',2,2);
insert into Dueno_mascota(NumIdentidad,nombre,apellido,direccion,IdTelefono)
values(7653,'Osacar','Lopez',1,3);
insert into Dueno_mascota(NumIdentidad,nombre,apellido,direccion,IdTelefono)
values(98765,'Miguel','Navarrete',2,4);
-------------------------------------------------------------------------------

create table Raza(
razaId int primary key identity (1,1) not null,
razaN nvarchar(50) not null
);

insert into Raza(razaN)
values('Indio');
insert into Raza(razaN)
values('Hosky');
insert into Raza(razaN)
values('Angora');


create table TipoMascota(
tmId int primary key identity (1,1) not null,
tipoMascotaN nvarchar(50) not null,
);

insert into TipoMascota(tipoMascotaN)
values('Perro');
insert into TipoMascota(tipoMascotaN)
values('Gato');

create table Mascota(
masId int primary key identity (1,1) not null,
nIMascota nvarchar (5) not null,
nombre nvarchar(50) not null,
IdDueno_mascota int foreign key references Dueno_mascota(dmID) not null,
IdtipoMascota int foreign key references TipoMascota (tmId)not null,
razaId int foreign key references Raza(razaId) not null,
Observacion nvarchar(255) not null
);
select*from Mascota
select*from Dueno_mascota

insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('a1','Diggi', 1,1,1,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('b1','Rocky', 5,1,2,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('c1','Guapo', 6,1,1,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('d1','Zlatan', 7,1,2,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('e1','Tacuache', 1,1,1,'sin observaciones');

select*from Mascota

insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('a2','Michi', 1,2,1,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('a5','Doby', 5,2,1,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('c24','Pantera', 6,2,1,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('f15','Patitas', 7,2,1,'sin observaciones');
insert into Mascota(nIMascota, nombre, IdDueno_mascota, IdtipoMascota, razaId, Observacion)
values('a40','Melo', 1,2,1,'sin observaciones');

--------------------------------------------------------------------------

create table Cargos(
IdCargos int primary key identity (1,1) not null,
cargos nvarchar (100) not null,
);

insert into Cargos(cargos) 
values ('Director');
insert into Cargos(cargos) 
values ('Cirujano');
insert into Cargos(cargos) 
values ('Consulta');

Create table Veterinario(
IdVeterinario int primary key identity (1,1) not null,
Nombre nvarchar(50) not null,
Apellido nvarchar(50) not null,
IdCargo int foreign key references Cargos(IdCargos)
);

insert into Veterinario (Nombre,Apellido,IdCargo)
Values('Sara','Navarrete',1);
insert into Veterinario (Nombre,Apellido,IdCargo)
Values('Marcos','Vides',2);
insert into Veterinario (Nombre,Apellido,IdCargo)
Values('Nestor','Zamora',3);
insert into Veterinario (Nombre,Apellido,IdCargo)
Values('Alexi','López',3);



---------------------------------------------------------------------------
create table Ingresos(
IdIngreso int primary key identity (1,1) not null,
Motivo nvarchar(200) not null,
Fecha_Ingreso date not null,
IdMascota int foreign key references Mascota(masId) not null,
IdVeterinario int foreign key references Veterinario(IdVeterinario) not null,
Observaciones nvarchar(200) not null
);

select*from Mascota

insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',1,1,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',5,2,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',6,3,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',7,4,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',8,1,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',1,2,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',9,3,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',10,4,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',11,1,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',12,2,'Sin observacion');

insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',1,1,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',5,2,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',8,3,'Sin observacion');
insert into Ingresos(Motivo,Fecha_Ingreso,IdMascota,IdVeterinario,Observaciones)
values('Enfermo','2021-11-12',12,4,'Sin observacion');