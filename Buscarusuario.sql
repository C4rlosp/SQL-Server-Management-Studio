--selecciono la base de datos
use [DBPuntoVenta]
go
--sintaxis para consultar tabla de usuarios
select * from TBLUsuarios
go
--sintaxis para crear un procedimiento almacenado que haga la busqueda
if exists (select name from dbo.sysobjects where name = 'Sp_Cns_Usuarios')
drop procedure [Sp_Cns_Usuarios]
go
--sintaxis para crear un procedimiento almacenado de busqueda
Create procedure [Sp_Cns_Usuarios](
@NombreComplete varchar (100))
as
select * from TBLUsuarios
where NombreCompleto like '%' + @NombreComplete + '%'
order by Email
go
--sintaxis para ejecutar el procedimiento almacenado de la tabla usuario
exec [Sp_Cns_Usuarios] 'Carlos Perez'
go