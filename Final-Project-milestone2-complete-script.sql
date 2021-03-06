USE [master]
GO
/****** Object:  Database [StrongFoundationsDaycare]    Script Date: 3/2/2019 10:55:08 AM ******/
CREATE DATABASE [StrongFoundationsDaycare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StrongFoundationsDaycare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StrongFoundationsDaycare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StrongFoundationsDaycare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StrongFoundationsDaycare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StrongFoundationsDaycare] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StrongFoundationsDaycare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StrongFoundationsDaycare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET ARITHABORT OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET RECOVERY FULL 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET  MULTI_USER 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StrongFoundationsDaycare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StrongFoundationsDaycare] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StrongFoundationsDaycare', N'ON'
GO
ALTER DATABASE [StrongFoundationsDaycare] SET QUERY_STORE = OFF
GO
USE [StrongFoundationsDaycare]
GO
/****** Object:  Table [dbo].[Classroom]    Script Date: 3/2/2019 10:55:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classroom](
	[ClassID] [int] NOT NULL,
	[ClassRoom] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassroomSupplies]    Script Date: 3/2/2019 10:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassroomSupplies](
	[ClassID] [int] NOT NULL,
	[DateIncurred] [date] NOT NULL,
	[ProductCharge] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[DateIncurred] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 3/2/2019 10:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[CustodialGuardian] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guardian]    Script Date: 3/2/2019 10:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardian](
	[ParentID] [int] NOT NULL,
	[GuardianName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 3/2/2019 10:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[TeacherID] [int] NOT NULL,
	[ReviewDate] [date] NOT NULL,
	[Review] [varchar](15) NULL,
	[ContinuedService] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC,
	[ReviewDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/2/2019 10:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] NOT NULL,
	[FName] [varchar](15) NOT NULL,
	[LName] [varchar](15) NOT NULL,
	[DOB] [date] NULL,
	[TeacherID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 3/2/2019 10:55:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[ClassID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StrongFoundationsDaycare] SET  READ_WRITE 
GO
