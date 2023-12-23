use [DBPuntoVenta]
go
--sintaxis para crear un procedimiento almacenado que guarde productos
create procedure [Sp_Ins_Productos](
@CodBarra char (40),
@Descrip varchar (100),
@PrecComp decimal (12,2),
@Imp decimal (12,2))
as
insert into Productos(CodigoBarra,Descripcion,PrecioCompra,Impuesto)
values (@CodBarra,@Descrip,@PrecComp,@Imp)
go
--sintaxis para utilizar un procedimiento y guardar un producto
--es muy importante enviar los valores en orden logico
exec [Sp_Ins_Productos] 1245, 'Sal', 450, 13
go
select * from Productos