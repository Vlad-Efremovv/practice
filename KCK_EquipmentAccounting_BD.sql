USE [master]
GO
/****** Object:  Database [KCK_EquipmentAccounting]    Script Date: 22.10.2023 15:48:12 ******/
CREATE DATABASE [KCK_EquipmentAccounting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KCK_EquipmentAccounting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KCK_EquipmentAccounting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KCK_EquipmentAccounting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KCK_EquipmentAccounting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KCK_EquipmentAccounting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ARITHABORT OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET  MULTI_USER 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET QUERY_STORE = OFF
GO
USE [KCK_EquipmentAccounting]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 22.10.2023 15:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[ИТ-Код] [int] IDENTITY(100000,1) NOT NULL,
	[СерийныйНомер] [nvarchar](50) NOT NULL,
	[Тип] [nvarchar](50) NOT NULL,
	[Марка] [nvarchar](50) NOT NULL,
	[Состояние] [bit] NOT NULL,
 CONSTRAINT [PK_Оборудование] PRIMARY KEY CLUSTERED 
(
	[ИТ-Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 22.10.2023 15:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[Наименование] [nvarchar](50) NOT NULL,
	[ФИОНачальника] [nvarchar](50) NOT NULL,
	[Вместительность] [int] NOT NULL,
	[Местоположение] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Склад] PRIMARY KEY CLUSTERED 
(
	[Наименование] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СкладОборудование]    Script Date: 22.10.2023 15:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СкладОборудование](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[КодОборудования] [int] NOT NULL,
	[КодСклада] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_СкладОборудование] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 22.10.2023 15:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ТабельныйНомер] [int] IDENTITY(10000,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[НомерТелефона] [int] NULL,
	[Почта] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[ТабельныйНомер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СотрудникОборудование]    Script Date: 22.10.2023 15:48:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СотрудникОборудование](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[КодОборудования] [int] NOT NULL,
	[КодСотрудника] [int] NOT NULL,
 CONSTRAINT [PK_СотрудникОборудование] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[СкладОборудование]  WITH CHECK ADD  CONSTRAINT [FK_СкладОборудование_Оборудование] FOREIGN KEY([Код])
REFERENCES [dbo].[Оборудование] ([ИТ-Код])
GO
ALTER TABLE [dbo].[СкладОборудование] CHECK CONSTRAINT [FK_СкладОборудование_Оборудование]
GO
ALTER TABLE [dbo].[СкладОборудование]  WITH CHECK ADD  CONSTRAINT [FK_СкладОборудование_Склад] FOREIGN KEY([КодСклада])
REFERENCES [dbo].[Склад] ([Наименование])
GO
ALTER TABLE [dbo].[СкладОборудование] CHECK CONSTRAINT [FK_СкладОборудование_Склад]
GO
ALTER TABLE [dbo].[СотрудникОборудование]  WITH CHECK ADD  CONSTRAINT [FK_СотрудникОборудование_Оборудование] FOREIGN KEY([КодОборудования])
REFERENCES [dbo].[Оборудование] ([ИТ-Код])
GO
ALTER TABLE [dbo].[СотрудникОборудование] CHECK CONSTRAINT [FK_СотрудникОборудование_Оборудование]
GO
ALTER TABLE [dbo].[СотрудникОборудование]  WITH CHECK ADD  CONSTRAINT [FK_СотрудникОборудование_Сотрудник] FOREIGN KEY([КодСотрудника])
REFERENCES [dbo].[Сотрудник] ([ТабельныйНомер])
GO
ALTER TABLE [dbo].[СотрудникОборудование] CHECK CONSTRAINT [FK_СотрудникОборудование_Сотрудник]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [CK_Оборудование] CHECK  (([ИТ-Код]>=(100000)))
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [CK_Оборудование]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [CK_Сотрудник] CHECK  (([ТабельныйНомер]>=(10000)))
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [CK_Сотрудник]
GO
USE [master]
GO
ALTER DATABASE [KCK_EquipmentAccounting] SET  READ_WRITE 
GO
