USE [master]
GO
/****** Object:  Database [Empresa]    Script Date: 6/17/2019 11:41:19 PM ******/
CREATE DATABASE [Empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Empresa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Empresa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Empresa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Empresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Empresa] SET  MULTI_USER 
GO
ALTER DATABASE [Empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Empresa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Empresa] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Empresa', N'ON'
GO
ALTER DATABASE [Empresa] SET QUERY_STORE = OFF
GO
USE [Empresa]
GO
/****** Object:  User [crem]    Script Date: 6/17/2019 11:41:19 PM ******/
CREATE USER [crem] FOR LOGIN [crem] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [crem]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[cedula] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorariosSucursales]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorariosSucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dia] [varchar](20) NOT NULL,
	[horaAbre] [time](7) NOT NULL,
	[horaCierre] [time](7) NOT NULL,
	[idSucursal] [int] NOT NULL,
 CONSTRAINT [PK_HorariosSucursales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca_Auto_Consignacion]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca_Auto_Consignacion](
	[id] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Marca_Auto_Consignacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServersSucursales]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServersSucursales](
	[id] [int] NOT NULL,
	[nombreServer] [varchar](50) NOT NULL,
	[nombreSucursal] [varchar](50) NOT NULL,
	[location] [geography] NOT NULL,
	[idPais] [int] NOT NULL,
 CONSTRAINT [PK_ServersSucursales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Auto_Consignacion]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Auto_Consignacion](
	[id] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tipo_Auto_Consignacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[id] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosClientes]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosClientes](
	[id] [int] NOT NULL,
	[userId] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UsuariosClientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosSistema]    Script Date: 6/17/2019 11:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosSistema](
	[idEmpleado] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[userId] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[idTipo] [int] NOT NULL,
 CONSTRAINT [PK_UsuariosSistema] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (1, N'Fabricio', N'Ceciliano', CAST(N'1999-01-16' AS Date), N'fabricio.ceciliano.n@gmail.com', N'60049508', N'117320506')
INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (2, N'Chuck', N'Norris', CAST(N'1956-01-24' AS Date), N'chucknorris@gmail.com', N'89899898', N'1')
INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (3, N'Ariel', N'Valverde', CAST(N'1997-04-22' AS Date), N'ariel@gmail.com', N'83515331', N'3-501-939')
INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (4, N'Lionel', N'Messi', CAST(N'1989-07-23' AS Date), N'messi@hotmail.com', N'87898728', N'1-221-583')
INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (5, N'Pedro', N'Infante', CAST(N'1956-01-24' AS Date), N'pi@gmail.com', N'60542340', N'6-245-123')
INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (6, N'Michael', N'Jackson', CAST(N'1956-01-23' AS Date), N'jackson@gmail.com', N'8888888', N'2-489-891')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[HorariosSucursales] ON 

INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (1, N'Lunes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (2, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (3, N'Miercoles', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (4, N'Jueves', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (5, N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (6, N'Lunes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 2)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (7, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 2)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (8, N'Miercoles', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 2)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (9, N'Jueves', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 2)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (10, N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 2)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (11, N'Lunes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 3)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (12, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 3)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (13, N'Miercoles', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 3)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (14, N'Jueves', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 3)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (15, N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 3)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (16, N'Lunes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 4)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (17, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 4)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (18, N'Miercoles', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 4)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (19, N'Jueves', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 4)
INSERT [dbo].[HorariosSucursales] ([id], [dia], [horaAbre], [horaCierre], [idSucursal]) VALUES (20, N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time), 4)
SET IDENTITY_INSERT [dbo].[HorariosSucursales] OFF
INSERT [dbo].[Marca_Auto_Consignacion] ([id], [nombre]) VALUES (1, N'Toyota')
INSERT [dbo].[Marca_Auto_Consignacion] ([id], [nombre]) VALUES (2, N'Honda')
INSERT [dbo].[Marca_Auto_Consignacion] ([id], [nombre]) VALUES (3, N'Nissan')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (1, N'Costa Rica')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (2, N'Nicaragua')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (3, N'Panama')
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (1, N'SERVERSUCURSAL1', N'Sucursal #1', 0xE6100000010C077E54C37EF723404CDE0033DF0B55C0, 1)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (2, N'SERVERSUCURSAL2', N'Sucursal #2', 0xE6100000010CF888981249DC23406DC5FEB27B0B55C0, 1)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (3, N'SERVERSUCURSAL3', N'Sucursal #3', 0xE6100000010C91990B5C1E3B28408D5DA27A6B8C55C0, 2)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (4, N'SERVERSUCURSAL4', N'Sucursal #4', 0xE6100000010C52BAF42F49052240A2EF6E6589E053C0, 3)
INSERT [dbo].[Tipo_Auto_Consignacion] ([id], [nombre]) VALUES (1, N'Gasolina')
INSERT [dbo].[Tipo_Auto_Consignacion] ([id], [nombre]) VALUES (2, N'Hibrido')
INSERT [dbo].[Tipo_Auto_Consignacion] ([id], [nombre]) VALUES (3, N'Electrico')
INSERT [dbo].[TipoUsuario] ([id], [nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[TipoUsuario] ([id], [nombre]) VALUES (2, N'Facturador')
INSERT [dbo].[TipoUsuario] ([id], [nombre]) VALUES (3, N'Consulta')
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (1, N'fcn', N'fcn1630')
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (2, N'chuck', N'12345678')
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (3, N'ariel', N'87654321')
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (4, N'lionel', N'11111111')
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (5, N'pedro', N'12121212')
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (6, N'michael', N'98989898')
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (1, 1, N'juan', N'12344321', 1)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (1, 2, N'fabricio', N'fcn1630', 1)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (1, 3, N'harry', N'10101010', 1)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (1, 4, N'diego', N'87654321', 1)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (2, 1, N'paco', N'12345678', 2)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (2, 2, N'jose', N'12349876', 2)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (2, 3, N'homero', N'65656565', 2)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (2, 4, N'albertano', N'12312312', 2)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (3, 1, N'roberto', N'87654321', 3)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (3, 2, N'carlos', N'99999999', 3)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (3, 3, N'bart', N'22222222', 3)
INSERT [dbo].[UsuariosSistema] ([idEmpleado], [idSucursal], [userId], [password], [idTipo]) VALUES (3, 4, N'francisco', N'13141516', 3)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clientes]    Script Date: 6/17/2019 11:41:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clientes] ON [dbo].[Clientes]
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosClientes]    Script Date: 6/17/2019 11:41:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosClientes] ON [dbo].[UsuariosClientes]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosSistema]    Script Date: 6/17/2019 11:41:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosSistema] ON [dbo].[UsuariosSistema]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServersSucursales] ADD  CONSTRAINT [DF_ServersSucursales_idPais]  DEFAULT ((1)) FOR [idPais]
GO
ALTER TABLE [dbo].[HorariosSucursales]  WITH CHECK ADD  CONSTRAINT [FK_HorariosSucursales_ServersSucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[ServersSucursales] ([id])
GO
ALTER TABLE [dbo].[HorariosSucursales] CHECK CONSTRAINT [FK_HorariosSucursales_ServersSucursales]
GO
ALTER TABLE [dbo].[ServersSucursales]  WITH CHECK ADD  CONSTRAINT [FK_ServersSucursales_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([id])
GO
ALTER TABLE [dbo].[ServersSucursales] CHECK CONSTRAINT [FK_ServersSucursales_Pais]
GO
ALTER TABLE [dbo].[UsuariosClientes]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosClientes_Clientes] FOREIGN KEY([id])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[UsuariosClientes] CHECK CONSTRAINT [FK_UsuariosClientes_Clientes]
GO
ALTER TABLE [dbo].[UsuariosSistema]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosSistema_ServersSucursales] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[ServersSucursales] ([id])
GO
ALTER TABLE [dbo].[UsuariosSistema] CHECK CONSTRAINT [FK_UsuariosSistema_ServersSucursales]
GO
ALTER TABLE [dbo].[UsuariosSistema]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosSistema_TipoUsuario] FOREIGN KEY([idTipo])
REFERENCES [dbo].[TipoUsuario] ([id])
GO
ALTER TABLE [dbo].[UsuariosSistema] CHECK CONSTRAINT [FK_UsuariosSistema_TipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMasVendidosGlobal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarMasVendidosGlobal]
	@fechaI date = null,
	@fechaF date = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @servers table (id int identity, idSucursal int, nombreServer varchar(50), pais varchar(50))
	declare @server varchar(50)

	declare @idSucursal int
	declare @max int, @count int
	declare @ventas table (id int identity, idSucursal int, idAuto int, consignacion bit, tipoAuto varchar(20), fecha date, idtipo int )
	declare @tipos table (idAuto int, nombreTipo varchar(20))



	insert into @servers (idSucursal, nombreServer) select S.id, S.nombreServer from ServersSucursales S 
	insert into @tipos (idAuto, nombreTipo) select * from openquery(SERVERFABRICA,  
				'select A.id, T.nombre from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')

	set @max = (select count(*) from @servers)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
	
		set @idSucursal = (select idSucursal from @servers where id = @count)

		insert into @ventas (idSucursal, idAuto, consignacion, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , I.idAutomovil, I.consignacion, V.fecha, AC.idtipo from Venta V inner join Inventario I 
				on V.idInventario = I.id inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		update @ventas set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @ventas A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @ventas set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @ventas A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		SET @count = @count + 1
	END

	select V.tipoAuto, count(*) as cantidad
		from @ventas V inner join ServersSucursales S on V.idSucursal = S.id
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by rollup(V.tipoAuto)
		order by cantidad desc

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMasVendidosSucursales]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarMasVendidosSucursales]
	@fechaI date = null,
	@fechaF date = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @servers table (id int identity, idSucursal int, nombreServer varchar(50), pais varchar(50))
	declare @server varchar(50)

	declare @idSucursal int
	declare @max int, @count int
	declare @ventas table (id int identity, idSucursal int, idAuto int, consignacion bit, tipoAuto varchar(20), fecha date, idtipo int )
	declare @tipos table (idAuto int, nombreTipo varchar(20))



	insert into @servers (idSucursal, nombreServer) select S.id, S.nombreServer from ServersSucursales S 
	insert into @tipos (idAuto, nombreTipo) select * from openquery(SERVERFABRICA,  
				'select A.id, T.nombre from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')

	set @max = (select count(*) from @servers)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
	
		set @idSucursal = (select idSucursal from @servers where id = @count)

		insert into @ventas (idSucursal, idAuto, consignacion, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , I.idAutomovil, I.consignacion, V.fecha, AC.idtipo from Venta V inner join Inventario I 
				on V.idInventario = I.id inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		update @ventas set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @ventas A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @ventas set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @ventas A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		SET @count = @count + 1
	END

	select S.nombreSucursal, V.tipoAuto, count(*) as cantidad
		from @ventas V inner join ServersSucursales S on V.idSucursal = S.id
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by rollup(S.nombreSucursal, V.tipoAuto)
		order by cantidad desc

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSinSalidaGlobal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarSinSalidaGlobal]
	@fechaI date = null,
	@fechaF date = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @servers table (id int identity, idSucursal int, nombreServer varchar(50), pais varchar(50))
	declare @server varchar(50)

	declare @idSucursal int
	declare @max int, @count int
	declare @vendidos table (id int identity, idSucursal int, idAuto int, consignacion bit, tipoAuto varchar(20), fecha date, idtipo int )
	declare @total table (id int identity, idSucursal int, idAuto int, consignacion bit, tipoAuto varchar(20), fecha date, idtipo int )
	declare @cantidadVendidos table (id int identity, tipoAuto varchar(20), cantidad int)
	declare @cantidadTotal table (id int identity, tipoAuto varchar(20), cantidad int)
	declare @tipos table (idAuto int, nombreTipo varchar(20))



	insert into @servers (idSucursal, nombreServer) select S.id, S.nombreServer from ServersSucursales S 
	insert into @tipos (idAuto, nombreTipo) select * from openquery(SERVERFABRICA,  
				'select A.id, T.nombre from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')

	set @max = (select count(*) from @servers)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
	
		set @idSucursal = (select idSucursal from @servers where id = @count)

		insert into @vendidos (idSucursal, idAuto, consignacion, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , I.idAutomovil, I.consignacion, V.fecha, AC.idtipo from Venta V inner join Inventario I 
				on V.idInventario = I.id inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		insert into @total (idSucursal, idAuto, consignacion, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , I.idAutomovil, I.consignacion, I.fechaIngreso, AC.idtipo from Inventario I left join Venta V 
				on I.id = V.idInventario inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		update @vendidos set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @vendidos A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @total set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @total A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @vendidos set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @vendidos A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		update @total set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @total A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		SET @count = @count + 1
	END

	insert into @cantidadVendidos (tipoAuto, cantidad)
	select V.tipoAuto, count(*) as cantidad
		from @vendidos V 
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by rollup(V.tipoAuto)

	insert into @cantidadTotal (tipoAuto, cantidad)
	select V.tipoAuto, count(*) as cantidad
		from @total V 
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by rollup(V.tipoAuto)

	select T.tipoAuto, (T.cantidad - isNULL(V.cantidad,0)) as noVendidos
		from @cantidadTotal T left join @cantidadVendidos V on T.tipoAuto = V.tipoAuto
		order by noVendidos desc

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSinSalidaSucursales]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarSinSalidaSucursales]
	@fechaI date = null,
	@fechaF date = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @servers table (id int identity, idSucursal int, nombreServer varchar(50), pais varchar(50))
	declare @server varchar(50)

	declare @idSucursal int
	declare @max int, @count int
	declare @vendidos table (id int identity, idSucursal int, idAuto int, consignacion bit, tipoAuto varchar(20), fecha date, idtipo int )
	declare @total table (id int identity, idSucursal int, idAuto int, consignacion bit, tipoAuto varchar(20), fecha date, idtipo int )
	declare @cantidadVendidos table (id int identity, sucursal varchar(50), tipoAuto varchar(20), cantidad int)
	declare @cantidadTotal table (id int identity, sucursal varchar(50), tipoAuto varchar(20), cantidad int)
	declare @tipos table (idAuto int, nombreTipo varchar(20))



	insert into @servers (idSucursal, nombreServer) select S.id, S.nombreServer from ServersSucursales S 
	insert into @tipos (idAuto, nombreTipo) select * from openquery(SERVERFABRICA,  
				'select A.id, T.nombre from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')

	set @max = (select count(*) from @servers)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
	
		set @idSucursal = (select idSucursal from @servers where id = @count)

		insert into @vendidos (idSucursal, idAuto, consignacion, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , I.idAutomovil, I.consignacion, V.fecha, AC.idtipo from Venta V inner join Inventario I 
				on V.idInventario = I.id inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		insert into @total (idSucursal, idAuto, consignacion, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , I.idAutomovil, I.consignacion, I.fechaIngreso, AC.idtipo from Inventario I left join Venta V 
				on I.id = V.idInventario inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		update @vendidos set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @vendidos A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @total set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @total A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @vendidos set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @vendidos A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		update @total set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @total A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		SET @count = @count + 1
	END

	insert into @cantidadVendidos (sucursal, tipoAuto, cantidad)
	select S.nombreSucursal, V.tipoAuto, count(*) as cantidad
		from @vendidos V inner join ServersSucursales S on V.idSucursal = S.id
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by rollup(S.nombreSucursal, V.tipoAuto)

	insert into @cantidadTotal (sucursal, tipoAuto, cantidad)
	select S.nombreSucursal, V.tipoAuto, count(*) as cantidad
		from @total V inner join ServersSucursales S on V.idSucursal = S.id
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by rollup(S.nombreSucursal, V.tipoAuto)

	select T.sucursal, T.tipoAuto, (T.cantidad - isNULL(V.cantidad,0)) as noVendidos
		from @cantidadTotal T left join @cantidadVendidos V on T.sucursal = V.sucursal and T.tipoAuto = V.tipoAuto
		order by noVendidos desc

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentasTipoAuto]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentasTipoAuto]
	@fechaI date = null,
	@fechaF date = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @servers table (id int identity, idSucursal int, nombreServer varchar(50), pais varchar(50))
	declare @server varchar(50)
	declare @pais varchar(50)
	declare @idSucursal int
	declare @max int, @count int
	declare @ventas table (id int identity, idSucursal int, pais varchar(50), idAuto int, consignacion bit, tipoAuto varchar(20), monto money, fecha date, idtipo int )
	declare @tipos table (idAuto int, nombreTipo varchar(20))

	insert into @servers (idSucursal, nombreServer, pais) select S.id, S.nombreServer, P.nombre from ServersSucursales S inner join Pais P on S.idPais = P.id
	insert into @tipos (idAuto, nombreTipo) select * from openquery(SERVERFABRICA,  
				'select A.id, T.nombre from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')

	set @max = (select count(*) from @servers)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
		set @pais = (select pais from @servers where id = @count)
	
		set @idSucursal = (select idSucursal from @servers where id = @count)

		insert into @ventas (idSucursal, pais, idAuto, consignacion, monto, fecha, idtipo)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , NULL , I.idAutomovil, I.consignacion, V.monto, V.fecha, AC.idtipo from Venta V inner join Inventario I 
				on V.idInventario = I.id inner join AutomovilXConsignacion AC on I.idAutomovil = AC.id'')') 

		update @ventas set pais = @pais where pais is NULL

		update @ventas set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombreTipo as tipo from @ventas A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0 and idSucursal = @idSucursal

		update @ventas set tipoAuto = Q.tipo
			From (Select A.id as q_id, T.nombre as tipo from @ventas A inner join  Tipo_Auto_Consignacion T on 
				A.idtipo = T.id) Q
			where Q.q_id = id and consignacion = 1 and idSucursal = @idSucursal

		SET @count = @count + 1
	END

	select V.pais, S.nombreSucursal, V.tipoAuto, sum(V.monto) as monto
		from @ventas V inner join ServersSucursales S on V.idSucursal = S.id
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by cube(V.pais, S.nombreSucursal, V.tipoAuto)

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentasTipoPago]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentasTipoPago]
	@fechaI date = null,
	@fechaF date = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @servers table (id int identity, idSucursal int, nombreServer varchar(50))
	declare @server varchar(50)
	declare @idSucursal int
	declare @max int, @count int
	declare @ventas table (id int identity, idSucursal int, tipoPago varchar(50), monto money, fecha date)


	insert into @servers (idSucursal, nombreServer) select S.id, S.nombreServer from ServersSucursales S 

	set @max = (select count(*) from @servers)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
	
		set @idSucursal = (select idSucursal from @servers where id = @count)

		insert into @ventas (idSucursal, tipoPago, monto, fecha)  exec ('select * from openquery(' + @server + ', ' + 
			'''select ' + @idSucursal +' , M.descripcion , V.monto, V.fecha from Venta V inner join MetodoPago M 
				on V.idMetodoPago = M.id '')') 



		SET @count = @count + 1
	END

	select V.tipoPago, S.nombreSucursal, sum(V.monto) as monto
		from @ventas V inner join ServersSucursales S on V.idSucursal = S.id
		where V.fecha >= isNULL(@fechaI, V.fecha) and V.fecha <= isNULL(@fechaF, V.fecha)
		group by cube(V.tipoPago, S.nombreSucursal)

END
GO
/****** Object:  StoredProcedure [dbo].[CrearPagoSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE  [dbo].[CrearPagoSucursal]
	@idCredito int,
	@fechaPago date,
	@montoPagado money,
	@idMetodoPago int, 
	@idSucursal int
AS
BEGIN
	SET NOCOUNT ON;

	-- Verificar si algun parametro es nulo
	if (@idCredito is null or
		@fechaPago is null or
		@montoPagado is null or
		@idMetodoPago is null or
		@idSucursal is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end

	declare @server varchar(50)
	set @server = (select nombreServer from ServersSucursales where id = @idSucursal)

	begin tran
		declare @pagoid int
		declare @resultTemp int
		declare @sqlCommand nvarchar(2000)
		set @sqlCommand = 'set @pagoid = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					INSERT INTO   Pago(idCredito, fechaPago, montoPagado, idMetodoPago)'+
									 'values ('+@idCredito+','''''+convert(varchar(20),@fechaPago,101)+''''','+@montoPagado+','+@idMetodoPago+') commit; 
					SELECT SCOPE_IDENTITY() AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@pagoid int OUTPUT', @pagoid = @pagoid output

		

		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					INSERT INTO   PagoTarjeta (id, montoRetenido)'+
									 'values ('+@pagoid+','+(@montoPagado*0.1)+') commit; 
					SELECT SCOPE_IDENTITY() AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
			
		end
	commit tran

	print 'Pago registrado exitosamente'
	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[CrearVenta]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CrearVenta] 
	@idFacturador int,
	@idCliente int,
	@idInventario int,
	@fecha date,
	@monto money,
	@idMetodoPago int,
	@descuento float = 0.1,
	@idSucursal int

AS
BEGIN

	-- Verificar si algun parametro es nulo
	if (@idFacturador is null or
		@idCliente is null or
		@idInventario is null or
		@fecha is null or 
		@monto is null or 
		@idMetodoPago is null or
		@idSucursal is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end
	
	
	declare @server varchar(50)
	set @server = (select nombreServer from ServersSucursales where id = @idSucursal)
	DECLARE @sqlCommand NVARCHAR(4000)
	declare @resultTemp int
	declare @ventaid int
		
	SET @sqlCommand = 'set @resultTemp = (select * from openquery(' + @server + ', ' + ''' select 1 from Empleado where id = ' + CAST(@idFacturador AS VARCHAR(20)) + '''))'
		exec sp_executesql @sqlCommand, N'@resultTemp int OUTPUT',
		@resultTemp = @resultTemp OUTPUT

	if(@resultTemp is null)
	begin
		print 'ID de Empleado introducido no existe en la BD'
		return -2
	end

	if(not exists(select 1 from Clientes where id = @idCliente))
	begin
		print 'ID de Cliente introducido no existe en la BD'
		return -3
	end

	declare @cantCompras int
	exec @cantCompras = GetCantidadCompras @idCliente

	if @cantCompras >= 3
	begin
		select @monto = @monto-(@monto*@descuento)
	end

	begin tran
		
		set @sqlCommand = 'set @ventaid = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					INSERT INTO Venta  (idFacturador, idCliente, idInventario, fecha, monto, idMetodoPago)'+
									 'values ('+CAST(@idFacturador AS VARCHAR(20))+','+CAST(@idCliente AS VARCHAR(20))+','+CAST(@idInventario AS VARCHAR(20))+','''''+convert(varchar(20),@fecha,101)+''''','+CAST(@monto AS VARCHAR(20))+','+CAST(@idMetodoPago AS VARCHAR(20))+') commit; 
					SELECT SCOPE_IDENTITY() AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@ventaid int OUTPUT', @ventaid = @ventaid output

		
		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					insert into VentaTarjeta (id, montoRetenido)'+
									 'values ('+CAST(@ventaid AS VARCHAR(20))+', '+CAST((@monto*0.1) AS VARCHAR(20))+') commit; 
					SELECT 1 AS ID''))'
			
			EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
		end
	commit tran

	

	print 'Venta registrada exitosamente'
	return @resultTemp

END
GO
/****** Object:  StoredProcedure [dbo].[CrearVentaConCredito]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[CrearVentaConCredito]
	@idFacturador int,
	@idCliente int,
	@idInventario int,
	@fecha date,
	@monto money,
	@idMetodoPago int,
	@descuento float = 0.1,
	@idSucursal int,
	@idInteres int,
	@cantPagos int,
	@saldoTotal money

AS
BEGIN

	-- Verificar si algun parametro es nulo
	if (@idFacturador is null or
		@idCliente is null or
		@idInventario is null or
		@fecha is null or 
		@monto is null or 
		@idMetodoPago is null or
		@idSucursal is null or
		@idInteres is null or
		@cantPagos is null or
		@saldoTotal is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end
	
	
	declare @server varchar(50)
	set @server = (select nombreServer from ServersSucursales where id = @idSucursal)
	DECLARE @sqlCommand NVARCHAR(4000)
	declare @resultTemp int
	declare @ventaid int
		
	SET @sqlCommand = 'set @resultTemp = (select * from openquery(' + @server + ', ' + ''' select 1 from Empleado where id = ' + CAST(@idFacturador AS VARCHAR(20)) + '''))'
		exec sp_executesql @sqlCommand, N'@resultTemp int OUTPUT',
		@resultTemp = @resultTemp OUTPUT

	if(@resultTemp is null)
	begin
		print 'ID de Empleado introducido no existe en la BD'
		select -2
	end

	if(not exists(select 1 from Clientes where id = @idCliente))
	begin
		print 'ID de Cliente introducido no existe en la BD'
		select -3
	end

	declare @cantCompras int
	exec @cantCompras = GetCantidadCompras @idCliente

	if @cantCompras >= 3
	begin
		select @monto = @monto-(@monto*@descuento)
	end

	begin tran
		
		set @sqlCommand = 'set @ventaid = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					INSERT INTO Venta  (idFacturador, idCliente, idInventario, fecha, monto, idMetodoPago)'+
									 'values ('+CAST(@idFacturador AS VARCHAR(20))+','+CAST(@idCliente AS VARCHAR(20))+','+CAST(@idInventario AS VARCHAR(20))+','''''+convert(varchar(20),@fecha,101)+''''','+CAST(@monto AS VARCHAR(20))+','+CAST(@idMetodoPago AS VARCHAR(20))+') commit; 
					SELECT SCOPE_IDENTITY() AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@ventaid int OUTPUT', @ventaid = @ventaid output

		
		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					insert into VentaTarjeta (id, montoRetenido)'+
									 'values ('+CAST(@ventaid AS VARCHAR(20))+', '+CAST((@monto*0.1) AS VARCHAR(20))+') commit; 
					SELECT 1 AS ID''))'
			
			
			EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
		end

		set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					insert into CreditosXCliente (idVenta, idInteres, cantPagos, saldoTotal)
						values ('+CAST(@ventaid AS VARCHAR(20))+', '+CAST(@idInteres AS VARCHAR(20))+', '+CAST(@cantPagos AS VARCHAR(20))+', '+CAST(@saldoTotal AS VARCHAR(20))+') commit; 
					SELECT 1 AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
	commit tran

	

	print 'Venta con credito registrada exitosamente'
	return @resultTemp

END
GO
/****** Object:  StoredProcedure [dbo].[CreateInteresSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateInteresSucursal]
		@nombreSucursal varchar(50) = null, @idInteres int = null, @porcentaje float = null
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Verificar si algun parametro es nulo
	if (@idInteres is null or @porcentaje is null or @nombreSucursal is null)
	begin
		print 'Uno o mas parametros son nulos'
		return -1
	end


	declare @server varchar(50)
	declare @sqlCommand nvarchar(2000)
	declare @result bit
	declare @resultTemp int

	set @server = (select nombreServer from ServersSucursales where nombreSucursal = @nombreSucursal)

	
	set @sqlCommand = 'set @result = (SELECT * FROM OPENQUERY(['+@server+ '], ''Select 1 from Interes where id = '+cast(@idInteres as varchar(20))+'''))'
	EXEC sp_executesql @sqlCommand, N'@result bit OUTPUT', @result = @result output


	
	if (@result is not null)
	begin
		print 'id de interes invalido'
		return -2
	end

	else
	begin
		begin tran
		
			set @sqlCommand = 'SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					INSERT INTO Interes  (id, porcentaje)'+
									 'values ('+cast(@idInteres as varchar(20))+','+cast(@porcentaje as varchar(20))+') commit; 
					SELECT 1'')'
			EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
		
		commit tran
	end

	return 0
END
GO
/****** Object:  StoredProcedure [dbo].[FiltrarAutosGlobal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FiltrarAutosGlobal]
	@nombreTargetSucursal varchar(50) = null, @modelo varchar(50) = null, @marca varchar(50) = null, @tipo varchar(50) = null, 
		@anho int = null, @precioMin money = null, @precioMax money = null, @caracteristica bit = null,
		@nombreCarac varchar(50) = null, @valorCaracteristica varchar(50) = null, @lat varchar(50) = null, @lon varchar(50) = null
AS
BEGIN
	


	SET NOCOUNT ON;

    declare @server varchar(50)
	declare @tipos table (idAuto int, modelo varchar(50), anho int, precio money, nombreTipo varchar(20), caracteristicas varchar(max))
	declare @inventario table (id int identity, idSucursal int, nombreSucursal varchar(50), locacion geography, idAuto int, idInventario int, 
								modelo varchar(50), marca varchar(50), tipo varchar(50), 
		caracteristicas varchar(max), anho int, idMarca int, idTipo int, precio money, consignacion bit)


	declare @idSucursal int
	declare @nombreSucursal varchar(50)
	declare @locacion geography
	declare @userLocation geography
	declare @max int, @count int

	set @userLocation = geography::STGeomFromText('POINT('+convert(varchar(20),@lon)+' '+convert(varchar(20),@lat)+')',4326)
	insert into @tipos (idAuto, modelo, anho, precio, nombreTipo, caracteristicas) select * from openquery(SERVERFABRICA,  
				'select A.id, M.nombre as modelo, YEAR(A.fechaFabricacion), M.precio, T.nombre as tipo, A.descripcion
				from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')
	

	set @max = (select count(*) from ServersSucursales)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		
		declare @sqlCommand nvarchar(2000)
		
		set @server = (select nombreServer from ServersSucursales where id = @count)
		set @nombreSucursal = (select nombreSucursal from ServersSucursales where id = @count)
		set @locacion = (select location from ServersSucursales where id = @count)
	
		set @idSucursal = @count

		set @sqlCommand = 'select * from openquery(' + @server + ', ' + 
			'''select ' + cast(@idSucursal as nvarchar) + ', ''''' + @nombreSucursal + ''''', ''''' + cast(@locacion as nvarchar) + ''''',  I.idAutomovil,
				 I.id, AC.modelo, AC.descripcion, AC.idmarca, AC.idtipo, AC.costoModelo, I.consignacion, AC.anho
				from Inventario I left join Venta V
				on I.id = V.idInventario left join AutomovilXConsignacion AC on I.idAutomovil = AC.id
				where V.idInventario is NULL'')'

		print @sqlCommand
		
		insert into @inventario (idSucursal, nombreSucursal, locacion, idAuto, idInventario, modelo, 
		caracteristicas, idMarca, idTipo, precio, consignacion, anho)  
		exec (@sqlCommand) 

		

		SET @count = @count + 1
	END

	update @inventario set marca = 'Alpha' where consignacion = 0

	update @inventario set tipo = Q.tipo, modelo = Q.modelo, anho = Q.anho, precio = Q.precio, caracteristicas = Q.car
			From (Select A.id as q_id, T.nombreTipo as tipo, T.modelo as modelo, T.anho as anho, T.precio as precio, T.caracteristicas as car
				 from @inventario A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0

	update @inventario set tipo = Q.tipo, marca = Q.marca
			From (Select A.id as q_id, T.nombre as tipo, M.nombre as marca 
			from @inventario A inner join  Tipo_Auto_Consignacion T on A.idtipo = T.id inner join Marca_Auto_Consignacion M
			on A.idMarca = M.id) Q
			where Q.q_id = id and consignacion = 1 

	--se busca en el json
	--formato json: '{"luces": "regulares", "aros": "de fabrica", "color": "negro", "extras": ["quemacocos", "asientos extra", "calefacción"], "precioExtras": 3999}'
	
	if (@caracteristica = 1)
	begin
		Select idSucursal, nombreSucursal, (locacion.STDistance(@locacion)) as Distancia, 
				idInventario, modelo, marca, tipo, anho, precio, caracteristicas
			from @inventario 
		where modelo = isNull(@modelo, modelo) and marca = isNULL(@marca, marca) and tipo = isNULL(@tipo, tipo) and anho = isNULL(@anho, anho) 
		and precio <= isNULL(@precioMax, precio) and precio >= isNULL(@precioMin, precio) and
		exists(select 1 from openJson(caracteristicas) where [key] = @nombreCarac and [value] like '%'+@valorCaracteristica+'%')
		and nombreSucursal = isNULL(@nombreTargetSucursal, nombreSucursal)
		order by Distancia asc
			
	end
	
	--se busca normal
	else
	begin
		Select idSucursal, nombreSucursal, (@userLocation.STDistance(locacion)) as Distancia, 
				idInventario, modelo, marca, tipo, anho, precio, caracteristicas
			from @inventario 
		where modelo = isNull(@modelo, modelo) and marca = isNULL(@marca, marca) and tipo = isNULL(@tipo, tipo) and anho = isNULL(@anho, anho) 
		and precio <= isNULL(@precioMax, precio) and precio >= isNULL(@precioMin, precio)
		and nombreSucursal = isNULL(@nombreTargetSucursal, nombreSucursal)
		order by Distancia asc
	end
END
GO
/****** Object:  StoredProcedure [dbo].[FiltrarAutosSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FiltrarAutosSucursal]
	@nombreSucursal varchar(50) = null, @modelo varchar(50) = null, @marca varchar(50) = null, @tipo varchar(50) = null, @anho int = null, 
	@precioMin money = null, @precioMax money = null, @caracteristica bit = null,
		@nombreCarac varchar(50) = null, @valorCaracteristica varchar(50) = null,
		@idTargetInventario int = null
AS
BEGIN
	SET NOCOUNT ON;

    if (@nombreSucursal is null)
	begin
		print 'Nombre de sucursal invalido'
		select -1
	end

	declare @server varchar(50)
	declare @tipos table (idAuto int, modelo varchar(50), anho int, precio money, nombreTipo varchar(20), caracteristicas varchar(max))
	declare @inventario table (id int identity, idAuto int, idInventario int, modelo varchar(50), marca varchar(50), tipo varchar(50), 
		caracteristicas varchar(max), anho int, idMarca int, idTipo int, precio money, consignacion bit)

	set @server = (select nombreServer from ServersSucursales where nombreSucursal = @nombreSucursal)
	insert into @tipos (idAuto, modelo, anho, precio, nombreTipo, caracteristicas) select * from openquery(SERVERFABRICA,  
				'select A.id, M.nombre as modelo, YEAR(A.fechaFabricacion), M.precio, T.nombre as tipo, A.descripcion
				from Autos A inner join Modelos M on A.fk_modelo = M.id inner join Tipo_Auto T on M.fk_tipo = T.id')

	insert into @inventario (idAuto, idInventario, modelo, 
		caracteristicas, idMarca, idTipo, precio, consignacion, anho)  
		exec ('select * from openquery(' + @server + ', ' + 
			'''select  I.idAutomovil, I.id, AC.modelo, AC.descripcion, AC.idmarca, AC.idtipo, AC.costoModelo, I.consignacion, AC.anho
				from Inventario I left join Venta V
				on I.id = V.idInventario left join AutomovilXConsignacion AC on I.idAutomovil = AC.id
				where V.idInventario is NULL'')') 

	update @inventario set marca = 'Alpha' where consignacion = 0

	update @inventario set tipo = Q.tipo, modelo = Q.modelo, anho = Q.anho, precio = Q.precio, caracteristicas = Q.car
			From (Select A.id as q_id, T.nombreTipo as tipo, T.modelo as modelo, T.anho as anho, T.precio as precio, T.caracteristicas as car
				 from @inventario A inner join @tipos T on A.idAuto = T.idAuto) Q
			where Q.q_id = id and consignacion = 0

	update @inventario set tipo = Q.tipo, marca = Q.marca
			From (Select A.id as q_id, T.nombre as tipo, M.nombre as marca 
			from @inventario A inner join  Tipo_Auto_Consignacion T on A.idtipo = T.id inner join Marca_Auto_Consignacion M
			on A.idMarca = M.id) Q
			where Q.q_id = id and consignacion = 1 

	
	--se busca en el json
	--formato json: '{"luces": "regulares", "aros": "de fabrica", "color": "negro", "extras": ["quemacocos", "asientos extra", "calefacción"], "precioExtras": 3999}'
	
	if (@caracteristica = 1)
	begin
		Select idInventario, modelo, marca, tipo, anho, precio, caracteristicas
			from @inventario 
		where modelo = isNull(@modelo, modelo) and marca = isNULL(@marca, marca) and tipo = isNULL(@tipo, tipo) and anho = isNULL(@anho, anho) 
		and precio <= isNULL(@precioMax, precio) and precio >= isNULL(@precioMin, precio) and
		exists(select 1 from openJson(caracteristicas) where [key] = @nombreCarac and [value] like '%'+@valorCaracteristica+'%')
		and idInventario = isNULL(@idTargetInventario, idInventario)
			
	end
	
	--se busca normal
	else
	begin
		Select idInventario, modelo, marca, tipo, anho, precio, caracteristicas
			from @inventario 
		where modelo = isNull(@modelo, modelo) and marca = isNULL(@marca, marca) and tipo = isNULL(@tipo, tipo) and anho = isNULL(@anho, anho) 
		and precio <= isNULL(@precioMax, precio) and precio >= isNULL(@precioMin, precio) 
		and idInventario = isNULL(@idTargetInventario, idInventario)
			
	end
END
GO
/****** Object:  StoredProcedure [dbo].[GetCantidadCompras]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create Procedure [dbo].[GetCantidadCompras]
	@idCliente int

as
BEGIN

	if @idCliente is NULL or not exists(select 1 from Clientes where id = @idCliente)
	begin
		print 'id de cliente invalido'
		return -1
	end

	declare @servers table (id int identity, idSucursal int, nombreServer varchar(50))
	declare @server varchar(50)
	
	declare @max int, @count int
	declare @cantidadCompras int

	insert into @servers (idSucursal, nombreServer) select S.id, S.nombreServer from ServersSucursales S 
	
	set @max = (select count(*) from @servers)
	set @count = 1
	set @cantidadCompras = 0

	WHILE (@count <= @max)
	BEGIN
		set @server = (select nombreServer from @servers where id = @count)
		declare @resultTemp int
		set @resultTemp = 0
		DECLARE @sqlCommand NVARCHAR(4000)
		
		SET @sqlCommand = 'set @resultTemp = (select * from openquery(' + @server + ', ' + ''' select count(*) from Venta V where V.fecha >= DATEADD(year, -5, GETDATE()) and V.idCliente = ' + CAST(@idCliente AS VARCHAR(20)) + '''))'
		exec sp_executesql @sqlCommand, N'@resultTemp int OUTPUT',
		@resultTemp = @resultTemp OUTPUT

		set @cantidadCompras = @cantidadCompras + @resultTemp

		SET @count = @count + 1
	END

	return @cantidadCompras

END
GO
/****** Object:  StoredProcedure [dbo].[GetComprasGlobal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetComprasGlobal]
	@nombreTargetSucursal varchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    

	declare @server varchar(50)
	declare @idSucursal int
	declare @nombreSucursal varchar(50)
	declare @max int, @count int

	declare @compras table (id int identity, idSucursal int, nombreSucursal varchar(50), idVenta int, idInventario int, idAuto int,
								idFacturador int, idCliente int, fecha date, monto money, 
								cantidadPagos int, saldoTotal money, interes float)
	
	set @max = (select count(*) from ServersSucursales)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		
		declare @sqlCommand nvarchar(2000)
		
		set @server = (select nombreServer from ServersSucursales where id = @count)
		set @nombreSucursal = (select nombreSucursal from ServersSucursales where id = @count)
	
		set @idSucursal = @count

		set @sqlCommand = 'select * from openquery(' + @server + ', ''select ' + CAST(@idSucursal AS VARCHAR(20)) +
		' , ''''' + @nombreSucursal + ''''' , V.id, V.idInventario, Inv.idAutomovil, V.idFacturador, V.idCliente, V.fecha, V.monto, CC.cantPagos, CC.saldoTotal, I.porcentaje
			from Venta V left join CreditosXCliente CC on V.id = CC.idVenta left join Interes I on CC.idInteres = I.id
			inner join Inventario Inv on V.idInventario = Inv.id'')'

		insert into @compras 
			(idSucursal, nombreSucursal, idVenta, idInventario, idAuto, idFacturador, idCliente, fecha, monto, cantidadPagos, saldoTotal, interes)  
				exec (@sqlCommand) 
	
		

		SET @count = @count + 1
	END
	
	
	Select idSucursal, nombreSucursal, idVenta,case when cantidadPagos is null then 'A Contado' else 'Por Credito' end as TipoVenta,
				  idInventario, idAuto, idFacturador, idCliente, fecha, monto, case when cantidadPagos is null then 1 else cantidadPagos end as PagosAsignados,
					 case when saldoTotal is null then monto else saldoTotal end as TotalAPagar, 
					 case when interes is null then 0 else interes end as InteresPorCredito
		from @compras where nombreSucursal = isNULL(@nombreTargetSucursal, nombreSucursal)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCreditosPendientesClienteGlobal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCreditosPendientesClienteGlobal]
	@idCliente int,
	@cedulaCliente int
AS
BEGIN
	
	SET NOCOUNT ON;

	if (@idCliente is null and @cedulaCliente is null)
	begin
		print 'ambos parametros invalidos'
		return -1
	end

	if (@idCliente is null)
	begin
		set @idCliente = (select id from Clientes where cedula = @cedulaCliente)
	end


	declare @server varchar(50)
	declare @idSucursal int
	declare @nombreSucursal varchar(50)
	declare @max int, @count int

	declare @creditosPendientes table (id int identity, idSucursal int, nombreSucursal varchar(50), idVenta int, 
								interes float, totalPagos int, total money, 
								pagosRealizados int, saldoPagado money )
	declare @pagosSucursal table (idCredito int, cantidad int, monto money, idSucursalP int)

	set @max = (select count(*) from ServersSucursales)
	set @count = 1

	WHILE (@count <= @max)
	BEGIN
		
		declare @sqlCommand nvarchar(2000)
		
		set @server = (select nombreServer from ServersSucursales where id = @count)
		set @nombreSucursal = (select nombreSucursal from ServersSucursales where id = @count)
	
		set @idSucursal = @count

		set @sqlCommand = 'select * from openquery(' + @server + ', ''select ' + CAST(@idSucursal AS VARCHAR(20)) +' , ''''' + @nombreSucursal + ''''' , CC.idVenta, I.porcentaje, CC.cantPagos, CC.saldoTotal 
			from CreditosXCliente CC inner join Interes I on CC.idInteres = I.id inner join Venta V on CC.idVenta = V.id where V.idCliente = ' + CAST(@idCliente AS VARCHAR(20)) +''')'

		insert into @creditosPendientes 
			(idSucursal, nombreSucursal, idVenta, interes, totalPagos, total)  
				exec (@sqlCommand) 
	
		set @sqlCommand = 'select * from openquery(' + @server + ', ' + 
			'''select CC.idVenta, count(*), sum(P.montoPagado)
			from CreditosXCliente CC inner join Pago P on P.idCredito = CC.idVenta inner join Venta V on CC.idVenta = V.id
			where V.idCliente = ' + CAST(@idCliente AS VARCHAR(20)) + '
			group by CC.idVenta'')'
		
		insert into @pagosSucursal 
			(idCredito, cantidad, monto)
			exec (@sqlCommand)

		update @pagosSucursal set idSucursalP = @idSucursal

		update @creditosPendientes set pagosRealizados = P.cantidad, saldoPagado = P.monto
			from @pagosSucursal P
			where P.idSucursalP = idSucursal and P.idCredito = idCredito

		delete from @pagosSucursal
		delete from @creditosPendientes where total = saldoPagado and pagosRealizados = totalPagos

		SET @count = @count + 1
	END
	
	
	Select idSucursal, nombreSucursal, idVenta, interes, totalPagos, total, pagosRealizados, saldoPagado, (total - saldoPagado) as saldoRestante,
						(totalPagos - pagosRealizados) as pagosRestantes
		from @creditosPendientes
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetFotosAutoSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFotosAutoSucursal]
	@nombreSucursal varchar(50), @idInventario int
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @server varchar(50)
	set @server = (select nombreServer from ServersSucursales where nombreSucursal = @nombreSucursal)

	EXEC ('(SELECT * FROM OPENQUERY(['+@server+ '], ''Select Im.imagen from ImagenXAutomovil Im where idAutomovil = '+@idInventario+'''))')
END
GO
/****** Object:  StoredProcedure [dbo].[GetSucursalCercana]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSucursalCercana]
	@lat varchar(50) = null, @lon varchar(50) = null
AS
BEGIN
	
	SET NOCOUNT ON;

    declare @userLocation geography

	set @userLocation = geography::STGeomFromText('POINT('+convert(varchar(20),@lon)+' '+convert(varchar(20),@lat)+')',4326)

	Select top 1 nombreSucursal from ServersSucursales order by @userLocation.STDistance(location) asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetTasasInteresSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTasasInteresSucursal]
	@idSucursal int
AS
BEGIN
	
	SET NOCOUNT ON;

	if (@idSucursal is null)
	begin
		print 'id de sucursal invalido'
		return -1
	end

	declare @server varchar(50)
	set @server = (select nombreServer from ServersSucursales where id = @idSucursal)

    
	EXEC ('(SELECT * FROM OPENQUERY(['+@server+ '], ''Select * from Interes''))')

END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarClienteCedula]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spBuscarClienteCedula]
	-- Add the parameters for the stored procedure here
	@cedula varchar(10),
	@idCliente int OUTPUT, @nombre varchar(50) OUTPUT, @apellido varchar(50) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @cedula is not null and exists (select 1 from Clientes C where C.cedula = @cedula)
	begin
		select @idCliente = C.id from Clientes C
		where C.cedula = @cedula

		select @nombre = C.nombre from Clientes C
		where C.cedula = @cedula

		select @apellido = C.apellido from Clientes C
		where C.cedula = @cedula

		return 1;
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spGetHorariosSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetHorariosSucursal]
	-- Add the parameters for the stored procedure here
	@nombreSucursal varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @idSucursal int;

    if @nombreSucursal is null
	begin
		return -1;
	end
	else
	begin
		select @idSucursal = SS.id from ServersSucursales SS where SS.nombreSucursal = @nombreSucursal;
		if not exists (select 1 from [Empresa].[dbo].[HorariosSucursales] SS where SS.idSucursal = @idSucursal)
		begin
			return 0;
		end
		else
		begin
			select HS.dia as Dia, HS.horaAbre as Apertura, HS.horaCierre as Clausura
			from [Empresa].[dbo].[HorariosSucursales] HS
			where HS.idSucursal = @idSucursal

			return 1;
		end
	end

END
GO
/****** Object:  StoredProcedure [dbo].[spGetNombresSucursales]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetNombresSucursales]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select SS.id, SS.nombreSucursal
	from ServersSucursales SS
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPersonasSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPersonasSucursal]
	-- Add the parameters for the stored procedure here
	@nombreSucursal varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @idSucursal int;

    if @nombreSucursal is null
	begin
		print 'El nombre de la sucural es nulo';
	end
	else
	begin
		select @idSucursal = SS.id from ServersSucursales SS where SS.nombreSucursal = @nombreSucursal
		if not exists (select 1 from ServersSucursales SS where SS.id = @idSucursal)
		begin
			print 'La sucursal no esta registrada';
		end
		else
		begin
			declare @server varchar(50)
			set @server = (select nombreServer from ServersSucursales where id = @idSucursal)

			exec ('select * from openquery(' + @server + ', ' + 
			'''select E.id as ID, E.nombre as Nombre, E.apellido as Apellido, E.cedula as Cedula, P.nombre as Puesto, E.correo as Correo, E.telefono as Telefono
			from Empleado E inner join Puesto P on P.id = E.idPuesto '')') 

			print 'Empleados de la sucursal desplegados'
		end
	end

		

END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCliente]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRegistrarCliente]
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@apellido varchar(50),
	@fechaNacimiento date,
	@correo varchar(50),
	@telefono varchar(10),
	@cedula varchar(50),
	@username varchar(20),
	@password varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @nombre is not null
		and @apellido is not null
		and @fechaNacimiento is not null
		and @correo is not null
		and @telefono is not null
		and @cedula is not null
		and @username is not null
		and @password is not null
	begin
		if exists (select 1 from [Empresa].[dbo].[UsuariosClientes] UC where UC.userId = @username and UC.password = @password)
		begin
			return -1;
		end
		else
		begin
			declare @anhosCliente int
			select @anhosCliente = DATEDIFF ( year , @fechaNacimiento, getdate()) - (case when getdate() < dateadd(yyyy,datediff(yyyy,@fechaNacimiento,getdate()),@fechaNacimiento) then 1 else 0 end)
			if @anhosCliente < 18
			begin
				return -2;
			end
			else
			begin
				begin transaction
					insert [Empresa].[dbo].Clientes(nombre,apellido,fechaNacimiento,correo,telefono,cedula)
					values (@nombre,@apellido,@fechaNacimiento,@correo,@telefono,@cedula)

					insert [Empresa].[dbo].UsuariosClientes(id,userId,password)
					values (SCOPE_IDENTITY(),@username,@password)
				commit
				return 1;
			end
		end
	end
	else
	begin
		return 0;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spVerificarCliente]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[spVerificarCliente]
	-- Add the parameters for the stored procedure here
	@username varchar(50), @password varchar(50),
	@idCliente int OUTPUT, @nombre varchar(50) OUTPUT, @apellido varchar(50) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @username is not null and @password is not null
	begin
		if exists (select 1 from UsuariosClientes UC where UC.userId = @username and UC.password=@password)
		begin
			select @idCliente = C.id from Clientes C inner join UsuariosClientes UC on C.id = UC.id
			where UC.userId = @username and UC.password = @password

			select @nombre = C.nombre from Clientes C inner join UsuariosClientes UC on C.id = UC.id
			where UC.userId = @username and UC.password = @password

			select @apellido = C.apellido from Clientes C inner join UsuariosClientes UC on C.id = UC.id
			where UC.userId = @username and UC.password = @password

			return 1;
		end
		else
		begin
			return 0;
		end
	end
	else
	begin
		return -1;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spVerificarEmpleado]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spVerificarEmpleado]
	-- Add the parameters for the stored procedure here
	@username varchar(50), @password varchar(50),
	@idEmpleado int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @username is not null and @password is not null
	begin
		if exists (select 1 from UsuariosSistema US where US.userId = @username and US.password=@password)
		begin
			declare @tipoEmpleado int;

			select @idEmpleado = C.idEmpleado from UsuariosSistema C
			where C.userId = @username and C.password = @password

			select @tipoEmpleado = TU.id
			from TipoUsuario TU inner join UsuariosSistema US on TU.id = US.idTipo
			where US.userId = @username and US.password = @password

			if(@tipoEmpleado = 1)
			begin
				return 2;
			end
			else
			begin
				if (@tipoEmpleado = 2)
				begin
					return 3;
				end
				else
				begin
					if (@tipoEmpleado = 3)
					begin
						return 4;
					end
				end
			end
		end
		else
		begin
			return 0;
		end
	end
	else
	begin
		return -1;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateInteresSucursal]    Script Date: 6/17/2019 11:41:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateInteresSucursal]
	@nombreSucursal varchar(50), @idInteres int, @newPorcentaje float
AS
BEGIN
	
	SET NOCOUNT ON;

	
    declare @server varchar(50)
	declare @sqlCommand nvarchar(2000)
	declare @result bit
	declare @resultTemp int

	set @server = (select nombreServer from ServersSucursales where nombreSucursal = @nombreSucursal)


	set @sqlCommand = 'set @result = (SELECT * FROM OPENQUERY(['+@server+ '], ''Select 1 from Interes where id = '+cast(@idInteres as varchar(20))+'''))'
	EXEC sp_executesql @sqlCommand, N'@result bit OUTPUT', @result = @result output


	
	if (@result is null)
	begin
		print 'id de interes invalido'
		return -1
	end

	else
	begin
		set @sqlCommand ='set @resultTemp = (SELECT 1 FROM OPENQUERY(['+@server+'], ''SET NOCOUNT ON; update Interes set porcentaje = '+cast(@newPorcentaje as varchar(20))+' where id = '+cast(@idInteres as varchar(20))+' commit; Select 1''))'
		
		EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
	end
	return 0
END
GO
USE [master]
GO
ALTER DATABASE [Empresa] SET  READ_WRITE 
GO
