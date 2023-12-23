--script para realizar el proceso de eliminar
--procedimiento almacenado para eliminar un registro
use [DBPuntoVenta]
go
--procedimiento recibe el id del producto a eliminar
create procedure [Sp_Delete_Productos](
@ID int)
as
delete from Productos where id = @ID
go
--procedemiento para modificar los datos de un registro
create procedure [Sp_Update_Productos]
(
@Id int,
@CodBarra char (40),
@Descrip varchar (100),
@PrecComp decimal (12,2),
@Imp decimal (12,2))
as
update Productos set
CodigoBarra = @CodBarra,
Descripcion = @Descrip,
PrecioCompra = @PrecComp,
Impuesto = @Imp
where ID = @Id

select * from Productos
exec [Sp_Delete_Productos] 6
go
