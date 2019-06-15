USE [master]
GO
/****** Object:  Database [Empresa]    Script Date: 15/6/2019 3:22:58 p. m. ******/
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
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Empresa]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 15/6/2019 3:22:59 p. m. ******/
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
/****** Object:  Table [dbo].[HorariosSucursales]    Script Date: 15/6/2019 3:23:00 p. m. ******/
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
/****** Object:  Table [dbo].[Marca_Auto_Consignacion]    Script Date: 15/6/2019 3:23:01 p. m. ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 15/6/2019 3:23:01 p. m. ******/
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
/****** Object:  Table [dbo].[ServersSucursales]    Script Date: 15/6/2019 3:23:01 p. m. ******/
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
/****** Object:  Table [dbo].[Tipo_Auto_Consignacion]    Script Date: 15/6/2019 3:23:01 p. m. ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 15/6/2019 3:23:01 p. m. ******/
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
/****** Object:  Table [dbo].[UsuariosClientes]    Script Date: 15/6/2019 3:23:01 p. m. ******/
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
/****** Object:  Table [dbo].[UsuariosSistema]    Script Date: 15/6/2019 3:23:02 p. m. ******/
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
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (1, N'Costa Rica')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (2, N'Nicaragua')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (3, N'Panama')
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (1, N'SERVERSUCURSAL1', N'Sucursal #1', 0xE6100000010C077E54C37EF723404CDE0033DF0B55C0, 1)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (2, N'SERVERSUCURSAL2', N'Sucursal #2', 0xE6100000010CF888981249DC23406DC5FEB27B0B55C0, 1)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (3, N'SERVERSUCURSAL3', N'Sucursal #3', 0xE6100000010C91990B5C1E3B28408D5DA27A6B8C55C0, 2)
INSERT [dbo].[ServersSucursales] ([id], [nombreServer], [nombreSucursal], [location], [idPais]) VALUES (4, N'SERVERSUCURSAL4', N'Sucursal #4', 0xE6100000010C52BAF42F49052240A2EF6E6589E053C0, 3)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Clientes]    Script Date: 15/6/2019 3:23:04 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Clientes] ON [dbo].[Clientes]
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosClientes]    Script Date: 15/6/2019 3:23:04 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosClientes] ON [dbo].[UsuariosClientes]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosSistema]    Script Date: 15/6/2019 3:23:04 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UsuariosSistema] ON [dbo].[UsuariosSistema]
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ServersSucursales] ADD  CONSTRAINT [DF_ServersSucursales_idPais]  DEFAULT ((1)) FOR [idPais]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_UsuariosClientes] FOREIGN KEY([id])
REFERENCES [dbo].[UsuariosClientes] ([id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_UsuariosClientes]
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
/****** Object:  StoredProcedure [dbo].[ConsultarMasVendidosGlobal]    Script Date: 15/6/2019 3:23:04 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarMasVendidosSucursales]    Script Date: 15/6/2019 3:23:04 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarSinSalidaGlobal]    Script Date: 15/6/2019 3:23:04 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarSinSalidaSucursales]    Script Date: 15/6/2019 3:23:04 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentasTipoAuto]    Script Date: 15/6/2019 3:23:04 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentasTipoPago]    Script Date: 15/6/2019 3:23:04 p. m. ******/
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
USE [master]
GO
ALTER DATABASE [Empresa] SET  READ_WRITE 
GO
