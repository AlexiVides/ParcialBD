Create database VeterinariaParcial;
use VeterinariaBD;

create table municipio(
mumId int primary key identity (1,1) not null,
municipioN nvarchar(100) not null unique
);

create table departamento(
depId int primary key identity (1,1) not null,
departamento nvarchar(50) not null unique,
municipioN int foreign key references  municipio(mumId) not null
);


create table direccion(
dirId int primary key identity (1,1) not null,
direccion nvarchar(50) not null,
departamento int foreign key references departamento(depId) not null,
codigoPostal int not null
);

create table Dueno_mascota(
dmID int primary key identity (1,1) not null,
NumIdentidad int not null unique,
nombre nvarchar(50) not null,
apellido nvarchar(50) not null,
direccion int foreign key references direccion(dirId) not null,
telefono int not null
);
-------------------------------------------------------------------------------

create table Raza(
razaId int primary key identity (1,1) not null,
razaN nvarchar(50)
);

create table TipoMascota(
tmId int primary key identity (1,1) not null,
tipoMascotaN nvarchar(50) not null,
);


create table Mascota(
masId int primary key identity (1,1) not null,
nIMascota nvarchar (5) not null,
nombre nvarchar(50) not null,
IdDueno_mascota int foreign key references Dueno_mascota(dmID) not null,
IdtipoMascota int foreign key references TipoMascota (tmId)not null,
razaId int foreign key references Raza(razaId) not null,
Observacion nvarchar(255) not null
);

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





---------------------------------------------------------------------------
create table Ingresos(
IdIngreso int primary key identity (1,1) not null,
Motivo nvarchar(200) not null,
Fecha_Ingreso date not null,
IdMascota int foreign key references Mascota(masId) not null,
IdVeterinario int foreign key references Veterinario(IdVeterinario) not null,
Observaciones nvarchar(200) not null
);

