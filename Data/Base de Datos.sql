USE [Clean IT]
GO
/****** Object:  Table [dbo].[Cleaners]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cleaners](
	[idCleaner] [int] IDENTITY(1,1) NOT NULL,
	[nacionalidad_cleaner] [varchar](50) NOT NULL,
	[foto_cleaner] [image] NOT NULL,
	[direccion_cleaner] [varchar](255) NOT NULL,
	[experiencia_cleaner] [varchar](100) NOT NULL,
	[antecedentes_cleaner] [image] NOT NULL,
	[descripcion_cleaner] [varchar](255) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[idReseñaCle] [int] NOT NULL,
 CONSTRAINT [PK_Cleaners] PRIMARY KEY CLUSTERED 
(
	[idCleaner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nacionalidad_cliente] [varchar](50) NOT NULL,
	[foto_cliente] [image] NOT NULL,
	[direccion_cliente] [varchar](255) NOT NULL,
	[descripcion_cliente] [varchar](255) NOT NULL,
	[antecedentes_cliente] [image] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[idReseñaCli] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasDeSeguridad]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasDeSeguridad](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Texto_Pregunta] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PreguntasDeSeguridad] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[imagen] [image] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñasCleaner]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñasCleaner](
	[idReseñaCle] [int] IDENTITY(1,1) NOT NULL,
	[cant_estrellas] [int] NOT NULL,
	[calificacion_trato] [int] NOT NULL,
	[calificacion_servicio] [int] NOT NULL,
	[opciones_seleccionadas] [varchar](255) NULL,
	[comentarios] [varchar](255) NULL,
 CONSTRAINT [PK_ReseñaCleaner] PRIMARY KEY CLUSTERED 
(
	[idReseñaCle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReseñasCliente]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReseñasCliente](
	[idReseñaCli] [int] NOT NULL,
	[cant_estrellas] [int] NOT NULL,
	[calificacion_trato] [int] NOT NULL,
	[opciones_seleccionadas] [varchar](255) NOT NULL,
	[comentarios] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ReseñasCliente] PRIMARY KEY CLUSTERED 
(
	[idReseñaCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespuestasPreguntas]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespuestasPreguntas](
	[IdUsuario] [int] NOT NULL,
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Texto_Respuesta] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicios] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[imagen] [image] NOT NULL,
	[texto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudCleaner]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudCleaner](
	[IdSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[servicio] [varchar](50) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idCleaner] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Email] [varchar](255) NULL,
	[Telefono] [varchar](50) NULL,
	[Documento] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosPreguntas]    Script Date: 22/10/2024 08:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosPreguntas](
	[IdUsuario] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[IdRespuesta] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cleaners]  WITH CHECK ADD  CONSTRAINT [FK_Cleaners_ReseñasCleaner1] FOREIGN KEY([idReseñaCle])
REFERENCES [dbo].[ReseñasCleaner] ([idReseñaCle])
GO
ALTER TABLE [dbo].[Cleaners] CHECK CONSTRAINT [FK_Cleaners_ReseñasCleaner1]
GO
ALTER TABLE [dbo].[Cleaners]  WITH CHECK ADD  CONSTRAINT [FK_Cleaners_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Cleaners] CHECK CONSTRAINT [FK_Cleaners_Usuarios]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_ReseñasCliente] FOREIGN KEY([idReseñaCli])
REFERENCES [dbo].[ReseñasCliente] ([idReseñaCli])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_ReseñasCliente]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Usuarios]
GO
ALTER TABLE [dbo].[RespuestasPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_RespuestasPreguntas_PreguntasDeSeguridad] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[PreguntasDeSeguridad] ([IdPregunta])
GO
ALTER TABLE [dbo].[RespuestasPreguntas] CHECK CONSTRAINT [FK_RespuestasPreguntas_PreguntasDeSeguridad]
GO
ALTER TABLE [dbo].[RespuestasPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_RespuestasPreguntas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[RespuestasPreguntas] CHECK CONSTRAINT [FK_RespuestasPreguntas_Usuarios]
GO
ALTER TABLE [dbo].[SolicitudCleaner]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudCleaner_Cleaners] FOREIGN KEY([idCleaner])
REFERENCES [dbo].[Cleaners] ([idCleaner])
GO
ALTER TABLE [dbo].[SolicitudCleaner] CHECK CONSTRAINT [FK_SolicitudCleaner_Cleaners]
GO
ALTER TABLE [dbo].[SolicitudCleaner]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudCleaner_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[SolicitudCleaner] CHECK CONSTRAINT [FK_SolicitudCleaner_Clientes]
GO
ALTER TABLE [dbo].[UsuariosPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosPreguntas_PreguntasDeSeguridad] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[PreguntasDeSeguridad] ([IdPregunta])
GO
ALTER TABLE [dbo].[UsuariosPreguntas] CHECK CONSTRAINT [FK_UsuariosPreguntas_PreguntasDeSeguridad]
GO
ALTER TABLE [dbo].[UsuariosPreguntas]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosPreguntas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuariosPreguntas] CHECK CONSTRAINT [FK_UsuariosPreguntas_Usuarios]
GO
