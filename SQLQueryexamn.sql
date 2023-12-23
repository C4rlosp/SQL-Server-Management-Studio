use [VuelosCR]
go
if exists (select name from dbo.sysobjects where name = 'Sp_Ins_Clientes')
drop procedure [Sp_Ins_Clientes]
go
create procedure [Sp_Ins_Clientes]
(
	@CedCliente varchar(30),
    @NombreCliente varchar(30),
    @Destino varchar(50),
    @Aerolinea varchar(50),
    @Precio decimal(18,2),
    @MontoServicio decimal(18,2),
    @MontoIVA decimal(18,2),
    @PrecioTotal decimal(18,2),
    @FechaCompra datetime
)
as
begin
    -- Insertar en la tabla Clientes
    insert into Clientes (cedula, nombreCompleto)
    values (@CedCliente, @NombreCliente)

    -- Insertar en la tabla Tiquetes
    insert into Tiquetes (cedCliente, destino, aerolinea, precio, montoServicio, montoIVA, precioTotal, fechaCompra)
    values (
        @CedCliente, 
        @Destino, 
        @Aerolinea, 
        @Precio, 
        @MontoServicio, 
        @MontoIVA, 
        @PrecioTotal,
        @FechaCompra
    )
end
go
select * from Tiquetes
go

exec [Sp_Ins_Clientes]121323,'Carlos','Nicaragua','Avianca',123,333,2344,545334,'12/08/1985 02:30:00'
go