use [DBPuntoVenta]
go

--sintaxis para crear un procedimiento almacenado para que guarde los usuarios
create procedure [Sp_Ins_Usuarios](
@Email varchar (100),
@NombreComp varchar (150),
@Pwd varchar (200))
as
insert into TBLUsuarios(Email,NombreCompleto,Password)
values (@Email,@NombreComp,@Pwd)
go

--sintaxis para utilizar el procedimiento almacenado y guardar un usuario
--importante enviar los datos en orden logico
exec [Sp_Ins_Usuarios] cperezp, 'Carlos Perez P',teste
go

select * from TBLUsuarios
