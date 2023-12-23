use [master]
go
if exists(select name from dbo.sysdatabases where name ='EmpleadosWeb')
drop database [EmpleadosWeb]
go
create database [EmpleadosWeb]
go
use [EmpleadosWeb]
go
create table Empleados 
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    NombreCompleto NVARCHAR(255), -- Ajusta el tamaño según tus necesidades
    HNormales DECIMAL(18, 2), -- Ajusta la precisión y escala según tus necesidades
    HExtras DECIMAL(18, 2), -- Ajusta la precisión y escala según tus necesidades
    SalarioBruto DECIMAL(18, 2), -- Ajusta la precisión y escala según tus necesidades
    SalarioNeto DECIMAL(18, 2), -- Ajusta la precisión y escala según tus necesidades
    Deducciones DECIMAL(18, 2), -- Ajusta la precisión y escala según tus necesidades
	FechaRegistro DATETIME
)
go
select * from Empleados
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