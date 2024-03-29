USE [master]
GO
/****** Object:  Database [Sucursal3]    Script Date: 17/06/2019 5:18:55 AM ******/
CREATE DATABASE [Sucursal3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sucursal3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Sucursal3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sucursal3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Sucursal3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sucursal3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sucursal3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sucursal3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sucursal3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sucursal3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sucursal3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sucursal3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sucursal3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sucursal3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sucursal3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sucursal3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sucursal3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sucursal3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sucursal3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sucursal3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sucursal3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sucursal3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sucursal3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sucursal3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sucursal3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sucursal3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sucursal3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sucursal3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sucursal3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sucursal3] SET RECOVERY FULL 
GO
ALTER DATABASE [Sucursal3] SET  MULTI_USER 
GO
ALTER DATABASE [Sucursal3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sucursal3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sucursal3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sucursal3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sucursal3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sucursal3] SET QUERY_STORE = OFF
GO
USE [Sucursal3]
GO
/****** Object:  Table [dbo].[AutomovilXConsignacion]    Script Date: 17/06/2019 5:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomovilXConsignacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[anho] [int] NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[comision] [float] NOT NULL,
	[costoModelo] [money] NOT NULL,
	[idmarca] [int] NOT NULL,
	[idtipo] [int] NOT NULL,
 CONSTRAINT [PK_AutomovilXConsignacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditosXCliente]    Script Date: 17/06/2019 5:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditosXCliente](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idInteres] [int] NOT NULL,
	[cantPagos] [int] NOT NULL,
	[saldoTotal] [money] NOT NULL,
 CONSTRAINT [PK_CreditosXCliente] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/06/2019 5:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[idPuesto] [int] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[fechaContratacion] [date] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenXAutomovil]    Script Date: 17/06/2019 5:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenXAutomovil](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAutomovil] [int] NOT NULL,
	[imagen] [image] NOT NULL,
 CONSTRAINT [PK_ImagenXAutomovil] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interes]    Script Date: 17/06/2019 5:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interes](
	[id] [int] NOT NULL,
	[porcentaje] [float] NOT NULL,
 CONSTRAINT [PK_Interes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 17/06/2019 5:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAutomovil] [int] NOT NULL,
	[fechaIngreso] [date] NOT NULL,
	[consignacion] [bit] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 17/06/2019 5:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[id] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MetodoPago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 17/06/2019 5:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCredito] [int] NOT NULL,
	[fechaPago] [date] NOT NULL,
	[montoPagado] [money] NOT NULL,
	[idMetodoPago] [int] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoTarjeta]    Script Date: 17/06/2019 5:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoTarjeta](
	[id] [int] NOT NULL,
	[montoRetenido] [money] NOT NULL,
 CONSTRAINT [PK_PagoTarjeta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 17/06/2019 5:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[id] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[salario] [money] NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 17/06/2019 5:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idFacturador] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idInventario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[monto] [money] NOT NULL,
	[idMetodoPago] [int] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaTarjeta]    Script Date: 17/06/2019 5:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaTarjeta](
	[id] [int] NOT NULL,
	[montoRetenido] [money] NOT NULL,
 CONSTRAINT [PK_VentaTarjeta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AutomovilXConsignacion] ON 
GO
INSERT [dbo].[AutomovilXConsignacion] ([id], [modelo], [anho], [descripcion], [comision], [costoModelo], [idmarca], [idtipo]) VALUES (1, N'Rampage', 2015, N'Auto por Consignacion 1', 0.1, 6000000.0000, 1, 3)
GO
INSERT [dbo].[AutomovilXConsignacion] ([id], [modelo], [anho], [descripcion], [comision], [costoModelo], [idmarca], [idtipo]) VALUES (2, N'Nola', 2016, N'Auto por Consignacion 2', 0.2, 3900000.0000, 3, 2)
GO
INSERT [dbo].[AutomovilXConsignacion] ([id], [modelo], [anho], [descripcion], [comision], [costoModelo], [idmarca], [idtipo]) VALUES (3, N'Bazuka', 2017, N'Auto por Consignacion 3', 0.1, 8000000.0000, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[AutomovilXConsignacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 
GO
INSERT [dbo].[Empleado] ([id], [cedula], [nombre], [apellido], [idPuesto], [fechaNacimiento], [fechaContratacion], [correo], [telefono]) VALUES (1, N'378965625', N'Harry', N'Potter', 1, CAST(N'1987-05-06' AS Date), CAST(N'2018-08-07' AS Date), N'harry@gmail.com', N'88888884')
GO
INSERT [dbo].[Empleado] ([id], [cedula], [nombre], [apellido], [idPuesto], [fechaNacimiento], [fechaContratacion], [correo], [telefono]) VALUES (2, N'312458563', N'Homero', N'Simpson', 2, CAST(N'1956-05-12' AS Date), CAST(N'2018-01-07' AS Date), N'homero@gmail.com', N'88888883')
GO
INSERT [dbo].[Empleado] ([id], [cedula], [nombre], [apellido], [idPuesto], [fechaNacimiento], [fechaContratacion], [correo], [telefono]) VALUES (3, N'696325696', N'Bart', N'Simpson', 3, CAST(N'1998-04-11' AS Date), CAST(N'2019-01-01' AS Date), N'bart@gmail.com', N'60606060')
GO
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
INSERT [dbo].[Interes] ([id], [porcentaje]) VALUES (1, 0.1)
GO
INSERT [dbo].[Interes] ([id], [porcentaje]) VALUES (2, 0.2)
GO
INSERT [dbo].[Interes] ([id], [porcentaje]) VALUES (3, 0.3)
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 
GO
INSERT [dbo].[Inventario] ([id], [idAutomovil], [fechaIngreso], [consignacion]) VALUES (1, 3, CAST(N'2019-07-08' AS Date), 0)
GO
INSERT [dbo].[Inventario] ([id], [idAutomovil], [fechaIngreso], [consignacion]) VALUES (2, 7, CAST(N'2019-07-08' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
INSERT [dbo].[MetodoPago] ([id], [descripcion]) VALUES (1, N'Tarjeta')
GO
INSERT [dbo].[MetodoPago] ([id], [descripcion]) VALUES (2, N'Efectivo')
GO
INSERT [dbo].[Puesto] ([id], [nombre], [salario]) VALUES (1, N'Gerente', 1000000.0000)
GO
INSERT [dbo].[Puesto] ([id], [nombre], [salario]) VALUES (2, N'Coordinador', 700000.0000)
GO
INSERT [dbo].[Puesto] ([id], [nombre], [salario]) VALUES (3, N'Vendedor', 500000.0000)
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 
GO
INSERT [dbo].[Venta] ([id], [idFacturador], [idCliente], [idInventario], [fecha], [monto], [idMetodoPago]) VALUES (1, 3, 3, 1, CAST(N'2019-06-16' AS Date), 15000000.0000, 2)
GO
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[CreditosXCliente]  WITH CHECK ADD  CONSTRAINT [FK_CreditosXCliente_Interes] FOREIGN KEY([idInteres])
REFERENCES [dbo].[Interes] ([id])
GO
ALTER TABLE [dbo].[CreditosXCliente] CHECK CONSTRAINT [FK_CreditosXCliente_Interes]
GO
ALTER TABLE [dbo].[CreditosXCliente]  WITH CHECK ADD  CONSTRAINT [FK_CreditosXCliente_Venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([id])
GO
ALTER TABLE [dbo].[CreditosXCliente] CHECK CONSTRAINT [FK_CreditosXCliente_Venta]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([idPuesto])
REFERENCES [dbo].[Puesto] ([id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_MetodoPago] FOREIGN KEY([idMetodoPago])
REFERENCES [dbo].[MetodoPago] ([id])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_MetodoPago]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pagos_CreditosXCliente] FOREIGN KEY([idCredito])
REFERENCES [dbo].[CreditosXCliente] ([idVenta])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pagos_CreditosXCliente]
GO
ALTER TABLE [dbo].[PagoTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_PagoTarjeta_Pago] FOREIGN KEY([id])
REFERENCES [dbo].[Pago] ([id])
GO
ALTER TABLE [dbo].[PagoTarjeta] CHECK CONSTRAINT [FK_PagoTarjeta_Pago]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Inventario] FOREIGN KEY([idInventario])
REFERENCES [dbo].[Inventario] ([id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Ventas_Inventario]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_MetodoPago] FOREIGN KEY([idMetodoPago])
REFERENCES [dbo].[MetodoPago] ([id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Ventas_MetodoPago]
GO
ALTER TABLE [dbo].[VentaTarjeta]  WITH CHECK ADD  CONSTRAINT [FK_VentaTarjeta_Venta] FOREIGN KEY([id])
REFERENCES [dbo].[Venta] ([id])
GO
ALTER TABLE [dbo].[VentaTarjeta] CHECK CONSTRAINT [FK_VentaTarjeta_Venta]
GO
/****** Object:  StoredProcedure [dbo].[SP_C_AutoXConsign]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para crear entradas en AutomovilXConsignacion
-- =============================================
CREATE PROCEDURE [dbo].[SP_C_AutoXConsign]
	@modelo varchar(50),
	@anho int,
	@descripcion varchar(max),
	@comision float,
	@costoModelo money,
	@idmarca int,
	@idtipo int
AS
BEGIN
	SET NOCOUNT ON;

	if (@modelo is null or
		@anho is null or
		@descripcion is null or
		@comision is null or
		@costoModelo is null or
		@idmarca is null or
		@idtipo is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	begin tran
		insert into AutomovilXConsignacion (modelo, anho, descripcion, comision, costoModelo, idmarca, idtipo)
		values (@modelo, @anho, @descripcion, @comision, @costoModelo, @idmarca, @idtipo)
	commit tran

	print 'Informacion de Automovil Consignado registrada'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_C_CreditXCliente]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para crear entradas en CreditosXCliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_C_CreditXCliente]
	@idVenta int,
	@idInteres int,
	@cantPagos int,
	@saldoTotal money
AS
BEGIN
	SET NOCOUNT ON;

	if (@idVenta is null or
		@idInteres is null or
		@cantPagos is null or
		@saldoTotal is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	begin tran
		insert into CreditosXCliente (idVenta, idInteres, cantPagos, saldoTotal)
		values (@idVenta, @idInteres, @cantPagos, @saldoTotal)
	commit tran

	print 'Informacion de Credito de Cliente registrada'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_C_Empleado]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor:		Carlos Esquivel
-- Descripcion:	Procedimiento para crear empleados
-- =============================================

CREATE PROCEDURE  [dbo].[SP_C_Empleado]
	@cedula varchar(50),
	@nombre varchar(50),
	@apellido varchar(50),
	@idPuesto int,
	@fechaNacimiento date,
	@fechaContratacion date,
	@correo varchar(50),
	@telefono varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar que ningun parametro sea nulo, por si acaso
	if (@cedula is null or
		@nombre is null or
		@apellido is null or
		@idPuesto is null or
		@fechaNacimiento is null or
		@fechaContratacion is null or
		@correo is null or
		@telefono is null)
	begin
		print 'Uno o mas parametros es nulo'
		return -1
	end

	-- Verifica que no haya una cedula repetida
    if (exists(select 1 from Empleado where cedula = @cedula))
	begin
		print 'Cedula introducida ya existe en la DB'
		return -2
	end

	begin tran
		insert into Empleado (cedula, nombre, apellido, idPuesto, fechaNacimiento, fechaContratacion, correo, telefono)
		values (@cedula, @nombre, @apellido, @idPuesto, @fechaNacimiento, @fechaContratacion, @correo, @telefono)
	commit tran

	print 'Empleado ingresado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_C_ImgXAuto]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para ingresar entradas de ImagenXAutomovil
-- =============================================
CREATE PROCEDURE [dbo].[SP_C_ImgXAuto]
	@idAutomovil int,
	@imagen image
AS
BEGIN
	SET NOCOUNT ON;

    -- Verificar si algun parametro es nulo
	if (@idAutomovil is null or
		@imagen is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	begin tran
		insert into ImagenXAutomovil (idAutomovil, imagen)
		values (@idAutomovil, @imagen)
	commit tran

	print 'Imagen de Automovil registrada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_C_Inventario]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para ingresar entradas en Inventario
-- =============================================
CREATE PROCEDURE  [dbo].[SP_C_Inventario]
	@idAutomovil int,
	@fechaIngreso date,
	@consignacion bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si idAutomovil es nulo
	if (@idAutomovil is null or @fechaIngreso is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	-- Cambia bit a 0 si viene nulo
	if (@consignacion is null) set @consignacion = 0

	-- Verifica si idAuto ya ha sido ingresado
    if (exists(select 1 from Inventario where idAutomovil = @idAutomovil))
	begin
		print 'ID de Automovil introducido ya existe en el Inventario'
		return -2
	end

	begin tran
		insert into Inventario (idAutomovil, fechaIngreso, consignacion)
		values (@idAutomovil, @fechaIngreso, @consignacion)
	commit tran

	print 'Automovil ingresado al inventario'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_C_Pago]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para crear entradas en Pago
-- =============================================
CREATE PROCEDURE  [dbo].[SP_C_Pago]
	@idCredito int,
	@fechaPago date,
	@montoPagado money,
	@idMetodoPago int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si algun parametro es nulo
	if (@idCredito is null or
		@fechaPago is null or
		@montoPagado is null or
		@idMetodoPago is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	begin tran
		insert into Pago(idCredito, fechaPago, montoPagado, idMetodoPago)
		values (@idCredito, @fechaPago, @montoPagado, @idMetodoPago)

		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			insert into PagoTarjeta (id, montoRetenido)
			values (SCOPE_IDENTITY(), @montoPagado*0.1)
		end
	commit tran

	print 'Pago registrado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_C_Venta]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para crear entradas en Venta
-- =============================================
CREATE PROCEDURE  [dbo].[SP_C_Venta]
	@idFacturador int,
	@idCliente int,
	@idInventario int,
	@fecha date,
	@monto money,
	@idMetodoPago int,
	@descuento float = 0.1
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si algun parametro es nulo
	if (@idFacturador is null or
		@idCliente is null or
		@idInventario is null or
		@fecha is null or 
		@monto is null or 
		@idMetodoPago is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	if(not exists(select 1 from Empleado where id = @idFacturador))
	begin
		print 'ID de Empleado introducido no existe en la BD'
		return -2
	end

	declare @cantCompras int
	exec @cantCompras = spGetCantCompras @idCliente

	if @cantCompras >= 3
	begin
		select @monto = @monto-(@monto*@descuento)
	end

	begin tran
		insert into Venta(idFacturador, idCliente, idInventario, fecha, monto, idMetodoPago)
		values (@idFacturador, @idCliente, @idInventario, @fecha, @monto, @idMetodoPago)

		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			insert into VentaTarjeta (id, montoRetenido)
			values (SCOPE_IDENTITY(), @monto*0.1)
		end
	commit tran

	print 'Venta registrada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_AutoXConsign]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para eliminar entradas en AutomovilXConsignacion
-- =============================================
CREATE PROCEDURE [dbo].[SP_D_AutoXConsign]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		delete from AutomovilXConsignacion
		where id = @id
	commit tran

	print 'Informacion de Automovil Consignado eliminada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_CreditXCliente]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para eliminar entradas en CreditosXCliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_D_CreditXCliente]
	@idVenta int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@idVenta is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		delete from CreditosXCliente
		where idVenta = @idVenta
	commit tran

	print 'Informacion de Credito de Cliente eliminada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_Empleado]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor:		Carlos Esquivel
-- Descripcion:	Procedimiento para eliminar empleados
-- =============================================

CREATE PROCEDURE  [dbo].[SP_D_Empleado]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar que ID no sea nulo
	if (@id is null)
	begin
		print 'Parametro ID es nulo'
		return -1
	end

	begin tran
		delete from Empleado
		where id = @id
	commit tran
	
	print 'Empleado ID:'+ CONVERT(NVARCHAR(50), @id) +' eliminado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_ImgXAuto]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para eliminar entradas de ImagenXAutomovil
-- =============================================
CREATE PROCEDURE [dbo].[SP_D_ImgXAuto]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		delete from ImagenXAutomovil
		where id = @id
	commit tran

	print 'Informacion de Imagen de Automovil eliminada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_Inventario]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para eliminar entradas en Inventario
-- =============================================
CREATE PROCEDURE  [dbo].[SP_D_Inventario]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		delete from Inventario
		where id = @id
	commit tran

	print 'Entrada de inventario eliminada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_Pago]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para eliminar entradas en Pago
-- =============================================
CREATE PROCEDURE  [dbo].[SP_D_Pago]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		delete from Pago
		where id = @id
	commit tran

	print 'Pago eliminado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_D_Venta]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para eliminar entradas en Venta
-- =============================================
CREATE PROCEDURE  [dbo].[SP_D_Venta]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		delete from Venta
		where id = @id
	commit tran

	print 'Venta eliminada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_AutoXConsign]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para leer entradas en AutomovilXConsignacion
-- =============================================
CREATE PROCEDURE [dbo].[SP_R_AutoXConsign]
	@id int = null,
	@idmarca int = null,
	@modelo varchar(50) = null,
	@anho int = null,
	@costoMin money = null
AS
BEGIN
	SET NOCOUNT ON;

	select id, idmarca, modelo, anho as 'año', comision, costoModelo as 'costo'
	from AutomovilXConsignacion
	where id = ISNULL(@id, id) and
		  idmarca like ISNULL(@idmarca, idmarca) and
		  modelo like ISNULL(@modelo, modelo) and
		  anho = ISNULL(@anho, anho) and
		  costoModelo >= ISNULL(@costoMin, 0)

	print 'Lista de informacion de Automoviles Consignados desplegada'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_CreditXCliente]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para leer entradas en CreditosXCliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_R_CreditXCliente]
	@idVenta int = null,
	@interesMin float = null
AS
BEGIN
	SET NOCOUNT ON;

	select idVenta, I.porcentaje as 'Interes', cantPagos as 'Cantidad de Pagos', saldoTotal as 'Saldo Total' 
	from CreditosXCliente CxC
	inner join Interes I on CxC.idInteres = I.id
	where idVenta = ISNULL(@idVenta, idVenta) and
		  I.porcentaje >= ISNULL(@interesMin, 0)
	order by idVenta desc

	print 'Lista de Creditos por Cliente desplegada'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_Empleado]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor:		Carlos Esquivel
-- Descripcion:	Procedimiento para leer empleados. Pueden ordenarse por Cedula, Apellido, Puesto y fecha de Contratacion
-- =============================================

CREATE PROCEDURE  [dbo].[SP_R_Empleado]
	@id int = NULL,
	@sortCedula bit = 0,
	@sortApellido bit = 0,
	@sortPuesto bit = 0,
	@sortFechaContr bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	-- Si un parametro sort viene nulo, se reinicia
	if (@sortCedula is null)	 set @sortCedula = 0
	if (@sortApellido is null)	 set @sortApellido = 0
	if (@sortPuesto is null)	 set @sortPuesto = 0
	if (@sortfechaContr is null) set @sortFechaContr = 0

	select E.id, E.cedula, E.apellido, E.nombre, P.nombre as puesto, E.fechaContratacion as 'Fecha de contratacion',
		   E.fechaNacimiento as 'Fecha de nacimiento', E.correo, E.telefono
	from Empleado E
	inner join Puesto P on E.idPuesto = P.id
	where E.id = ISNULL(@id, E.id)
	order by
		case when @sortCedula = 1 then E.cedula end,
		case when @sortApellido = 1 then E.apellido end,
		case when @sortPuesto = 1 then P.nombre end,
		case when @sortFechaContr = 1 then E.fechaContratacion end desc

	print 'Lista de empleados seleccionados'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_ImgXAuto]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para modificar entradas de ImagenXAutomovil
-- =============================================
CREATE PROCEDURE [dbo].[SP_R_ImgXAuto]
	@id int,
	@idAutomovil int = null,
	@imagen image = null
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si id es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		update ImagenXAutomovil
		set idAutomovil = ISNULL(@idAutomovil, idAutomovil),
			imagen = ISNULL(@imagen, imagen)
	commit tran

	print 'Informacion de Imagen de Automovil modificada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_Inventario]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para leer entradas en Inventario
-- =============================================
CREATE PROCEDURE  [dbo].[SP_R_Inventario]
	@id int = null,
	@idAutomovil int = null,
	@fechaIngreso date = null,
	@fechaModo bit = null,
	@filterConsignacion bit = null
AS
BEGIN
	SET NOCOUNT ON;

	select id, idAutomovil, case consignacion when 1 then 'Consignado'
											  else 'No consignado' end							  
	from Inventario
	where id = ISNULL(@id, id) and
		  idAutomovil = ISNULL(@idAutomovil, idAutomovil) and
		  case 
			when (@fechaIngreso is not null and @fechaModo is null) then 1
			when (@fechaIngreso is not null and @fechaModo = 0 and
				 (fechaIngreso between ISNULL(@fechaIngreso, fechaIngreso) and GETDATE())) then 1
			when (@fechaIngreso is not null and @fechaModo = 1 and
				 (fechaIngreso = ISNULL(@fechaIngreso, fechaIngreso))) then 1
			else 0
		  end = 1 and
		  consignacion = case @filterConsignacion
							when 0 then 0
							when 1 then 1
							else consignacion end

	print 'Lista de items en inventario desplegada'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_Pago]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para leer entradas en Pago
-- =============================================
CREATE PROCEDURE  [dbo].[SP_R_Pago]
	@id int = null,
	@idCredito int = null,
	@fechaPago date = null,
	@fechaModo bit = null,
	@pagoMinimo money = null,
	@idMetodoPago int = null
AS
BEGIN
	SET NOCOUNT ON;
	/*
		@fechaModo -> Filtro de fechas (siempre y cuando se introduzca fecha)
		> null	= todas las fechas
		>	0	= de la fecha introducida en adelante
		>	1	= solo la fecha introducida
	*/
	select P.id, idCredito, fechaPago as 'Fecha de pago', M.descripcion as 'Metodo de pago', montoPagado as 'Monto'
	from Pago P
	inner join MetodoPago M on P.idMetodoPago = M.id
	where P.id = ISNULL(@id, P.id) and
		  idCredito = ISNULL(@idCredito, idCredito) and
		  case 
			when (@fechaPago is not null and @fechaModo is null) then 1
			when (@fechaPago is not null and @fechaModo = 0 and
				 (fechaPago between ISNULL(@fechaPago, fechaPago) and GETDATE())) then 1
			when (@fechaPago is not null and @fechaModo = 1 and
				 (fechaPago = ISNULL(@fechaPago, fechaPago))) then 1
			else 0
		  end = 1 and
		  idMetodoPago = ISNULL(@idMetodoPago, idMetodoPago) and 
		  montoPagado >= ISNULL(@pagoMinimo, 0)

	order by idCredito, fechaPago desc

	print 'Lista de Pagos desplegada'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_R_Venta]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para leer entradas en Venta
-- =============================================
CREATE PROCEDURE  [dbo].[SP_R_Venta]
	@id int = null,
	@idFacturador int = null,
	@idCliente int = null,
	@idInventario int = null,
	@fecha date = null,
	@fechaModo bit = null,
	@montoMininimo money = null,
	@idMetodoPago int = null
AS
BEGIN
	SET NOCOUNT ON;
	/*
		@fechaModo -> Filtro de fechas (siempre y cuando se introduzca fecha)
		> null	= todas las fechas
		>	0	= de la fecha introducida en adelante
		>	1	= solo la fecha introducida
	*/
	select V.id, idCliente, idInventario, fecha, M.descripcion as 'Metodo de Pago', monto
	from Venta V
	inner join MetodoPago M on V.idMetodoPago = M.id 
	where V.id = ISNULL(@id, V.id) and
		  idFacturador = ISNULL(@idFacturador, idFacturador) and
		  idCliente = ISNULL(@idCliente, idCliente) and
		  idInventario = ISNULL(@idInventario, idInventario) and
		  case 
			when (@fecha is not null and @fechaModo is null) then 1
			when (@fecha is not null and @fechaModo = 0 and
				 (fecha between ISNULL(@fecha, fecha) and GETDATE())) then 1
			when (@fecha is not null and @fechaModo = 1 and
				 (fecha = ISNULL(@fecha, fecha))) then 1
			else 0
		  end = 1 and
		  idMetodoPago = ISNULL(@idMetodoPago, idMetodoPago) and
		  monto >= ISNULL(@montoMininimo, 0)
	order by fecha desc

	print 'Lista de Ventas desplegada'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_AutoXConsign]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para modificar entradas en AutomovilXConsignacion
-- =============================================
CREATE PROCEDURE [dbo].[SP_U_AutoXConsign]
	@id int,
	@modelo varchar(50) = null,
	@anho int = null,
	@descripcion varchar(max) = null,
	@comision float = null,
	@costoModelo money = null,
	@idmarca int = null,
	@idtipo int = null
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si id es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	begin tran
		update AutomovilXConsignacion
		set idmarca =	ISNULL(@idmarca, idmarca),
			modelo =	ISNULL(@modelo, modelo),
			anho =		ISNULL(@anho, anho),
			descripcion = ISNULL(@descripcion, descripcion),
			comision =	ISNULL(@comision, comision),
			costoModelo = ISNULL(@costoModelo, costoModelo),
			idTipo = ISNULL(@idtipo, idtipo)
		where id = @id
	commit tran

	print 'Informacion de Automovil consignado modificada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_CreditXCliente]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para modificar entradas en CreditosXCliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_U_CreditXCliente]
	@idVenta int,
	@idInteres int = null,
	@cantPagos int = null,
	@saldoTotal money = null
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si id es nulo
	if (@idVenta is null and
	   (@idInteres is not null and not exists(select 1 from Interes where id = @idInteres)))
	begin
		print 'Uno o mas parametros son nulos o no existen en la BD'
		return -1
	end

	begin tran
		update CreditosXCliente
		set idInteres =		ISNULL(@idInteres, idInteres),
			cantPagos =		ISNULL(@cantPagos, cantPagos),
			saldoTotal =	ISNULL(@saldoTotal, saldoTotal)
		where idVenta = @idVenta
	commit tran

	print 'Informacion de Credito de Cliente modificada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_Empleado]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor:		Carlos Esquivel
-- Descripcion:	Procedimiento para actualizar empleados
-- =============================================

CREATE PROCEDURE  [dbo].[SP_U_Empleado]
	@id int,
	@cedula varchar(50) = NULL,
	@nombre varchar(50) = NULL,
	@apellido varchar(50) = NULL,
	@idPuesto int = NULL,
	@fechaNacimiento date = NULL,
	@correo varchar(50) = NULL,
	@telefono varchar(10) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar que ID no sea nulo
	if (@id is null)
	begin
		print 'Parametro ID es nulo'
		return -1
	end

	-- Verifica que no haya una cedula repetida
    if (@cedula is not null and exists(select 1 from Empleado where cedula = @cedula))
	begin
		print 'Cedula introducida ya existe en la DB'
		return -2
	end

	begin tran
		update Empleado
		set cedula =	ISNULL(@cedula, cedula),
			nombre =	ISNULL(@nombre, nombre),
			apellido =	ISNULL(@apellido, apellido),
			idPuesto =	ISNULL(@idPuesto, idPuesto),
			fechaNacimiento = ISNULL(@fechaNacimiento, fechaNacimiento),
			correo =	ISNULL(@correo, correo),
			telefono =	ISNULL(@telefono, telefono)
		where id = @id
	commit tran
	
	print 'Empleado ID:'+ CONVERT(NVARCHAR(50), @id) +' modificado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_Inventario]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para modificar entradas en Inventario
-- =============================================
CREATE PROCEDURE  [dbo].[SP_U_Inventario]
	@id int,
	@idAutomovil int = null,
	@fechaIngreso date = null,
	@consignacion bit = null
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si ID es nulo
	if (@id is null)
	begin
		print 'ID no puede ser nulo'
		return -1
	end

	-- Verifica si idAuto ya ha sido ingresado
    if (exists(select 1 from Inventario where idAutomovil = @idAutomovil))
	begin
		print 'ID de Automovil introducido ya existe en el Inventario'
		return -2
	end

	-- Verifica si fecha es correcta
	if (@fechaIngreso > GETDATE())
	begin
		print 'Fecha incorrecta: no puede superar la actual'
		return -3
	end

	begin tran
		update Inventario
		set idAutomovil =	ISNULL(@idAutomovil, idAutomovil),
			fechaIngreso =	ISNULL(@fechaIngreso, fechaIngreso),
			consignacion =	ISNULL(@consignacion, consignacion)
		where id = @id
	commit tran

	print 'Entrada de inventario modificada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_Pago]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para modificar entradas en Pago
-- =============================================
CREATE PROCEDURE  [dbo].[SP_U_Pago]
	@id int,
	@idCredito int = null,
	@fechaPago date = null,
	@montoPagado money = null,
	@idMetodoPago int = null
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si id es nulo
	if (@id is null or
	   (@idCredito    is not null and not exists(select 1 from CreditosXCliente where idVenta = @idCredito)) or
	   (@idMetodoPago is not null and not exists(select 1 from MetodoPago where id = @idMetodoPago)))
	begin
		print 'Uno o mas parametros son nulos o no existen en la BD'
		return -1
	end

	-- Verifica si fecha es correcta
	else if (@fechaPago > GETDATE())
	begin
		print 'Fecha incorrecta: no puede superar la actual'
		return -2
	end

	begin tran
		update Pago
		set idCredito =		ISNULL(@idCredito, idCredito),
			fechaPago =		ISNULL(@fechaPago, fechaPago),
			montoPagado =	ISNULL(@montoPagado, montoPagado),
			idMetodoPago =	ISNULL(@idMetodoPago, idMetodoPago)
		where id = @id
	commit tran

	print 'Pago modificado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_U_Venta]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Esquivel
-- Description:	Procedimiento para modificar entradas en Venta
-- =============================================
CREATE PROCEDURE  [dbo].[SP_U_Venta]
	@id int,
	@idFacturador int = null,
	@idCliente int = null,
	@idInventario int = null,
	@fecha date = null,
	@monto money = null,
	@idMetodoPago int = null
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si id es nulo
	if (@id is null or
	   (@idFacturador is not null and not exists(select 1 from Empleado where id = @idFacturador)) or
	   (@idInventario is not null and not exists(select 1 from Inventario where id = @idInventario)) or
	   (@idMetodoPago is not null and not exists(select 1 from MetodoPago where id = @idMetodoPago)))
	begin
		print 'Uno o mas parametros son nulos o no existen en la BD'
		return -1
	end

	-- Verifica si fecha es correcta
	if (@fecha > GETDATE())
	begin
		print 'Fecha incorrecta: no puede superar la actual'
		return -2
	end

	begin tran
		update Venta
		set idFacturador = ISNULL(@idFacturador, idFacturador),
			idCliente = ISNULL(@idCliente, idCliente),
			idInventario = ISNULL(@idInventario, idInventario),
			fecha = ISNULL(@fecha, fecha),
			monto = ISNULL(@monto, monto),
			idMetodoPago = ISNULL(@idMetodoPago, idMetodoPago)
		where id = @id
	commit tran

	print 'Venta modificada exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCantCompras]    Script Date: 17/06/2019 5:18:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fabricio Ceciliano
-- Create date: 
-- Description:	Procedimiento para verificar si se debe hacer descuento a un cliente
-- =============================================
CREATE   PROCEDURE [dbo].[spGetCantCompras]
	-- Add the parameters for the stored procedure here
	@idCliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @cantCompras int;

    if @idCliente is not null
	begin
		select @cantCompras = count(V.idCliente) from Venta V where V.fecha >= DATEADD(year, -5, GETDATE()) and V.idCliente = @idCliente

		return @cantCompras;
	end
	else
	begin
		return -1;
	end
END
GO
USE [master]
GO
ALTER DATABASE [Sucursal3] SET  READ_WRITE 
GO
