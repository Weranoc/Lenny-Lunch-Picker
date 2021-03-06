USE [master]
GO
/****** Object:  Database [LennyLunchPicker]    Script Date: 2020-01-09 15:22:32 ******/
CREATE DATABASE [LennyLunchPicker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LennyLunchPicker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LennyLunchPicker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LennyLunchPicker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LennyLunchPicker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LennyLunchPicker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LennyLunchPicker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LennyLunchPicker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET ARITHABORT OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LennyLunchPicker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LennyLunchPicker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LennyLunchPicker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LennyLunchPicker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET RECOVERY FULL 
GO
ALTER DATABASE [LennyLunchPicker] SET  MULTI_USER 
GO
ALTER DATABASE [LennyLunchPicker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LennyLunchPicker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LennyLunchPicker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LennyLunchPicker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LennyLunchPicker] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LennyLunchPicker', N'ON'
GO
ALTER DATABASE [LennyLunchPicker] SET QUERY_STORE = OFF
GO
USE [LennyLunchPicker]
GO
/****** Object:  Table [dbo].[accessToken]    Script Date: 2020-01-09 15:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessToken](
	[tokenId] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](255) NOT NULL,
	[expires] [datetime] NOT NULL,
	[created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favoriteRestaurant]    Script Date: 2020-01-09 15:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoriteRestaurant](
	[restaurantId] [int] IDENTITY(1,1) NOT NULL,
	[restaurantName] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[webAddress] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[googleMapsApi]    Script Date: 2020-01-09 15:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[googleMapsApi](
	[mapApiId] [int] IDENTITY(1,1) NOT NULL,
	[mapKey] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mapApiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2020-01-09 15:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[restaurantId] [int] NULL,
	[userName] [varchar](255) NOT NULL,
	[fName] [varchar](255) NOT NULL,
	[lName] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[joinDate] [datetime] NOT NULL,
	[address] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([restaurantId])
REFERENCES [dbo].[favoriteRestaurant] ([restaurantId])
GO
USE [master]
GO
ALTER DATABASE [LennyLunchPicker] SET  READ_WRITE 
GO
