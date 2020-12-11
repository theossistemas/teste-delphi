USE [master]
GO
/****** Object:  Database [theos]    Script Date: 11/12/2020 18:49:42 ******/
CREATE DATABASE [theos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'theos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\theos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'theos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\theos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [theos] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [theos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [theos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [theos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [theos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [theos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [theos] SET ARITHABORT OFF 
GO
ALTER DATABASE [theos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [theos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [theos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [theos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [theos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [theos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [theos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [theos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [theos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [theos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [theos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [theos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [theos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [theos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [theos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [theos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [theos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [theos] SET RECOVERY FULL 
GO
ALTER DATABASE [theos] SET  MULTI_USER 
GO
ALTER DATABASE [theos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [theos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [theos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [theos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [theos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'theos', N'ON'
GO
ALTER DATABASE [theos] SET QUERY_STORE = OFF
GO
USE [theos]
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
USE [theos]
GO
/****** Object:  Table [dbo].[tbldependente]    Script Date: 11/12/2020 18:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbldependente](
	[cpf] [varchar](11) NULL,
	[nome] [varchar](40) NULL,
	[iscalculoinss] [bit] NOT NULL,
	[iscalculoir] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblfuncionario]    Script Date: 11/12/2020 18:49:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblfuncionario](
	[cpf] [varchar](11) NULL,
	[nome] [varchar](40) NULL,
	[salario] [float] NULL,
	[valorinss] [float] NULL,
	[valorir] [float] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [theos] SET  READ_WRITE 
GO
