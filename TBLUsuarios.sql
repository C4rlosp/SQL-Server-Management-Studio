
--Seleccionar la tabla a utiliza
use [master]
go
--Verificar si la tabla exite
if exists (select name from dbo.sysdatabases where name = 'DBPuntoVenta')
drop database [DBPuntoVenta] 
go
--Crear una tabla
create database [DBPuntoVenta]
go 

--Seleccionar la tabla a utilizar
use [DBPuntoVenta]
go

--Verificar si la tabla exite
if exists (select name from dbo.sysobjects where name = 'TBLUsuarios')
drop table [TBUsuarios]
go

--Sintaxis para crear una tabla de campos espicificos
create table [TBLUsuarios]
(Email varchar (100) not null primary key,
NombreCompleto varchar (150) not null,
Password varchar (200) not null,
FechaRegistro datetime not null default getdate(),
Estado char not null default 'A')
go

--Sintaxis para almacenar datos en una tabla
insert into TBLUsuarios(Email,NombreCompleto,Password)
values ('admin@gmail.com','Administrador','admin')
go

insert into TBLUsuarios(Email,NombreCompleto,Password)
values ('cperez@gmail.com','Carlos Perez','12345')
go

--Sintaxis para mostrar todos los datos almacenados en una tabla
select * from TBLUsuarios
go

--transac-sql permite consultar los datos de un usuario especifico
--select * from TBLUsuarios where Email = 'admin@gmail.com' and Password = 'admin'
select Email,NombreCompleto,Password,FechaRegistro,Estado from TBLUsuarios where Email = 'admin@gmail.com' and Password = 'admin'
go
