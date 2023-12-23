use [DBPuntoVenta]
go
--creamos la tabla clientes
if exists (select name from dbo.sysobjects where name = 'TBLClientes')
drop table [TBLClientes]
go

--sintaxis para crear la tabla TBLClientes
create table [TBLClientes]
(
Cedula varchar(25) not null primary key,
NombreCompleto varchar(100) not null,
Telefono varchar(25) not null,
LimiteCredito decimal(12,2) not null,
Email varchar(100) not null,
FechaNacimiento datetime not null,
FechaRegistro Datetime not null default getDate(),
Estado char not null default 'A'
)
go
--procedimiento almacenado para agregar clientes a la TBLClientes
create procedure [Sp_Ins_Clientes]
(
@Cedula varchar(25),
@NombreCompl varchar(100),
@Tel varchar(25),
@LimiteCred decimal(12,2),
@Email varchar(100),
@FechaNac datetime
)
as
insert into TBLClientes(Cedula,NombreCompleto,Telefono,LimiteCredito,Email,FechaNacimiento)
values (@Cedula,@NombreCompl,@Tel,@LimiteCred,@Email,@FechaNac)
go

--sintaxis para utilizar el procedimiento (Guardar Cliente)
--se inserta los datos en orden logico
exec [Sp_Ins_Clientes] 1234567, 'Meredith PerezP','7779',1200,'cperez@hotmail.com','12/08/1985 02:30:00'
go
 select * from TBLClientes
 go

 --sintaxis para crear un procedimiento almacenado de busqueda
 if exists (select name from dbo.sysobjects where name = 'Sp_Cns_Clientes')
 drop procedure [Sp_Cns_Clientes]
 go
 create procedure [SP_Cns_Clientes]
 (
 @NombreCompl varchar (100))
 as
 select * from TBLClientes
 where NombreCompleto like '%' + @NombreCompl + '%'
 order by Cedula
 go

 --sintaxis para ejecutar el procedimiento almacenado de busqueda en la tabla Clientes
 exec [SP_Cns_Clientes] 'Carlos Perez'
 go

 --sintaxis para crear procedimiento almacenado para borrar en la tabla Clientes
 if exists (select name from dbo.sysobjects where name = 'Sp_Delete_Clientes')
 drop procedure [Sp_Delete_Clientes]
 go
 create procedure [Sp_Delete_Clientes]
 (
 @Cedula varchar (100)
 )
 as
  begin
	delete from TBLClientes where Cedula = @Cedula
  end
 go
 --sintaxis para hacer testing del procedimiento almacenado para borrar
 select * from TBLClientes
 exec [Sp_Delete_Clientes] @Cedula = '123456'
 go

 --procedimiento almacenado para modificar los datos de registro de la tabla clientes
 create procedure [Sp_Update_Clientes]
 (
@Cedula varchar(25),
@NombreCompl varchar(100),
@Tel varchar(25),
@LimiteCred decimal(12,2),
@Email varchar(100),
@FechaNac datetime)
as
update TBLClientes set
Cedula = @Cedula,
NombreCompleto = @NombreCompl,
Telefono = @Tel,
LimiteCredito = @LimiteCred,
Email = @Email,
FechaNacimiento = @FechaNac
where Cedula = @Cedula

--sintaxis para hacer testing del procedimiento almacenado para modificar
select * from TBLClientes
exec [Sp_Update_Clientes] 123456, 'CarlosE Perez','7779',1200,'cperez@hotmail.com','12/08/1985 02:30:00'
go

