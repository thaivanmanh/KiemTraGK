USE [master]
GO
/****** Object:  Database [ManageProduct]    Script Date: 19/06/2020 7:10:14 PM ******/
CREATE DATABASE [ManageProduct]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManageProduct', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ManageProduct.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManageProduct_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ManageProduct_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManageProduct] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManageProduct].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManageProduct] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManageProduct] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManageProduct] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManageProduct] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManageProduct] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManageProduct] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManageProduct] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManageProduct] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManageProduct] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManageProduct] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManageProduct] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManageProduct] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManageProduct] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManageProduct] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManageProduct] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManageProduct] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManageProduct] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManageProduct] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManageProduct] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManageProduct] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManageProduct] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManageProduct] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManageProduct] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ManageProduct] SET  MULTI_USER 
GO
ALTER DATABASE [ManageProduct] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManageProduct] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManageProduct] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManageProduct] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ManageProduct] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ManageProduct]
GO
/****** Object:  User [phuccog]    Script Date: 19/06/2020 7:10:14 PM ******/
CREATE USER [phuccog] FOR LOGIN [phuccog] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/06/2020 7:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/06/2020 7:10:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[sort_name] [nvarchar](100) NULL,
	[note] [nvarchar](100) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [note]) VALUES (1, N'Nón', N'Sale all nón')
INSERT [dbo].[Category] ([id], [name], [note]) VALUES (2, N'Dép', N'Dép da chai')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [code], [name], [sort_name], [note], [category_id]) VALUES (1, N'VZ0025', N'Nón valie', N'asc', N'Nón xịn xò', 1)
INSERT [dbo].[Product] ([id], [code], [name], [sort_name], [note], [category_id]) VALUES (2, N'VZ00023', N'Giày xịn xò', N'asc', N'xịn sò', 2)
INSERT [dbo].[Product] ([id], [code], [name], [sort_name], [note], [category_id]) VALUES (3, N'89091', N'Nón balala', N'asc', N'Nón đi chơi', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [ManageProduct] SET  READ_WRITE 
GO
