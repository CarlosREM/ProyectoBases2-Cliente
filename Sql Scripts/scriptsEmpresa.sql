USE [master]
GO
/****** Object:  Database [Empresa]    Script Date: 16/06/2019 2:51:59 PM ******/
CREATE DATABASE [Empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Empresa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Empresa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Empresa] SET QUERY_STORE = OFF
GO
USE [Empresa]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16/06/2019 2:52:00 PM ******/
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
/****** Object:  Table [dbo].[HorariosSucursales]    Script Date: 16/06/2019 2:52:01 PM ******/
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
/****** Object:  Table [dbo].[Marca_Auto_Consignacion]    Script Date: 16/06/2019 2:52:01 PM ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 16/06/2019 2:52:02 PM ******/
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
/****** Object:  Table [dbo].[ServersSucursales]    Script Date: 16/06/2019 2:52:02 PM ******/
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
/****** Object:  Table [dbo].[Tipo_Auto_Consignacion]    Script Date: 16/06/2019 2:52:02 PM ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 16/06/2019 2:52:02 PM ******/
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
/****** Object:  Table [dbo].[UsuariosClientes]    Script Date: 16/06/2019 2:52:02 PM ******/
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
/****** Object:  Table [dbo].[UsuariosSistema]    Script Date: 16/06/2019 2:52:02 PM ******/
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

INSERT [dbo].[Clientes] ([id], [nombre], [apellido], [fechaNacimiento], [correo], [telefono], [cedula]) VALUES (2, N'Fabricio', N'Ceciliano', CAST(N'1999-01-16' AS Date), N'fabricio.ceciliano.n@gmail.com', N'60049508', N'117320506')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (1, N'Costa Rica')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (2, N'Nicaragua')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (3, N'Panama')
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (1, N'SERVERSUCURSAL1', N'Sucursal #1', 0xE6100000010C077E54C37EF723404CDE0033DF0B55C0, 1)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (2, N'SERVERSUCURSAL2', N'Sucursal #2', 0xE6100000010CF888981249DC23406DC5FEB27B0B55C0, 1)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (3, N'SERVERSUCURSAL3', N'Sucursal #3', 0xE6100000010C91990B5C1E3B28408D5DA27A6B8C55C0, 2)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (4, N'SERVERSUCURSAL4', N'Sucursal #4', 0xE6100000010C52BAF42F49052240A2EF6E6589E053C0, 3)
INSERT [dbo].[UsuariosClientes] ([id], [userId], [password]) VALUES (2, N'fcn', N'fcn1630')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clientes]    Script Date: 16/06/2019 2:52:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clientes] ON [dbo].[Clientes]
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosClientes]    Script Date: 16/06/2019 2:52:05 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosClientes] ON [dbo].[UsuariosClientes]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosSistema]    Script Date: 16/06/2019 2:52:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarMasVendidosGlobal]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ConsultarMasVendidosGlobal]
	@fechaI date,
	@fechaF date
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
/****** Object:  StoredProcedure [dbo].[ConsultarMasVendidosSucursales]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ConsultarMasVendidosSucursales]
	@fechaI date,
	@fechaF date
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
/****** Object:  StoredProcedure [dbo].[ConsultarSinSalidaGlobal]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ConsultarSinSalidaGlobal]
	@fechaI date,
	@fechaF date
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
/****** Object:  StoredProcedure [dbo].[ConsultarSinSalidaSucursales]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ConsultarSinSalidaSucursales]
	@fechaI date,
	@fechaF date
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentasTipoAuto]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentasTipoAuto]
	@fechaI date,
	@fechaF date
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentasTipoPago]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentasTipoPago]
	@fechaI date,
	@fechaF date
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
/****** Object:  StoredProcedure [dbo].[CrearVenta]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[CrearVenta] 
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
									 'values ('+@idFacturador+','+@idCliente+','+@idInventario+','''''+convert(varchar(20),@fecha,101)+''''','+@monto+','+@idMetodoPago+') commit; 
					SELECT SCOPE_IDENTITY() AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@ventaid int OUTPUT', @ventaid = @ventaid output

		
		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					insert into VentaTarjeta (id, montoRetenido)'+
									 'values ('+@ventaid+', '+(@monto*0.1)+') commit; 
					SELECT 1 AS ID''))'
			
			EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
		end
	commit tran

	

	print 'Venta registrada exitosamente'
	return @resultTemp

END
GO
/****** Object:  StoredProcedure [dbo].[CrearVentaConCredito]    Script Date: 16/06/2019 2:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[CrearVentaConCredito]
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
									 'values ('+@idFacturador+','+@idCliente+','+@idInventario+','''''+convert(varchar(20),@fecha,101)+''''','+@monto+','+@idMetodoPago+') commit; 
					SELECT SCOPE_IDENTITY() AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@ventaid int OUTPUT', @ventaid = @ventaid output

		
		if (@idMetodoPago = 1) -- es igual al id de pago con tarjetas
		begin
			set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					insert into VentaTarjeta (id, montoRetenido)'+
									 'values ('+@ventaid+', '+(@monto*0.1)+') commit; 
					SELECT 1 AS ID''))'
			
			EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
		end

		set @sqlCommand = 'set @resultTemp = (SELECT * FROM OPENQUERY(['+@server+ '], ''SET NOCOUNT ON; 
					insert into CreditosXCliente (idVenta, idInteres, cantPagos, saldoTotal)
						values ('+@ventaid+', '+@idInteres+', '+@cantPagos+', '+@saldoTotal+') commit; 
					SELECT 1 AS ID''))'
		EXEC sp_executesql @sqlCommand, N'@resultTemp int OUTPUT', @resultTemp = @resultTemp output
	commit tran

	

	print 'Venta con credito registrada exitosamente'
	return @resultTemp

END
GO
/****** Object:  StoredProcedure [dbo].[GetCantidadCompras]    Script Date: 16/06/2019 2:52:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetHorariosSucursal]    Script Date: 16/06/2019 2:52:05 PM ******/
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
	@idSucursal int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @idSucursal is null or not exists (select 1 from [Empresa].[dbo].[HorariosSucursales] SS where SS.idSucursal = @idSucursal)
	begin
		print 'El ID de la sucural es nulo o la sucursal no esta registrada';
	end
	else
	begin
		select HS.dia, HS.horaAbre, HS.horaCierre
		from [Empresa].[dbo].[HorariosSucursales] HS
		where HS.idSucursal = @idSucursal

		print 'Horarios de la sucursal desplegados'
	end

END
GO
/****** Object:  StoredProcedure [dbo].[spGetPersonasSucursal]    Script Date: 16/06/2019 2:52:05 PM ******/
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
	@idSucursal int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if @idSucursal is null or not exists (select 1 from ServersSucursales SS where SS.id = @idSucursal)
	begin
		print 'El ID de la sucural es nulo o la sucursal no esta registrada';
	end
	else
	begin
		declare @server varchar(50)
		set @server = (select nombreServer from ServersSucursales where id = @idSucursal)

		exec ('select * from openquery(' + @server + ', ' + 
		'''select E.id, E.nombre, E.apellido, E.cedula, P.nombre as Puesto, E.correo, E.telefono, E.fechaNacimiento, E.fechaContratacion
		from Empleado E inner join Puesto P on P.id = E.idPuesto '')') 
		
				

		print 'Empleados de la sucursal desplegados'
	end

END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCliente]    Script Date: 16/06/2019 2:52:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spVerificarCliente]    Script Date: 16/06/2019 2:52:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spVerificarEmpleado]    Script Date: 16/06/2019 2:52:05 PM ******/
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
USE [master]
GO
ALTER DATABASE [Empresa] SET  READ_WRITE 
GO
