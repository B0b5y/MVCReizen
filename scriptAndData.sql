USE [master]
GO
/****** Object:  Database [reizen]    Script Date: 12 Dec 2023 09:32:15 ******/
CREATE DATABASE [reizen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reizen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\reizen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'reizen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\reizen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [reizen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reizen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reizen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reizen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reizen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reizen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reizen] SET ARITHABORT OFF 
GO
ALTER DATABASE [reizen] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [reizen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reizen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reizen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reizen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reizen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reizen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reizen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reizen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reizen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [reizen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reizen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reizen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reizen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reizen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reizen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reizen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reizen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [reizen] SET  MULTI_USER 
GO
ALTER DATABASE [reizen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reizen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reizen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reizen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [reizen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [reizen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [reizen] SET QUERY_STORE = ON
GO
ALTER DATABASE [reizen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [reizen]
GO
/****** Object:  Table [dbo].[bestemmingen]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bestemmingen](
	[code] [char](5) NOT NULL,
	[landid] [int] NOT NULL,
	[plaats] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[boekingen]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boekingen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[klantid] [int] NOT NULL,
	[reisid] [int] NOT NULL,
	[geboektOp] [date] NOT NULL,
	[aantalVolwassenen] [int] NULL,
	[aantalKinderen] [int] NULL,
	[annulatieVerzekering] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klanten]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klanten](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[familienaam] [varchar](50) NOT NULL,
	[voornaam] [varchar](50) NOT NULL,
	[adres] [varchar](50) NOT NULL,
	[woonplaatsid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landen]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[werelddeelid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reizen]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reizen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bestemmingscode] [char](5) NOT NULL,
	[vertrek] [date] NOT NULL,
	[aantalDagen] [int] NOT NULL,
	[prijsPerPersoon] [decimal](10, 2) NOT NULL,
	[aantalVolwassenen] [int] NOT NULL,
	[aantalKinderen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[werelddelen]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[werelddelen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naam] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[woonplaatsen]    Script Date: 12 Dec 2023 09:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[woonplaatsen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postcode] [int] NOT NULL,
	[naam] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'ALANY', 1, N'Alanya')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'ALEXA', 2, N'Alexandrie')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'ANTAL', 1, N'Antalya')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BAGHD', 3, N'Baghdad')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BALI ', 4, N'Bali (Kuta)')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BANGK', 5, N'Bangkok')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BARCE', 6, N'Barcelona')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BASRA', 3, N'Basra')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BENID', 6, N'Benidorm')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BOGOT', 7, N'Bogota')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'BUENO', 8, N'Buenos Aires')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CAIRO', 2, N'Caïro')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CALGA', 9, N'Calgary')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CARAC', 10, N'Caracas')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CARTA', 7, N'Cartagena')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CASSA', 11, N'Cassablanca')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CHIAN', 5, N'Chiangmai')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CORDO', 8, N'Cordoba')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'CORSI', 12, N'Corsica')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'DALLA', 13, N'Dallas')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'DROME', 12, N'Drome')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'DUSSD', 14, N'Dusseldorf')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'ELALA', 2, N'El''Alamein')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'GERON', 6, N'Gerona')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'GITES', 12, N'Gites')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'GRANC', 6, N'Gran Canaria')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'HAVA ', 15, N'Havana')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'HELSI', 16, N'Helsinki')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'ISTAN', 1, N'Istanbul')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'JAKAR', 4, N'Jakarta')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'KIRKU', 3, N'Kirkuk')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'LIMA ', 17, N'Lima')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MADRI', 6, N'Madrid')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MANIL', 18, N'Manila')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MARDE', 8, N'Mar del Plata')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MEDAN', 4, N'Medan')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MEXIC', 19, N'Mexico')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MIAMI', 13, N'Miami')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MOIRA', 6, N'Moirara')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MONTE', 20, N'Montevideo')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MONTR', 9, N'Montreal')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'MOSUL', 3, N'Mosul')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'NEWOR', 13, N'New Orleans')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'OTTAW', 9, N'Ottawa')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'PARIJ', 12, N'Parijs')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'PATTA', 5, N'Pattaya')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'PEKIN', 21, N'Peking')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'RABAT', 11, N'Rabat')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'RECIF', 22, N'Recife')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'RIO  ', 22, N'Rio de Janeiro')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'SALOU', 6, N'Salou')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'SANFR', 13, N'San Francisco')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'SANPA', 18, N'San Pablo')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'SAOPA', 22, N'Sao Paulo')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'SURUB', 4, N'Surubaya')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'TANGE', 11, N'Tanger')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'THEBE', 2, N'Thebes')
INSERT [dbo].[bestemmingen] ([code], [landid], [plaats]) VALUES (N'VERAC', 19, N'Veracruz')
GO
SET IDENTITY_INSERT [dbo].[boekingen] ON 

INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (3, 25, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (4, 25, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (5, 25, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (6, 22, 28, CAST(N'2023-08-18' AS Date), 3, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (7, 10, 27, CAST(N'2023-08-18' AS Date), 2, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (8, 25, 4, CAST(N'2023-08-18' AS Date), 2, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (9, 34, 4, CAST(N'2023-08-18' AS Date), 2, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (10, 25, 4, CAST(N'2023-08-18' AS Date), 2, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (11, 25, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (12, 22, 28, CAST(N'2023-08-18' AS Date), 2, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (13, 5, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (14, 34, 4, CAST(N'2023-08-18' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (15, 34, 10, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (16, 25, 4, CAST(N'2023-08-18' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (17, 19, 28, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (18, 34, 7, CAST(N'2023-08-18' AS Date), 6, 6, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (19, 22, 4, CAST(N'2023-08-18' AS Date), 6, 6, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (20, 22, 28, CAST(N'2023-08-18' AS Date), 2, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (21, 34, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (22, 10, 2, CAST(N'2023-08-18' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (23, 22, 2, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (24, 34, 2, CAST(N'2023-08-18' AS Date), 2, 3, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (25, 22, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (26, 22, 4, CAST(N'2023-08-18' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (27, 25, 4, CAST(N'2023-08-18' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (28, 22, 25, CAST(N'2023-08-18' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (29, 34, 14, CAST(N'2023-08-18' AS Date), 4, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (30, 34, 14, CAST(N'2023-08-18' AS Date), 4, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (31, 34, 14, CAST(N'2023-08-18' AS Date), 4, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (32, 34, 14, CAST(N'2023-08-18' AS Date), 4, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (33, 25, 4, CAST(N'2023-08-18' AS Date), 8, 7, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (34, 22, 4, CAST(N'2023-08-18' AS Date), 16, 16, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (35, 22, 4, CAST(N'2023-08-18' AS Date), 16, 16, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (36, 34, 4, CAST(N'2023-08-18' AS Date), 17, 17, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (37, 34, 4, CAST(N'2023-08-18' AS Date), 10, 5, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (38, 22, 16, CAST(N'2023-08-21' AS Date), 5, 5, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (39, 33, 16, CAST(N'2023-08-21' AS Date), 4, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (40, 22, 27, CAST(N'2023-08-21' AS Date), -1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (41, 25, 15, CAST(N'2023-08-21' AS Date), -1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (42, 25, 21, CAST(N'2023-08-21' AS Date), -1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (43, 25, 15, CAST(N'2023-08-21' AS Date), -1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (44, 34, 27, CAST(N'2023-08-21' AS Date), -1, -1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (45, 40, 16, CAST(N'2023-08-21' AS Date), -1, -1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (46, 22, 28, CAST(N'2023-08-21' AS Date), 0, -1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (47, 34, 4, CAST(N'2023-08-21' AS Date), -1, -1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (48, 48, 4, CAST(N'2023-08-21' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (49, 28, 28, CAST(N'2023-08-21' AS Date), -2, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (50, 3, 28, CAST(N'2023-08-21' AS Date), 0, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (51, 30, 27, CAST(N'2023-08-21' AS Date), -1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (52, 19, 27, CAST(N'2023-08-21' AS Date), 6, -2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (53, 13, 4, CAST(N'2023-08-21' AS Date), 3, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (54, 32, 4, CAST(N'2023-08-21' AS Date), 3, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (55, 44, 29, CAST(N'2023-08-30' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (56, 22, 4, CAST(N'2023-08-31' AS Date), 2, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (57, 2, 28, CAST(N'2023-08-31' AS Date), 1, 2, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (58, 39, 23, CAST(N'2023-12-08' AS Date), 3, 3, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (59, 19, 4, CAST(N'2023-12-08' AS Date), 2, 4, 1)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (60, 19, 28, CAST(N'2023-12-08' AS Date), 2, 3, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (61, 49, 22, CAST(N'2023-12-11' AS Date), 2, 2, 1)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (62, 32, 4, CAST(N'2023-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (63, 32, 4, CAST(N'2023-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (64, 32, 4, CAST(N'2023-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (65, 25, 28, CAST(N'2023-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (66, 25, 28, CAST(N'2023-12-11' AS Date), 1, 1, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (67, 17, 4, CAST(N'2023-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (68, 34, 4, CAST(N'2023-12-11' AS Date), 1, 0, 0)
INSERT [dbo].[boekingen] ([id], [klantid], [reisid], [geboektOp], [aantalVolwassenen], [aantalKinderen], [annulatieVerzekering]) VALUES (69, 34, 28, CAST(N'2023-12-11' AS Date), 1, 0, 0)
SET IDENTITY_INSERT [dbo].[boekingen] OFF
GO
SET IDENTITY_INSERT [dbo].[klanten] ON 

INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (1, N'Rovers', N'Veerle', N'Kerkstraat 26', 1)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (2, N'Vandenabeele', N'Marc', N'Markt 16', 2)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (3, N'Tijtgat', N'Ward', N'Noordstraat 23', 3)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (4, N'Dhollander', N'Dirk', N'Sepulkrijnenlaan 14', 4)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (5, N'Vanacker', N'Hanne', N'Langestraat 98', 3)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (6, N'Catteeuw', N'Eric', N'Provinciestraat 14', 5)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (7, N'Bonnet', N'Roger', N'St-Hubertuslaan 41', 6)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (8, N'Platteau', N'Magda', N'Vijfwegenstraat 164', 7)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (9, N'Van Elk', N'Peter', N'Molenstraat 56', 8)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (10, N'Van den Broecke', N'Lucie', N'Koning Albertlaan 23', 6)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (11, N'Lanssens', N'Piet', N'Hoogstraat 10', 7)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (12, N'Ramon', N'Johan', N'Beukenlaan 16', 9)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (13, N'De Clerk', N'Dorine', N'Lindenlaan 23', 6)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (14, N'Glorieux', N'Ann', N'Hoogstraat 2', 2)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (15, N'Janssens', N'Johan', N'Kortrijkse steenweg 56', 8)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (16, N'Kerkhove', N'Greet', N'Kattestraat 10', 15)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (17, N'Desmet', N'Jozef', N'Brugse steenweg 203', 7)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (18, N'Ruysschaert', N'Ann', N'Beheersstraat 12', 10)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (19, N'Van Den Broecke', N'Luc', N'Eikenberg 62', 11)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (20, N'Vandenbroucke', N'Jan', N'Stationsstraat 89', 4)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (21, N'Declerck', N'Mia', N'Rodestraat 12', 11)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (22, N'Deschuymere', N'Kathy', N'Jozef Plateaustraat 10', 13)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (23, N'Cloet', N'Hugo', N'Keizerlei 57', 5)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (24, N'Coopman', N'Peter', N'Eikenlaan 54', 8)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (25, N'Deschuymer', N'Elsie', N'St-Pietersnieuwstraat 2', 13)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (26, N'Lambrecht', N'Geert', N'Groenstraat 412', 15)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (27, N'Janssens', N'Dirk', N'Grote Markt 12', 10)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (28, N'Goethals', N'Patrick', N'Romeinse laan 16', 10)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (29, N'Meuleman', N'Luc', N'Italiëlei 203', 5)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (30, N'Staelens', N'Els', N'Scheldestraat 89', 5)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (31, N'Blomme', N'Alain', N'Klaverheide 10', 5)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (32, N'D''hollander', N'Luc', N'Zuidmolenstraat 12', 7)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (33, N'Vanackere', N'Charlotte', N'Zuidstraat 87', 2)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (34, N'Desmedt', N'Mia', N'Stationsstraat 16', 1)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (35, N'Grymonprez', N'Hans', N'Heidebloemlaan 16', 15)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (36, N'Cooman', N'Eric', N'Leopold 3-laan', 14)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (37, N'Mussche', N'Rose-Anne', N'Overleiestraat 10', 10)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (38, N'Bonte', N'Louise', N'Westlaan 16', 7)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (39, N'Vandenbroecke', N'Stefaan', N'Sikkelstraat 56', 11)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (40, N'Vanden Abeele', N'Roger', N'Tongerse steenweg 124', 4)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (41, N'Declercq', N'Maria', N'Demerstraat 45', 4)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (42, N'Kerckhof', N'Guido', N'Sterreweg 45', 15)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (43, N'Jansen', N'Wilfried', N'Blandijnberg 56', 12)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (44, N'De Smet', N'Dirk', N'Kouter 23', 12)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (45, N'Jansens', N'Simon', N'Schoolstraat 78', 3)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (46, N'Waterloos', N'Marie-Anne', N'Overpoortstraat 25', 12)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (47, N'Janssen', N'Veerle', N'Kortrijkse steenweg 10', 12)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (48, N'Stockmans', N'Mieke', N'Oude Vest 14', 2)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (49, N'Dereygere', N'Clement', N'Berkenlaan 8', 13)
INSERT [dbo].[klanten] ([id], [familienaam], [voornaam], [adres], [woonplaatsid]) VALUES (50, N'Jacobs', N'Dirk', N'Vindictievelaan 14', 14)
SET IDENTITY_INSERT [dbo].[klanten] OFF
GO
SET IDENTITY_INSERT [dbo].[landen] ON 

INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (1, N'Turkije', 1)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (2, N'Egypte', 2)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (3, N'Irak', 3)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (4, N'Indonesië', 3)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (5, N'Thailand', 3)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (6, N'Spanje', 1)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (7, N'Colombia', 4)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (8, N'Argentinië', 4)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (9, N'Canada', 5)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (10, N'Venezuela', 4)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (11, N'Marokko', 2)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (12, N'Frankrijk', 1)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (13, N'Verenigde Staten', 5)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (14, N'Duitsland', 1)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (15, N'Cuba', 6)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (16, N'Finland', 1)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (17, N'Peru', 4)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (18, N'Filipijnen', 3)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (19, N'Mexico', 4)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (20, N'Uruguay', 4)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (21, N'China', 3)
INSERT [dbo].[landen] ([id], [naam], [werelddeelid]) VALUES (22, N'Brazilië', 4)
SET IDENTITY_INSERT [dbo].[landen] OFF
GO
SET IDENTITY_INSERT [dbo].[reizen] ON 

INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (1, N'SANPA', CAST(N'2023-07-04' AS Date), 14, CAST(2300.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (2, N'SANFR', CAST(N'2023-06-24' AS Date), 14, CAST(3200.00 AS Decimal(10, 2)), 2, 3)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (3, N'BALI ', CAST(N'2023-06-14' AS Date), 21, CAST(4300.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (4, N'CORSI', CAST(N'2023-08-23' AS Date), 23, CAST(1600.00 AS Decimal(10, 2)), 35, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (5, N'CORDO', CAST(N'2023-09-02' AS Date), 21, CAST(5300.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (6, N'MADRI', CAST(N'2023-09-12' AS Date), 10, CAST(1400.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (7, N'SANPA', CAST(N'2023-09-22' AS Date), 23, CAST(4900.00 AS Decimal(10, 2)), 6, 6)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (8, N'RABAT', CAST(N'2023-10-02' AS Date), 12, CAST(2770.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (9, N'TANGE', CAST(N'2023-10-12' AS Date), 23, CAST(3650.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (10, N'VERAC', CAST(N'2023-10-22' AS Date), 14, CAST(4900.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (11, N'MEDAN', CAST(N'2023-07-24' AS Date), 19, CAST(5320.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (12, N'TANGE', CAST(N'2023-08-03' AS Date), 14, CAST(2795.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (13, N'GRANC', CAST(N'2023-08-13' AS Date), 10, CAST(1300.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (14, N'ISTAN', CAST(N'2023-08-23' AS Date), 14, CAST(2773.00 AS Decimal(10, 2)), 4, 2)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (15, N'HELSI', CAST(N'2023-09-02' AS Date), 12, CAST(2399.00 AS Decimal(10, 2)), -2, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (16, N'MIAMI', CAST(N'2023-09-12' AS Date), 23, CAST(5890.00 AS Decimal(10, 2)), 8, 5)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (17, N'RABAT', CAST(N'2023-09-22' AS Date), 14, CAST(2950.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (18, N'RABAT', CAST(N'2023-10-02' AS Date), 21, CAST(3590.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (19, N'GITES', CAST(N'2023-10-12' AS Date), 14, CAST(3200.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (20, N'LIMA ', CAST(N'2023-10-22' AS Date), 28, CAST(6790.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (21, N'BANGK', CAST(N'2023-07-24' AS Date), 22, CAST(5395.00 AS Decimal(10, 2)), -1, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (22, N'SURUB', CAST(N'2023-08-03' AS Date), 28, CAST(6666.00 AS Decimal(10, 2)), 2, 2)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (23, N'CAIRO', CAST(N'2023-08-13' AS Date), 8, CAST(1468.00 AS Decimal(10, 2)), 3, 3)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (24, N'BARCE', CAST(N'2023-08-23' AS Date), 9, CAST(1240.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (25, N'DUSSD', CAST(N'2023-09-02' AS Date), 4, CAST(840.00 AS Decimal(10, 2)), 1, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (26, N'MOIRA', CAST(N'2023-09-12' AS Date), 20, CAST(1630.00 AS Decimal(10, 2)), 0, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (27, N'MIAMI', CAST(N'2023-09-22' AS Date), 21, CAST(5300.00 AS Decimal(10, 2)), 3, -2)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (28, N'CORSI', CAST(N'2023-10-02' AS Date), 10, CAST(2400.00 AS Decimal(10, 2)), 6, 0)
INSERT [dbo].[reizen] ([id], [bestemmingscode], [vertrek], [aantalDagen], [prijsPerPersoon], [aantalVolwassenen], [aantalKinderen]) VALUES (29, N'HAVA ', CAST(N'2023-10-12' AS Date), 14, CAST(1800.00 AS Decimal(10, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[reizen] OFF
GO
SET IDENTITY_INSERT [dbo].[werelddelen] ON 

INSERT [dbo].[werelddelen] ([id], [naam]) VALUES (2, N'Afrika')
INSERT [dbo].[werelddelen] ([id], [naam]) VALUES (3, N'Azië')
INSERT [dbo].[werelddelen] ([id], [naam]) VALUES (6, N'Centraal-Amerika')
INSERT [dbo].[werelddelen] ([id], [naam]) VALUES (5, N'Noord-Amerika')
INSERT [dbo].[werelddelen] ([id], [naam]) VALUES (1, N'West Europa')
INSERT [dbo].[werelddelen] ([id], [naam]) VALUES (4, N'Zuid-Amerika')
SET IDENTITY_INSERT [dbo].[werelddelen] OFF
GO
SET IDENTITY_INSERT [dbo].[woonplaatsen] ON 

INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (1, 8000, N'Brugge')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (2, 9300, N'Aalst')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (3, 2300, N'Turnhout')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (4, 3500, N'Hasselt')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (5, 2000, N'Antwerpen')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (6, 3800, N'Sint-Truiden')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (7, 8800, N'Roeselare')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (8, 9800, N'Deinze')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (9, 8810, N'Lichtervelde')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (10, 8500, N'Kortrijk')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (11, 3700, N'Tongeren')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (12, 9000, N'Gent')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (13, 3600, N'Genk')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (14, 8400, N'Oostende')
INSERT [dbo].[woonplaatsen] ([id], [postcode], [naam]) VALUES (15, 2200, N'Herentals')
SET IDENTITY_INSERT [dbo].[woonplaatsen] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__landen__72E1CD78C36E6503]    Script Date: 12 Dec 2023 09:32:16 ******/
ALTER TABLE [dbo].[landen] ADD UNIQUE NONCLUSTERED 
(
	[naam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__wereldde__72E1CD78B6FAACE7]    Script Date: 12 Dec 2023 09:32:16 ******/
ALTER TABLE [dbo].[werelddelen] ADD UNIQUE NONCLUSTERED 
(
	[naam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reizen] ADD  DEFAULT ((0)) FOR [aantalVolwassenen]
GO
ALTER TABLE [dbo].[reizen] ADD  DEFAULT ((0)) FOR [aantalKinderen]
GO
ALTER TABLE [dbo].[bestemmingen]  WITH CHECK ADD  CONSTRAINT [bestemmingen_landen] FOREIGN KEY([landid])
REFERENCES [dbo].[landen] ([id])
GO
ALTER TABLE [dbo].[bestemmingen] CHECK CONSTRAINT [bestemmingen_landen]
GO
ALTER TABLE [dbo].[boekingen]  WITH CHECK ADD  CONSTRAINT [boekingen_klanten] FOREIGN KEY([klantid])
REFERENCES [dbo].[klanten] ([id])
GO
ALTER TABLE [dbo].[boekingen] CHECK CONSTRAINT [boekingen_klanten]
GO
ALTER TABLE [dbo].[boekingen]  WITH CHECK ADD  CONSTRAINT [boekingen_reizen] FOREIGN KEY([reisid])
REFERENCES [dbo].[reizen] ([id])
GO
ALTER TABLE [dbo].[boekingen] CHECK CONSTRAINT [boekingen_reizen]
GO
ALTER TABLE [dbo].[klanten]  WITH CHECK ADD  CONSTRAINT [klanten_woonplaatsen] FOREIGN KEY([woonplaatsid])
REFERENCES [dbo].[woonplaatsen] ([id])
GO
ALTER TABLE [dbo].[klanten] CHECK CONSTRAINT [klanten_woonplaatsen]
GO
ALTER TABLE [dbo].[landen]  WITH CHECK ADD  CONSTRAINT [landen_werelddelen] FOREIGN KEY([werelddeelid])
REFERENCES [dbo].[werelddelen] ([id])
GO
ALTER TABLE [dbo].[landen] CHECK CONSTRAINT [landen_werelddelen]
GO
ALTER TABLE [dbo].[reizen]  WITH CHECK ADD  CONSTRAINT [reizen_bestemmingen] FOREIGN KEY([bestemmingscode])
REFERENCES [dbo].[bestemmingen] ([code])
GO
ALTER TABLE [dbo].[reizen] CHECK CONSTRAINT [reizen_bestemmingen]
GO
USE [master]
GO
ALTER DATABASE [reizen] SET  READ_WRITE 
GO
