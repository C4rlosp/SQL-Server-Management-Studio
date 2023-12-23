use [Master]
go
if exists(select name from dbo.sysdatabases where name = 'DbCiclismo')
drop database [DbCiclismo]
go
create database [DbCiclismo]
go
use [DbCiclismo]
go
create table [Bicicletas](
ID int not null primary key,
Modelo varchar(150) not null,
Annio  int not null,
PrecioVenta decimal(12,2) not null,
Categoria  char not null,
FechaCompra datetime not null,
FechaRegistro datetime not null default getdate(),
Estado char not null default 'A')
go
select  * from Bicicletas
go
insert into Bicicletas(Id,Modelo,Annio,PrecioVenta,Categoria,FechaCompra)values(1,'Profesional',2022,85000,'R',2023-12-16)
go

--- creamos la tabla Usuarios
create table [Usuarios]
(
Email varchar (100) not null primary key,
NombreCompleto varchar (100) not null,
Password varchar (200) not null,
FechaRegistro datetime not null default getdate(),
Estado char not null default 'A'
)
go
insert into Usuarios (Email, NombreCompleto, Password, FechaRegistro, Estado)
values ('JCruz@gmail.com', 'Melber Cruz', 'UH2023', '2023-12-16', 'A');
go
select * from Usuarios
go

