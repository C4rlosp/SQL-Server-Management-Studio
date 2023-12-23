
--Seleccionar la base de datos
use [DBPuntoVenta]
go
-- Catalogos listado de datos especificos
-- Productos
-- Se valida si existe la tabla de productos
if exists(select name from dbo.sysobjects where name = 'Productos')
drop table [Productos] -- se borra la tabla productos
go

-- Sintaxis para crear tabla productos
create table [Productos](
ID int not null primary key identity,
CodigoBarra varchar(40) not null,
Descripcion varchar(100) not null,
PrecioCompra decimal (12,2) not null,
Impuesto decimal (12,2) not null,
FechaRegistro datetime not null default getdate(),
Estado char not null default 'A')
go

--almacenar tres productos
insert into Productos (CodigoBarra,Descripcion,PrecioCompra,Impuesto)
values ('1112221', 'Arroz Almendros', 1550.00,13)
go
insert into Productos (CodigoBarra,Descripcion,PrecioCompra,Impuesto)
values ('1112222', 'Frijoles Indiana', 950.00,13)
go
insert into Productos (CodigoBarra,Descripcion,PrecioCompra,Impuesto)
values ('1112223', 'Atun Azul Sardimar', 1950.00,13)
go
--sintaxis para ver todos los datos de una tabla
select * from Productos
go

--sintaxis para crear un procedimiento almancenado de busqueda
if exists (select name from dbo.sysobjects where name = 'Sp_Cns_Productos')
drop procedure [Sp_Cns_Productos]
go

-- sintaxis para crear un procedimiento almacenado de busqueda
create procedure [Sp_Cns_Productos]
(
@Descrip varchar (100)
)
as
select * from Productos
where Descripcion like '%' + @Descrip + '%'
order by Descripcion
go

-- sintaxis para ejectur un procedimiento almacenado
-- buscamos por productos
exec [Sp_Cns_Productos] 'Ind'
go