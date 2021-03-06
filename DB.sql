USE [master]
GO
/****** Object:  Database [ИС1811_ГИБДД]    Script Date: 23.10.2020 13:47:06 ******/
CREATE DATABASE [ИС1811_ГИБДД]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ИС1811_ГИБДД', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ИС1811_ГИБДД.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ИС1811_ГИБДД_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ИС1811_ГИБДД_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ИС1811_ГИБДД] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ИС1811_ГИБДД].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ИС1811_ГИБДД] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET ARITHABORT OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET RECOVERY FULL 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET  MULTI_USER 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ИС1811_ГИБДД] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ИС1811_ГИБДД] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ИС1811_ГИБДД]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[Код] [varchar](6) NOT NULL,
	[Фамилия] [varchar](100) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NOT NULL,
	[Пол] [char](1) NOT NULL,
	[Телефон] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[product](
	[Наименование товара] [nvarchar](100) NOT NULL,
	[Главное изображение] [nvarchar](255) NOT NULL,
	[Производитель] [nvarchar](100) NOT NULL,
	[Активен?] [char](3) NOT NULL,
	[Цена] [decimal](10, 2) NULL,
	[Скидка_Код] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[Наименование товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Водители_Main]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Водители_Main](
	[Вод_GUID] [float] NOT NULL,
	[Вод_Имя] [nvarchar](255) NULL,
	[Вод_Отчество] [nvarchar](255) NULL,
	[Вод_Паспорт] [float] NULL,
	[Вод_АдресРегистрации] [nvarchar](255) NULL,
	[Вод_АдресПроживания] [nvarchar](255) NULL,
	[Вод_МестоРаботы] [nvarchar](255) NULL,
	[Вод_Должность] [nvarchar](255) NULL,
	[Вод_КонтактныйНомер] [nvarchar](255) NULL,
	[Вод_еМэйл] [nvarchar](255) NULL,
	[Вод_Фото] [nvarchar](255) NULL,
 CONSTRAINT [PK_Лист1$] PRIMARY KEY CLUSTERED 
(
	[Вод_GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Заказы](
	[Заказы_Номер] [int] NOT NULL,
	[Заказы_Дата] [date] NOT NULL,
	[Клиент_Код] [varchar](6) NOT NULL,
	[Услуги_ID] [int] NOT NULL,
	[Услуги_Количество] [float] NOT NULL,
	[Заказы_ДатаОкончания] [date] NULL,
	[Ответственный] [varchar](max) NOT NULL,
	[Описание] [text] NOT NULL,
	[Авто_ГосНомер] [nvarchar](50) NOT NULL,
	[Оплачено] [float] NOT NULL,
 CONSTRAINT [PK__Заказы__46ADD6F34A611735] PRIMARY KEY CLUSTERED 
(
	[Заказы_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[МоделиАвто]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[МоделиАвто](
	[Мод_Номер] [int] NOT NULL,
	[Мод_Марка] [nvarchar](50) NOT NULL,
	[Мод_Модель] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Мод_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Нарушения]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Нарушения](
	[Наруш_Номер] [int] NOT NULL,
	[Вод_GUID] [float] NOT NULL,
	[Авто_VIN] [int] NOT NULL,
	[Сотр_Номер] [int] NOT NULL,
	[Санкций_Номер] [int] NOT NULL,
	[Наруш_Дата] [date] NULL,
 CONSTRAINT [PK__Нарушени__C544B2FA2358FA46] PRIMARY KEY CLUSTERED 
(
	[Наруш_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Протокол]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Протокол](
	[Протокол_Номер] [int] NOT NULL,
	[Свид_Номер] [int] NOT NULL,
	[Вод_GUID] [float] NOT NULL,
 CONSTRAINT [PK__Протокол__9B3D313D097E6764] PRIMARY KEY CLUSTERED 
(
	[Протокол_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Санкции]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Санкции](
	[Санкций_Номер] [int] NOT NULL,
	[Санкций_Тип] [nvarchar](50) NOT NULL,
	[Санкций_РазмерШтрафа] [int] NOT NULL,
	[Санкций_СрокЗаключения] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Санкций_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Свидетели]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Свидетели](
	[Свид_Номер] [int] NOT NULL,
	[Свид_Фамилия] [nvarchar](50) NOT NULL,
	[Свид_Имя] [nvarchar](50) NOT NULL,
	[Свид_Отчество] [nvarchar](50) NOT NULL,
	[Свид_ДатаРождения] [date] NOT NULL,
	[Свид_Паспорт] [nvarchar](50) NOT NULL,
	[Свид_АдресРегистрации] [nvarchar](50) NOT NULL,
	[Свид_АдресПроживания] [nvarchar](50) NOT NULL,
	[Свид_еМэйл] [nvarchar](50) NOT NULL,
	[Свид_КонтактныйНомер] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Свид_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Скидка]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Скидка](
	[Скидка_Код] [int] NOT NULL,
	[Скидка_Вид] [nvarchar](50) NOT NULL,
	[Скидка_Размер] [float] NOT NULL,
 CONSTRAINT [PK__Скидка__E410B55DBA9EBBF2] PRIMARY KEY CLUSTERED 
(
	[Скидка_Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Сотр_Номер] [int] NOT NULL,
	[Сотр_Фамилия] [nvarchar](50) NOT NULL,
	[Сотр_Имя] [nvarchar](50) NOT NULL,
	[Сотр_Отчество] [nvarchar](50) NOT NULL,
	[Сотр_Должность] [nvarchar](50) NOT NULL,
	[Сотр_ДатаРождения] [date] NOT NULL,
	[Сотр_Паспорт] [nvarchar](50) NOT NULL,
	[Сотр_КонтакнтныйНомер] [nvarchar](50) NOT NULL,
	[Сотр_Логин] [nvarchar](50) NOT NULL,
	[Сотр_Пароль] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Сотр_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Транспорт]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Транспорт](
	[Авто_VIN] [nvarchar](50) NOT NULL,
	[Вод_GUID] [float] NOT NULL,
	[Мод_Номер] [int] NOT NULL,
	[Авто_КатегорияТС] [nvarchar](3) NOT NULL,
	[Авто_ТипТранспорта] [nvarchar](50) NOT NULL,
	[Авто_ТипДвигателя] [nvarchar](50) NOT NULL,
	[Авто_ТипПривода] [nvarchar](50) NOT NULL,
	[Авто_Вес] [real] NOT NULL,
	[Авто_Цвет] [int] NOT NULL,
	[Авто_ГодВыпуска] [date] NOT NULL,
 CONSTRAINT [PK__Транспор__67BF24E7E52D647E] PRIMARY KEY CLUSTERED 
(
	[Авто_VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Услуги](
	[Услуги_ID] [int] NOT NULL,
	[Услуги_Название] [varchar](69) NOT NULL,
	[Услуги_Стоимость] [decimal](10, 2) NOT NULL,
	[Услуги_СрокВыполнения] [float] NOT NULL,
 CONSTRAINT [PK__Услуги__DA1562888703AC1D] PRIMARY KEY CLUSTERED 
(
	[Услуги_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Цвета]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Цвета](
	[Цвет_Номер] [int] NOT NULL,
	[Цвет_RGB] [nvarchar](6) NOT NULL,
	[Цвет_Название] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Цвет_Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Скидка] FOREIGN KEY([Скидка_Код])
REFERENCES [dbo].[Скидка] ([Скидка_Код])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Скидка]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Client] FOREIGN KEY([Клиент_Код])
REFERENCES [dbo].[Client] ([Код])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Client]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Услуги] FOREIGN KEY([Услуги_ID])
REFERENCES [dbo].[Услуги] ([Услуги_ID])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Услуги]
GO
ALTER TABLE [dbo].[Нарушения]  WITH CHECK ADD  CONSTRAINT [FK_Нарушения_Водители_Main] FOREIGN KEY([Вод_GUID])
REFERENCES [dbo].[Водители_Main] ([Вод_GUID])
GO
ALTER TABLE [dbo].[Нарушения] CHECK CONSTRAINT [FK_Нарушения_Водители_Main]
GO
ALTER TABLE [dbo].[Нарушения]  WITH CHECK ADD  CONSTRAINT [FK_Нарушения_Санкции] FOREIGN KEY([Санкций_Номер])
REFERENCES [dbo].[Санкции] ([Санкций_Номер])
GO
ALTER TABLE [dbo].[Нарушения] CHECK CONSTRAINT [FK_Нарушения_Санкции]
GO
ALTER TABLE [dbo].[Нарушения]  WITH CHECK ADD  CONSTRAINT [FK_Нарушения_Сотрудники] FOREIGN KEY([Сотр_Номер])
REFERENCES [dbo].[Сотрудники] ([Сотр_Номер])
GO
ALTER TABLE [dbo].[Нарушения] CHECK CONSTRAINT [FK_Нарушения_Сотрудники]
GO
ALTER TABLE [dbo].[Протокол]  WITH CHECK ADD  CONSTRAINT [FK_Протокол_Водители_Main] FOREIGN KEY([Вод_GUID])
REFERENCES [dbo].[Водители_Main] ([Вод_GUID])
GO
ALTER TABLE [dbo].[Протокол] CHECK CONSTRAINT [FK_Протокол_Водители_Main]
GO
ALTER TABLE [dbo].[Протокол]  WITH CHECK ADD  CONSTRAINT [FK_Протокол_Свидетели] FOREIGN KEY([Свид_Номер])
REFERENCES [dbo].[Свидетели] ([Свид_Номер])
GO
ALTER TABLE [dbo].[Протокол] CHECK CONSTRAINT [FK_Протокол_Свидетели]
GO
ALTER TABLE [dbo].[Транспорт]  WITH CHECK ADD  CONSTRAINT [FK_Транспорт_Водители_Main] FOREIGN KEY([Вод_GUID])
REFERENCES [dbo].[Водители_Main] ([Вод_GUID])
GO
ALTER TABLE [dbo].[Транспорт] CHECK CONSTRAINT [FK_Транспорт_Водители_Main]
GO
ALTER TABLE [dbo].[Транспорт]  WITH CHECK ADD  CONSTRAINT [FK_Транспорт_МоделиАвто] FOREIGN KEY([Мод_Номер])
REFERENCES [dbo].[МоделиАвто] ([Мод_Номер])
GO
ALTER TABLE [dbo].[Транспорт] CHECK CONSTRAINT [FK_Транспорт_МоделиАвто]
GO
ALTER TABLE [dbo].[Транспорт]  WITH CHECK ADD  CONSTRAINT [FK_Транспорт_Цвета] FOREIGN KEY([Авто_Цвет])
REFERENCES [dbo].[Цвета] ([Цвет_Номер])
GO
ALTER TABLE [dbo].[Транспорт] CHECK CONSTRAINT [FK_Транспорт_Цвета]
GO
/****** Object:  StoredProcedure [dbo].[remote_viewTables]    Script Date: 23.10.2020 13:47:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[remote_viewTables] @TABLE_NAME NVARCHAR(50)
AS
	SELECT 		DATA_TYPE AS 'Тип данных',
			Cols.COLUMN_NAME AS 'Название столбца',
			Keys.COLUMN_NAME AS 'Первичный ключ'
	FROM 		[10.0.10.250\SQLEXPRESS].[Avto_servis].INFORMATION_SCHEMA.COLUMNS Cols
				LEFT JOIN
				[10.0.10.250\SQLEXPRESS].[Avto_servis].INFORMATION_SCHEMA.KEY_COLUMN_USAGE Keys 
	ON 			Cols.COLUMN_NAME = Keys.COLUMN_NAME
	WHERE 		Cols.TABLE_NAME = @TABLE_NAME;

GO
USE [master]
GO
ALTER DATABASE [ИС1811_ГИБДД] SET  READ_WRITE 
GO
