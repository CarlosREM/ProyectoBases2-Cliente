USE [master]
GO
/****** Object:  Database [Fabrica]    Script Date: 17/06/2019 11:26:37 PM ******/
CREATE DATABASE [Fabrica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fabrica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Fabrica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fabrica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Fabrica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Fabrica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fabrica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fabrica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fabrica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fabrica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fabrica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fabrica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fabrica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fabrica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fabrica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fabrica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fabrica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fabrica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fabrica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fabrica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fabrica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fabrica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fabrica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fabrica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fabrica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fabrica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fabrica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fabrica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fabrica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fabrica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fabrica] SET  MULTI_USER 
GO
ALTER DATABASE [Fabrica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fabrica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fabrica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fabrica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fabrica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fabrica] SET QUERY_STORE = OFF
GO
USE [Fabrica]
GO
/****** Object:  Table [dbo].[Autos]    Script Date: 17/06/2019 11:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_modelo] [int] NOT NULL,
	[fechaFabricacion] [date] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Produccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutosPorDespacho]    Script Date: 17/06/2019 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutosPorDespacho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_despacho] [int] NOT NULL,
	[fk_auto] [int] NOT NULL,
 CONSTRAINT [PK_AutosPorDespacho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Despachos]    Script Date: 17/06/2019 11:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despachos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_sucursal] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_Despachos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 17/06/2019 11:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_puesto] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelos]    Script Date: 17/06/2019 11:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_tipo] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_Modelos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 17/06/2019 11:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_sucursal] [int] NOT NULL,
	[fk_modelo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[estado] [bit] NOT NULL,
	[completado] [bit] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 17/06/2019 11:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[id] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[salario] [float] NOT NULL,
 CONSTRAINT [PK_Puestos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Auto]    Script Date: 17/06/2019 11:26:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Auto](
	[id] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tipo_Auto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autos] ON 

INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (1, 5, CAST(N'2019-08-12' AS Date), N'{"luces": "nieve", "aros": "grandes", "color": "verde", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 8500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (2, 1, CAST(N'2019-06-16' AS Date), N'{"luces": "regulares", "aros": "grandes", "color": "negro", "extras": ["quemacocos", "calefaccion","parlantes"], "precioExtras": 5000}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (3, 2, CAST(N'2019-05-15' AS Date), N'{"luces": "nieve", "aros": "de fabrica", "color": "verde", "extras": ["quemacocos", "asientos extra", "turbo"], "precioExtras": 4500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (4, 3, CAST(N'2019-03-14' AS Date), N'{"luces": "regulares", "aros": "de fabrica", "color": "blanco", "extras": ["asientos extra", "calefaccion"], "precioExtras": 6000}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (5, 4, CAST(N'2019-01-13' AS Date), N'{"luces": "nieve", "aros": "de fabrica", "color": "negro", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 7500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (6, 5, CAST(N'2019-04-16' AS Date), N'{"luces": "halogenos", "aros": "medianos", "color": "gris", "extras": ["claxon", "asientos extra", "calefaccion"], "precioExtras": 7500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (7, 6, CAST(N'2019-12-16' AS Date), N'{"luces": "nieve", "aros": "grandes", "color": "blanco", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 9000}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (8, 7, CAST(N'2018-02-16' AS Date), N'{"luces": "regulares", "aros": "de fabrica", "color": "blanco", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 3000}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (9, 8, CAST(N'2018-05-11' AS Date), N'{"luces": "halogenos", "aros": "de fabrica", "color": "gris", "extras": ["enfriador", "asientos extra", "calefaccion"], "precioExtras": 3520}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (10, 8, CAST(N'2018-10-04' AS Date), N'{"luces": "regulares", "aros": "grandes", "color": "gris", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 9654}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (11, 7, CAST(N'2018-06-01' AS Date), N'{"luces": "regulares", "aros": "de fabrica", "color": "negro", "extras": ["bobina", "asientos extra", "calefaccion"], "precioExtras": 7500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (12, 6, CAST(N'2018-07-12' AS Date), N'{"luces": "regulares", "aros": "medianos", "color": "verde", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 4800}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (13, 5, CAST(N'2018-03-16' AS Date), N'{"luces": "regulares", "aros": "grandes", "color": "blanco", "extras": ["spoiler", "asientos extra", "calefaccion"], "precioExtras": 9300}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (14, 4, CAST(N'2019-02-21' AS Date), N'{"luces": "nieve", "aros": "de fabrica", "color": "negro", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 4000}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (15, 3, CAST(N'2019-01-16' AS Date), N'{"luces": "regulares", "aros": "de fabrica", "color": "blanco", "extras": ["repuesto llanta", "asientos extra", "calefaccion"], "precioExtras": 2000}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (16, 2, CAST(N'2019-09-20' AS Date), N'{"luces": "regulares", "aros": "medianos", "color": "gris", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 2500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (17, 7, CAST(N'2019-07-16' AS Date), N'{"luces": "regulares", "aros": "grandes", "color": "verde", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 3500}')
INSERT [dbo].[Autos] ([id], [fk_modelo], [fechaFabricacion], [descripcion]) VALUES (18, 6, CAST(N'2019-06-16' AS Date), N'{"luces": "nieve", "aros": "de fabrica", "color": "negro", "extras": ["quemacocos", "asientos extra", "calefaccion"], "precioExtras": 3600}')
SET IDENTITY_INSERT [dbo].[Autos] OFF
SET IDENTITY_INSERT [dbo].[AutosPorDespacho] ON 

INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (2, 2, 2)
INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (3, 3, 3)
INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (4, 4, 4)
INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (5, 1, 5)
INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (6, 2, 6)
INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (7, 3, 7)
INSERT [dbo].[AutosPorDespacho] ([id], [fk_despacho], [fk_auto]) VALUES (8, 4, 8)
SET IDENTITY_INSERT [dbo].[AutosPorDespacho] OFF
SET IDENTITY_INSERT [dbo].[Despachos] ON 

INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (1, 1, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (2, 2, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (3, 3, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (4, 4, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (5, 1, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (6, 2, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (7, 3, CAST(N'2019-06-08' AS Date))
INSERT [dbo].[Despachos] ([id], [fk_sucursal], [fecha]) VALUES (8, 4, CAST(N'2019-06-08' AS Date))
SET IDENTITY_INSERT [dbo].[Despachos] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([id], [fk_puesto], [nombre]) VALUES (1, 1, N'Paco')
INSERT [dbo].[Empleados] ([id], [fk_puesto], [nombre]) VALUES (2, 2, N'Juan')
INSERT [dbo].[Empleados] ([id], [fk_puesto], [nombre]) VALUES (3, 3, N'Pedro')
INSERT [dbo].[Empleados] ([id], [fk_puesto], [nombre]) VALUES (4, 3, N'Luis')
INSERT [dbo].[Empleados] ([id], [fk_puesto], [nombre]) VALUES (5, 4, N'Poncho')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[Modelos] ON 

INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (1, 1, N'Modelo1', N'{"puertas": 4, "pasajeros": 5, "gasto": "economico"}', 5000000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (2, 2, N'Modelo2', N'{"puertas": 2, "pasajeros": 3, "gasto": "caro"}', 4500000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (3, 3, N'Modelo3', N'{"puertas": 4, "pasajeros": 7, "gasto": "intermedio"}', 15000000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (4, 4, N'Modelo4', N'{"puertas": 6, "pasajeros": 7, "gasto": "intermedio"}', 50000000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (5, 3, N'Modelo5', N'{"puertas": 2, "pasajeros": 3, "gasto": "caro"}', 10000000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (6, 2, N'Modelo6', N'{"puertas": 4, "pasajeros": 5, "gasto": "economico"}', 7500000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (7, 1, N'Modelo7', N'{"puertas": 4, "pasajeros": 5, "gasto": "caro"}', 6000000)
INSERT [dbo].[Modelos] ([id], [fk_tipo], [nombre], [descripcion], [precio]) VALUES (8, 4, N'Modelo8', N'{"puertas": 2, "pasajeros": 3, "gasto": "intermedio"}', 17000000)
SET IDENTITY_INSERT [dbo].[Modelos] OFF
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (1, 1, 1, 1, CAST(N'2019-06-16' AS Date), 0, 1, CAST(N'2019-07-16' AS Date))
INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (2, 2, 8, 1, CAST(N'2019-05-19' AS Date), 0, 1, CAST(N'2019-05-19' AS Date))
INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (3, 3, 6, 1, CAST(N'2019-06-17' AS Date), 0, 1, CAST(N'2019-07-17' AS Date))
INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (4, 4, 4, 1, CAST(N'2019-06-20' AS Date), 0, 1, CAST(N'2019-07-20' AS Date))
INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (5, 1, 2, 1, CAST(N'2019-06-17' AS Date), 1, 0, CAST(N'2019-07-17' AS Date))
INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (6, 2, 2, 1, CAST(N'2019-06-17' AS Date), 1, 0, CAST(N'2019-07-17' AS Date))
INSERT [dbo].[Pedidos] ([id], [fk_sucursal], [fk_modelo], [cantidad], [fecha], [estado], [completado], [fechaEntrega]) VALUES (7, 2, 7, 1, CAST(N'2019-06-17' AS Date), 1, 0, CAST(N'2019-07-17' AS Date))
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
INSERT [dbo].[Puestos] ([id], [nombre], [salario]) VALUES (1, N'Gerente', 1000000)
INSERT [dbo].[Puestos] ([id], [nombre], [salario]) VALUES (2, N'Operador', 500000)
INSERT [dbo].[Puestos] ([id], [nombre], [salario]) VALUES (3, N'Miselaneo', 400000)
INSERT [dbo].[Puestos] ([id], [nombre], [salario]) VALUES (4, N'Coordinador', 6000000)
INSERT [dbo].[Tipo_Auto] ([id], [nombre]) VALUES (1, N'Hibrido')
INSERT [dbo].[Tipo_Auto] ([id], [nombre]) VALUES (2, N'Electrico')
INSERT [dbo].[Tipo_Auto] ([id], [nombre]) VALUES (3, N'Diesel')
INSERT [dbo].[Tipo_Auto] ([id], [nombre]) VALUES (4, N'Gasolina')
ALTER TABLE [dbo].[Autos]  WITH CHECK ADD  CONSTRAINT [FK_Produccion_Modelos] FOREIGN KEY([fk_modelo])
REFERENCES [dbo].[Modelos] ([id])
GO
ALTER TABLE [dbo].[Autos] CHECK CONSTRAINT [FK_Produccion_Modelos]
GO
ALTER TABLE [dbo].[AutosPorDespacho]  WITH CHECK ADD  CONSTRAINT [FK_AutosPorDespacho_Despachos] FOREIGN KEY([fk_despacho])
REFERENCES [dbo].[Despachos] ([id])
GO
ALTER TABLE [dbo].[AutosPorDespacho] CHECK CONSTRAINT [FK_AutosPorDespacho_Despachos]
GO
ALTER TABLE [dbo].[AutosPorDespacho]  WITH CHECK ADD  CONSTRAINT [FK_AutosPorDespacho_Produccion] FOREIGN KEY([fk_auto])
REFERENCES [dbo].[Autos] ([id])
GO
ALTER TABLE [dbo].[AutosPorDespacho] CHECK CONSTRAINT [FK_AutosPorDespacho_Produccion]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Puestos] FOREIGN KEY([fk_puesto])
REFERENCES [dbo].[Puestos] ([id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Puestos]
GO
ALTER TABLE [dbo].[Modelos]  WITH CHECK ADD  CONSTRAINT [FK_Modelos_Tipo_Auto] FOREIGN KEY([fk_tipo])
REFERENCES [dbo].[Tipo_Auto] ([id])
GO
ALTER TABLE [dbo].[Modelos] CHECK CONSTRAINT [FK_Modelos_Tipo_Auto]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Modelos] FOREIGN KEY([fk_modelo])
REFERENCES [dbo].[Modelos] ([id])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Modelos]
GO
/****** Object:  StoredProcedure [dbo].[getNombresModelos]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getNombresModelos]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select M.id, M.nombre
	from Modelos M
END
GO
/****** Object:  StoredProcedure [dbo].[spCancelarPedido]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCancelarPedido]
	-- Add the parameters for the stored procedure here
	@idPedido int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @idPedido is not null
	begin
		begin try
			begin transaction
				update Pedidos
					set estado = 0
					where id = @idPedido
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
    
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearAuto]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearAuto]
	-- Add the parameters for the stored procedure here
	@fk_modelo int, @fechaFabricacion date, @descripcion varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @fk_modelo is not null
		 and @fechaFabricacion is not null
		 and @descripcion is not null
	begin
		begin try
			begin transaction
				insert Autos(fk_modelo,fechaFabricacion,descripcion)
				values (@fk_modelo,@fechaFabricacion,@descripcion)
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearAutoPorDespacho]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearAutoPorDespacho]
	-- Add the parameters for the stored procedure here
	@fk_auto int, @fk_despacho int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@fk_auto is not null
		and @fk_despacho is not null
	begin
		begin try
			begin transaction
				insert AutosPorDespacho(fk_auto,fk_despacho)
				values (@fk_auto,@fk_despacho)
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearDespacho]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearDespacho]
	-- Add the parameters for the stored procedure here
	@fk_sucursal int, @fecha date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@fk_sucursal is not null
		and @fecha is not null
	begin
		begin try
			begin transaction
				insert Despachos(fk_sucursal,fecha)
				values (@fk_sucursal,@fecha)
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearEmpleado]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearEmpleado]
	-- Add the parameters for the stored procedure here
	@fk_puesto int, @nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @fk_puesto is not null and @nombre is not null
	begin
		begin try
			begin transaction
				insert Empleados(fk_puesto,nombre)
				values (@fk_puesto, @nombre)
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearModelo]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearModelo]
	-- Add the parameters for the stored procedure here
	@fk_tipo int, @nombre varchar(20), @descripcion varchar(MAX), @precio float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @fk_tipo is not null and
		@nombre is not null and
		@descripcion is not null and
		@precio is not null
	begin
		begin try
			begin transaction
				insert Modelos(fk_tipo,nombre,descripcion,precio)
				values (@fk_tipo, @nombre,@descripcion,@precio)
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearPedido]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCrearPedido]
	-- Add the parameters for the stored procedure here
	@fk_sucursal int, @fk_modelo int, @cantidad int, @fechaEntrega varchar(50) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @fk_sucursal is not null and @fk_modelo is not null and @cantidad is not null
	begin
		declare @fechaEntregaFinal date;
		select @fechaEntregaFinal = DATEADD(MONTH,1,GETDATE());
		begin try
			begin transaction
				insert Pedidos(fk_sucursal,fk_modelo,cantidad,fecha,estado,completado,fechaEntrega)
				values (@fk_sucursal, @fk_modelo,@cantidad,GETDATE(),1,0,@fechaEntregaFinal)
			commit

			select @fechaEntrega = CONVERT(VARCHAR(10), @fechaEntregaFinal, 103);

			return 0;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return -1;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarAuto]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarAuto]
	-- Add the parameters for the stored procedure here
	@idAuto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@idAuto is not null
	begin
		begin try
			begin transaction
				delete from dbo.Autos
				where id = @idAuto
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarAutoPorDespacho]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarAutoPorDespacho]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@id is not null
	begin
		begin try
			begin transaction
				delete from dbo.AutosPorDespacho
				where id = @id
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarDespacho]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarDespacho]
	-- Add the parameters for the stored procedure here
	@idDespacho int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@idDespacho is not null
	begin
		begin try
			begin transaction
				delete from dbo.Despachos
				where id = @idDespacho
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarEmpleado]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarEmpleado]
	-- Add the parameters for the stored procedure here
	@fk_puesto int, @nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @fk_puesto is not null and @nombre is not null
	begin
		begin try
			begin transaction
				delete from dbo.Empleados
				where fk_puesto = @fk_puesto and nombre = @nombre
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarModelo]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarModelo]
	-- Add the parameters for the stored procedure here
	@idModelo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if	@idModelo is not null 
	begin
		begin try
			begin transaction
				delete from dbo.Modelos
					where id = @idModelo
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spFinalizarPedido]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spFinalizarPedido]
	-- Add the parameters for the stored procedure here
	@idPedido int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @idPedido is not null
	begin
		begin try
			begin transaction
				update Pedidos
					set estado = 0,
						completado = 1
					where id = @idPedido
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
    
END
GO
/****** Object:  StoredProcedure [dbo].[spGetFechaEntrega]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetFechaEntrega]
	-- Add the parameters for the stored procedure here
	@lastIDpedido int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @lastIDpedido is not null and @lastIDpedido != 0
	begin
		select P.fechaEntrega
		from Pedidos P
		where P.id = @lastIDpedido

		return 1;
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarAuto]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarAuto]
	-- Add the parameters for the stored procedure here
	@idAuto int, @fk_modelo int, @fechaFabricacion date, @descripcion varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@idAuto is not null
		 and @fk_modelo is not null
		 and @fechaFabricacion is not null
		 and @descripcion is not null
	begin
		begin try
			begin transaction
				update Autos
				set fk_modelo = @fk_modelo
					,fechaFabricacion = @fechaFabricacion
					,descripcion = @descripcion
				where id = @idAuto
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarAutoPorDespacho]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarAutoPorDespacho]
	-- Add the parameters for the stored procedure here
	@id int, @fk_auto int, @fk_despacho int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@id is not null
		and @fk_auto is not null
		and @fk_despacho is not null
	begin
		begin try
			begin transaction
				update AutosPorDespacho
				set fk_auto = @fk_auto,
					fk_despacho =  @fk_despacho
				where id = @id
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarDespacho]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarDespacho]
	-- Add the parameters for the stored procedure here
	@idDespacho int, @fk_sucursal int, @fecha date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if	@idDespacho is not null
		and @fk_sucursal is not null
		and @fecha is not null
	begin
		begin try
			begin transaction
				update Despachos
					set fk_sucursal = @fk_sucursal
						,fecha = @fecha
					where id = @idDespacho
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarEmpleado]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarEmpleado]
	-- Add the parameters for the stored procedure here
	@fk_puesto int, @nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @fk_puesto is not null and @nombre is not null
	begin
		begin try
			begin transaction
				update Empleados
					set fk_puesto = @fk_puesto
					where nombre = @nombre
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarModelo]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spModificarModelo]
	-- Add the parameters for the stored procedure here
	@idModelo int, @fk_tipo int, @nombre varchar(20), @descripcion varchar(MAX), @precio float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if	@idModelo is not null and
		@fk_tipo is not null and
		@nombre is not null and
		@descripcion is not null and
		@precio is not null
	begin
		begin try
			begin transaction
				update Modelos
					set fk_tipo = @fk_tipo,
						nombre = @nombre,
						descripcion =  @descripcion,
						precio = @precio
					where id = @idModelo
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spModificarPedido]    Script Date: 17/06/2019 11:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[spModificarPedido]
	-- Add the parameters for the stored procedure here
	@idPedido int,@fk_sucursal int, @fk_modelo int, @cantidad int, @fecha date, @estado bit, @completado bit, @fechaEntrega date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @idPedido is not null
		 and @fk_sucursal is not null
		 and @fk_modelo is not null
		 and @cantidad is not null
		 and @fecha is not null
		 and @estado is not null
		 and @completado is not null
		 and @fechaEntrega is not null
	begin
		begin try
			begin transaction
				update Pedidos
					set fk_sucursal = @fk_sucursal
					,fk_modelo =  @fk_modelo
					,cantidad = @cantidad
					,fecha = @fecha
					,estado = @estado
					,completado = @completado
					,fechaEntrega = @fechaEntrega
				where id = @idPedido
			commit
			return 1;
		end try
		begin catch
			IF @@TRANCOUNT>0 rollback
			RETURN -1*@@ERROR
		end catch
	end
	else
	begin
		return 0;
	end
END
GO
USE [master]
GO
ALTER DATABASE [Fabrica] SET  READ_WRITE 
GO
