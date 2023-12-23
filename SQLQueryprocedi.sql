USE [VuelosCR]
GO

create PROCEDURE [RegistrarTiquete]
(
    @cedCliente VARCHAR(30),
    @nombreCliente VARCHAR(30),
    @destino VARCHAR(50),
    @aerolinea VARCHAR(50),
    @precio DECIMAL(18,2),
    @montoServicio DECIMAL(18,2),
    @montoIVA DECIMAL(18,2),
    @precioTotal DECIMAL(18,2)
)
AS
BEGIN
    -- Verificar si el cliente ya existe en la tabla [Clientes]
    IF NOT EXISTS (SELECT 1 FROM [Clientes] WHERE cedula = @cedCliente)
    BEGIN
        -- Si el cliente no existe, lo insertamos con un nombre no nulo
        INSERT INTO [Clientes] (cedula, nombreCompleto)
        VALUES (@cedCliente, ISNULL(@nombreCliente, ''));
    END
    ELSE
    BEGIN
        -- Si el cliente existe, actualizamos su nombre si se proporciona
        IF @nombreCliente IS NOT NULL
        BEGIN
            UPDATE [Clientes]
            SET nombreCompleto = @nombreCliente
            WHERE cedula = @cedCliente;
        END
    END

    -- Insertar el tiquete en la tabla [Tiquetes]
    INSERT INTO [Tiquetes] (cedCliente, destino, aerolinea, precio, montoServicio, montoIVA, precioTotal)
    VALUES (@cedCliente, @destino, @aerolinea, @precio, @montoServicio, @montoIVA, @precioTotal);
END
GO

-- Ejemplo con cédula y nombre del cliente
EXEC RegistrarTiquete '123456789', 'Juan Pérez', 'Miami', 'American Airlines', 500.00, 50.00, 75.00, 625.00;

-- Ejemplo solo con cédula del cliente
EXEC RegistrarTiquete '987654321', NULL, 'Nueva York', 'Delta Airlines', 600.00, 60.00, 90.00, 750.00;

select * from Tiquetes
select * from Clientes