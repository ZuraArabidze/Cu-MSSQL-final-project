USE [master]
GO
/****** Object:  Database [TestFootball]    Script Date: 6/25/2023 11:12:12 PM ******/
CREATE DATABASE [TestFootball]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestFootball', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TestFootball.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestFootball_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TestFootball_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestFootball] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestFootball].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestFootball] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestFootball] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestFootball] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestFootball] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestFootball] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestFootball] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TestFootball] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestFootball] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestFootball] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestFootball] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestFootball] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestFootball] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestFootball] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestFootball] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestFootball] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestFootball] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestFootball] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestFootball] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestFootball] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestFootball] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestFootball] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestFootball] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestFootball] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestFootball] SET  MULTI_USER 
GO
ALTER DATABASE [TestFootball] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestFootball] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestFootball] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestFootball] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestFootball] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestFootball] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestFootball] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestFootball] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestFootball]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[GamesID] [int] IDENTITY(1,1) NOT NULL,
	[FirstTeamId] [int] NOT NULL,
	[SecondTeamId] [int] NOT NULL,
	[FirstTeamScore] [int] NOT NULL,
	[SecondTeamScore] [int] NOT NULL,
	[StadiumId] [int] NOT NULL,
	[RefereeId] [int] NOT NULL,
	[Gamedate] [date] NOT NULL,
 CONSTRAINT [PK__Games__B4B95DFD64736B00] PRIMARY KEY CLUSTERED 
(
	[GamesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Phone] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonTypes]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonTypes](
	[PersonTypeId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PersonTypes] PRIMARY KEY CLUSTERED 
(
	[PersonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referees]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referees](
	[RefereeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[Salary] [int] NOT NULL,
 CONSTRAINT [PK_Referees] PRIMARY KEY CLUSTERED 
(
	[RefereeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadiums]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadiums](
	[StadiumId] [int] IDENTITY(1,1) NOT NULL,
	[StadiumName] [nchar](20) NOT NULL,
	[MaxAttendance] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Stadiums] PRIMARY KEY CLUSTERED 
(
	[StadiumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamPersons]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamPersons](
	[TeamPersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[PersonTypeId] [int] NOT NULL,
 CONSTRAINT [PK_TeamPlayers] PRIMARY KEY CLUSTERED 
(
	[TeamPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamId] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nchar](20) NOT NULL,
	[ClubOwner] [nchar](20) NOT NULL,
	[StadiumId] [int] NOT NULL,
	[EstablishmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (1, N'Germany             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (2, N'England             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (3, N'Spain               ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (4, N'France              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (5, N'Portugal            ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (6, N'Italy               ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (7, N'Denmark             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (8, N'Netherlands         ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (9, N'Croatia             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (10, N'Austria             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (11, N'Norway              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (12, N'Switzerland         ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (13, N'Poland              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (14, N'Sweden              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (15, N'Belgium             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (16, N'Georgia             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (17, N'Brazil              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (18, N'Argentina           ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (19, N'Uruguay             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (20, N'Chile               ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (21, N'USA                 ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (22, N'Canada              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (23, N'Senegal             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (24, N'Egypt               ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (25, N'Morocco             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (26, N'Ghana               ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (27, N'Cameroon            ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (28, N'South Korea         ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (29, N'Ukraine             ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (30, N'Israel              ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (31, N'Azerbaijan          ')
INSERT [dbo].[Countries] ([CountryId], [Name]) VALUES (32, N'Armenia             ')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (2, 16, 8, 7, 6, 20, 5, CAST(N'2017-09-10' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (3, 11, 16, 7, 5, 23, 4, CAST(N'2020-07-17' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (4, 1, 13, 3, 6, 15, 2, CAST(N'2015-12-18' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (5, 12, 14, 5, 3, 14, 10, CAST(N'2018-03-03' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (6, 9, 4, 5, 1, 23, 12, CAST(N'2012-12-08' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (7, 12, 13, 3, 5, 1, 15, CAST(N'2013-10-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (8, 2, 12, 1, 2, 19, 2, CAST(N'2017-08-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (9, 14, 1, 1, 5, 19, 2, CAST(N'2020-09-15' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (10, 15, 10, 5, 3, 4, 7, CAST(N'2019-05-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (11, 8, 6, 3, 7, 17, 4, CAST(N'2018-01-15' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (12, 7, 14, 7, 7, 18, 1, CAST(N'2017-08-06' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (13, 16, 1, 1, 2, 14, 3, CAST(N'2016-04-18' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (14, 16, 2, 4, 3, 3, 2, CAST(N'2019-07-18' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (15, 14, 11, 3, 2, 2, 10, CAST(N'2017-04-19' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (16, 8, 11, 4, 4, 23, 11, CAST(N'2010-09-16' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (17, 6, 1, 4, 1, 23, 1, CAST(N'2011-05-18' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (18, 4, 2, 6, 4, 18, 2, CAST(N'2012-06-11' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (19, 10, 14, 3, 7, 3, 5, CAST(N'2013-12-25' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (20, 11, 15, 3, 6, 22, 15, CAST(N'2022-10-23' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (21, 12, 11, 2, 7, 17, 13, CAST(N'2023-04-13' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (22, 4, 14, 3, 6, 1, 5, CAST(N'2021-07-29' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (23, 6, 5, 5, 3, 13, 8, CAST(N'2016-10-27' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (24, 2, 9, 3, 4, 20, 15, CAST(N'2015-03-17' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (25, 14, 11, 5, 5, 7, 4, CAST(N'2023-02-16' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (27, 4, 10, 7, 4, 16, 5, CAST(N'2023-01-14' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (28, 5, 14, 5, 5, 24, 1, CAST(N'2020-01-19' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (29, 14, 10, 1, 5, 5, 3, CAST(N'2014-04-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (30, 13, 9, 4, 2, 13, 13, CAST(N'2010-08-07' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (31, 12, 14, 5, 4, 6, 11, CAST(N'2016-01-23' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (32, 14, 10, 4, 4, 20, 10, CAST(N'2017-06-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (33, 4, 7, 1, 7, 19, 2, CAST(N'2013-02-05' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (34, 13, 12, 7, 5, 13, 14, CAST(N'2010-02-05' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (35, 10, 2, 2, 1, 4, 12, CAST(N'2011-04-07' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (36, 4, 5, 1, 7, 20, 10, CAST(N'2014-07-19' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (37, 10, 15, 3, 6, 15, 15, CAST(N'2012-08-14' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (38, 14, 8, 5, 2, 13, 10, CAST(N'2010-11-07' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (39, 5, 15, 2, 2, 22, 5, CAST(N'2012-09-23' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (40, 2, 5, 6, 4, 15, 12, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (41, 15, 9, 6, 2, 18, 11, CAST(N'2018-09-28' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (42, 1, 2, 6, 5, 24, 3, CAST(N'2020-09-30' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (43, 7, 15, 4, 6, 24, 11, CAST(N'2012-06-11' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (44, 13, 11, 4, 3, 22, 7, CAST(N'2015-09-17' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (45, 6, 12, 4, 2, 19, 10, CAST(N'2012-01-07' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (46, 1, 5, 6, 5, 23, 7, CAST(N'2015-08-17' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (47, 11, 15, 6, 4, 12, 9, CAST(N'2018-03-03' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (48, 15, 2, 2, 1, 6, 10, CAST(N'2010-07-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (49, 15, 5, 2, 3, 2, 2, CAST(N'2023-04-19' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (50, 11, 14, 7, 3, 7, 7, CAST(N'2022-09-18' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (51, 15, 6, 3, 3, 24, 2, CAST(N'2019-10-09' AS Date))
INSERT [dbo].[Games] ([GamesID], [FirstTeamId], [SecondTeamId], [FirstTeamScore], [SecondTeamScore], [StadiumId], [RefereeId], [Gamedate]) VALUES (52, 11, 7, 3, 3, 22, 14, CAST(N'2017-04-08' AS Date))
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (1, N'Jack                ', N'Powell              ', CAST(N'1987-09-17' AS Date), 2, 567839033)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (2, N'Benedict            ', N'Park                ', CAST(N'1976-09-27' AS Date), 9, 542678263)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (3, N'Ralph               ', N'Walker              ', CAST(N'1988-03-02' AS Date), 12, 554908726)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (4, N'Wesley              ', N'Soli                ', CAST(N'1967-09-24' AS Date), 22, 598453241)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (5, N'Kareem              ', N'Holden              ', CAST(N'1995-01-20' AS Date), 23, 568923474)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (6, N'Joshua              ', N'Flynn               ', CAST(N'2001-12-17' AS Date), 5, 578124571)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (7, N'Francis             ', N'Lynn                ', CAST(N'2003-03-08' AS Date), 4, 567905431)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (9, N'Roth                ', N'Mcgee               ', CAST(N'1986-10-24' AS Date), 1, 555812367)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (10, N'Oliver              ', N'Good                ', CAST(N'1992-08-06' AS Date), 8, 551786524)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (11, N'Octavius            ', N'House               ', CAST(N'1993-09-11' AS Date), 3, 593738861)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (12, N'Fuller              ', N'Rodriguez           ', CAST(N'1992-09-28' AS Date), 17, 598676417)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (13, N'Amal                ', N'Goff                ', CAST(N'1989-10-29' AS Date), 18, 555168725)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (14, N'Macon               ', N'Bates               ', CAST(N'1987-12-01' AS Date), 7, 593876543)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (15, N'Oren                ', N'Hobbs               ', CAST(N'1979-01-20' AS Date), 25, 558126783)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (16, N'Harper              ', N'Noble               ', CAST(N'1974-12-17' AS Date), 13, 567892345)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (18, N'Xvicha              ', N'Kamkamidze          ', CAST(N'1967-11-02' AS Date), 16, 557897541)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (19, N'Ethan               ', N'Rivas               ', CAST(N'1982-11-18' AS Date), 12, 557908073)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (20, N'Richard             ', N'Sims                ', CAST(N'1997-05-09' AS Date), 1, 567090803)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (21, N'Merrill             ', N'Fox                 ', CAST(N'1998-03-07' AS Date), 2, 558376752)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (22, N'Sawyer              ', N'Warner              ', CAST(N'1997-09-18' AS Date), 3, 578972435)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (23, N'Colton              ', N'Sellers             ', CAST(N'1989-04-19' AS Date), 4, 568745642)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (24, N'Salvador            ', N'Holcomb             ', CAST(N'1987-10-18' AS Date), 5, 559765134)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (25, N'Henry               ', N'Mccarthy            ', CAST(N'1992-12-09' AS Date), 6, 555786524)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (26, N'Flynn               ', N'Hinton              ', CAST(N'1998-06-15' AS Date), 7, 557283567)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (27, N'Aquila              ', N'Dunn                ', CAST(N'1999-09-13' AS Date), 8, 556908763)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (28, N'Alexander           ', N'Figueroa            ', CAST(N'1982-11-18' AS Date), 9, 558237864)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (29, N'Orlando             ', N'George              ', CAST(N'1974-12-19' AS Date), 10, 557897653)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (30, N'Hunter              ', N'Parsons             ', CAST(N'1967-09-26' AS Date), 11, 558987245)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (32, N'Garth               ', N'Macias              ', CAST(N'1969-03-19' AS Date), 12, 558470983)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (33, N'Cade                ', N'Mckinney            ', CAST(N'1984-09-27' AS Date), 13, 555431287)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (34, N'Benjamin            ', N'Gibson              ', CAST(N'1988-12-20' AS Date), 14, 558973561)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (35, N'Fritz               ', N'Greene              ', CAST(N'1999-09-13' AS Date), 15, 551340109)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (36, N'Solomon             ', N'Contreras           ', CAST(N'1993-02-14' AS Date), 17, 568900101)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (37, N'Ramaz               ', N'Svanadze            ', CAST(N'1974-12-21' AS Date), 16, 555090807)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (38, N'Nikoloz             ', N'Gagnidze            ', CAST(N'1996-07-19' AS Date), 16, 555876514)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (39, N'David               ', N'Warren              ', CAST(N'1983-12-28' AS Date), 18, 558546327)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (40, N'Elijah              ', N'Stanley             ', CAST(N'1998-10-14' AS Date), 19, 556908273)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (42, N'Davis               ', N'Crawford            ', CAST(N'1999-04-10' AS Date), 20, 567897236)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (43, N'Plato               ', N'Cook                ', CAST(N'1992-09-23' AS Date), 21, 555678265)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (44, N'Odysseus            ', N'Floyd               ', CAST(N'1995-05-07' AS Date), 22, 558908761)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (45, N'Simon               ', N'Ortega              ', CAST(N'1987-12-23' AS Date), 23, 558971534)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (46, N'Blake               ', N'Kirk                ', CAST(N'1983-08-09' AS Date), 24, 567837524)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (47, N'George              ', N'Walton              ', CAST(N'1971-10-15' AS Date), 25, 555676243)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (48, N'Baxter              ', N'Pruitt              ', CAST(N'1976-12-17' AS Date), 26, 557287364)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (49, N'Hiram               ', N'Briggs              ', CAST(N'1978-07-19' AS Date), 27, 567873652)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (50, N'Kenyon              ', N'Gaines              ', CAST(N'1976-10-09' AS Date), 30, 557871452)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (51, N'Howard              ', N'Norris              ', CAST(N'1998-09-09' AS Date), 29, 557918276)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (52, N'Kareem              ', N'Montgomery          ', CAST(N'1999-10-02' AS Date), 28, 555879372)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (53, N'Nikoloz             ', N'Panjikidze          ', CAST(N'1998-03-09' AS Date), 16, 557234567)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone]) VALUES (54, N'George              ', N'Gautama             ', CAST(N'1978-09-16' AS Date), 27, 555789632)
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (1, N'Player')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (3, N'Assistant Manager')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (4, N'Physiotherapist')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (5, N'Chef / Nutritionist')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (6, N'Conditioning Coach')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (7, N'Fitness Coach')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (8, N'Goalkeeping Coach')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (9, N'Masseur
')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (10, N'Scout')
INSERT [dbo].[PersonTypes] ([PersonTypeId], [Name]) VALUES (11, N'Kit Manager')
GO
SET IDENTITY_INSERT [dbo].[Referees] ON 

INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (1, N'Stuart              ', N' Attwell            ', CAST(N'1987-09-08' AS Date), 2, 568375465, 45000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (2, N'Peter               ', N'Bankes              ', CAST(N'1983-03-16' AS Date), 4, 593457892, 48000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (3, N'Darren              ', N'Bond                ', CAST(N'1978-03-28' AS Date), 7, 551908752, 52500)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (4, N'Thomas              ', N'Bramall             ', CAST(N'1991-10-18' AS Date), 8, 567892435, 51000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (5, N'John                ', N'Brooks              ', CAST(N'1994-12-15' AS Date), 14, 577234581, 49000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (7, N'Anri                ', N'Soghulashvili       ', CAST(N'1995-06-18' AS Date), 16, 599253671, 55000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (8, N'Anthony             ', N'Taylor              ', CAST(N'1986-12-09' AS Date), 2, 568098174, 60000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (9, N'Robert              ', N'Jones               ', CAST(N'1994-07-12' AS Date), 1, 555175673, 43000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (10, N'Craig               ', N'Pawson              ', CAST(N'1987-10-10' AS Date), 5, 571829402, 46000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (11, N'Michael             ', N'Salisbury           ', CAST(N'1996-03-19' AS Date), 3, 567894135, 48500)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (12, N'Andre               ', N'Marriner            ', CAST(N'1992-08-16' AS Date), 7, 576980174, 49400)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (13, N'Paul                ', N'Tierney             ', CAST(N'1991-10-15' AS Date), 9, 578905431, 51000)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (14, N'Mateo               ', N'Laos                ', CAST(N'1989-07-27' AS Date), 3, 578736519, 53500)
INSERT [dbo].[Referees] ([RefereeId], [FirstName], [LastName], [DateOfBirth], [CountryId], [Phone], [Salary]) VALUES (15, N'Saimon              ', N'Oliver              ', CAST(N'1982-12-18' AS Date), 17, 587933970, 52000)
SET IDENTITY_INSERT [dbo].[Referees] OFF
GO
SET IDENTITY_INSERT [dbo].[Stadiums] ON 

INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (1, N'Santiago Bernabeu   ', 100000, 3)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (2, N'Camp Nou            ', 80000, 3)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (3, N'Old Trafford        ', 120000, 2)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (4, N'Allianz Arena       ', 85000, 1)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (5, N'Princes Park        ', 70000, 4)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (6, N'Estadio do Dragao   ', 65000, 5)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (7, N'San Siro            ', 90000, 6)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (12, N'Diego  Maradona     ', 87000, 6)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (13, N'Allianz Stadum      ', 98000, 6)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (14, N'Johan Cruyff Arena  ', 76000, 8)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (15, N'Parken              ', 58000, 7)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (16, N'Stadion Poljud      ', 60000, 9)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (17, N'Ernst Happel Stadum ', 78000, 10)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (18, N'Dinamo Arena        ', 55000, 16)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (19, N'Maracana Stadium    ', 110000, 17)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (20, N'Mario Alberto Kempes', 84000, 18)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (22, N'Etihad Stadium      ', 90000, 2)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (23, N'Stanford Bridge     ', 85000, 2)
INSERT [dbo].[Stadiums] ([StadiumId], [StadiumName], [MaxAttendance], [CountryId]) VALUES (24, N'Adjarabet Arena     ', 20000, 16)
SET IDENTITY_INSERT [dbo].[Stadiums] OFF
GO
SET IDENTITY_INSERT [dbo].[TeamPersons] ON 

INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (1, 1, 2, CAST(N'2021-05-17' AS Date), NULL, 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (3, 12, 1, CAST(N'2021-07-12' AS Date), CAST(N'2022-12-18' AS Date), 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (4, 13, 7, CAST(N'2019-12-17' AS Date), NULL, 5)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (5, 23, 5, CAST(N'2017-08-10' AS Date), CAST(N'2021-09-12' AS Date), 6)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (6, 2, 2, CAST(N'2018-11-12' AS Date), NULL, 2)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (7, 33, 12, CAST(N'2019-03-19' AS Date), NULL, 3)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (9, 22, 11, CAST(N'2016-12-10' AS Date), CAST(N'2020-08-17' AS Date), 4)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (10, 28, 13, CAST(N'2018-10-20' AS Date), CAST(N'2022-12-10' AS Date), 3)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (11, 5, 10, CAST(N'2015-04-29' AS Date), CAST(N'2019-08-17' AS Date), 6)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (12, 3, 2, CAST(N'2022-02-09' AS Date), NULL, 9)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (13, 4, 4, CAST(N'2021-02-12' AS Date), NULL, 11)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (14, 6, 4, CAST(N'2018-10-23' AS Date), NULL, 10)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (16, 11, 6, CAST(N'2019-01-09' AS Date), CAST(N'2021-12-02' AS Date), 7)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (18, 15, 15, CAST(N'2015-05-09' AS Date), CAST(N'2019-08-09' AS Date), 8)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (19, 7, 9, CAST(N'2018-04-09' AS Date), NULL, 5)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (22, 9, 8, CAST(N'2014-09-21' AS Date), CAST(N'2019-09-02' AS Date), 7)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (23, 10, 6, CAST(N'2019-10-02' AS Date), NULL, 3)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (25, 14, 4, CAST(N'2013-10-17' AS Date), CAST(N'2017-02-18' AS Date), 2)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (26, 16, 1, CAST(N'2019-11-12' AS Date), NULL, 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (29, 18, 11, CAST(N'2020-05-06' AS Date), NULL, 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (30, 19, 12, CAST(N'2013-02-27' AS Date), CAST(N'2019-05-09' AS Date), 2)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (32, 20, 5, CAST(N'2019-08-21' AS Date), NULL, 11)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (33, 21, 12, CAST(N'2019-07-01' AS Date), NULL, 10)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (34, 24, 13, CAST(N'2018-02-21' AS Date), CAST(N'2022-05-09' AS Date), 5)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (35, 25, 11, CAST(N'2019-02-07' AS Date), NULL, 4)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (36, 26, 4, CAST(N'2017-10-21' AS Date), CAST(N'2021-06-19' AS Date), 7)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (37, 27, 5, CAST(N'2015-09-18' AS Date), CAST(N'2020-09-16' AS Date), 6)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (38, 29, 10, CAST(N'2020-10-06' AS Date), NULL, 5)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (39, 30, 11, CAST(N'2021-09-02' AS Date), NULL, 4)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (41, 32, 12, CAST(N'2015-01-02' AS Date), CAST(N'2019-09-08' AS Date), 3)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (42, 40, 13, CAST(N'2017-04-17' AS Date), CAST(N'2020-08-18' AS Date), 2)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (43, 39, 14, CAST(N'2020-12-15' AS Date), NULL, 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (44, 38, 15, CAST(N'2021-05-19' AS Date), NULL, 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (45, 37, 1, CAST(N'2022-03-15' AS Date), NULL, 1)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (46, 36, 2, CAST(N'2017-01-17' AS Date), CAST(N'2020-09-09' AS Date), 4)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (47, 35, 4, CAST(N'2015-10-14' AS Date), CAST(N'2018-09-05' AS Date), 5)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (48, 34, 14, CAST(N'2020-12-19' AS Date), NULL, 8)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (50, 42, 5, CAST(N'2018-09-24' AS Date), CAST(N'2022-12-13' AS Date), 10)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (51, 43, 8, CAST(N'2015-07-09' AS Date), CAST(N'2018-04-05' AS Date), 11)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (52, 44, 7, CAST(N'2018-09-16' AS Date), NULL, 11)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (53, 45, 9, CAST(N'2015-10-18' AS Date), CAST(N'2021-03-07' AS Date), 5)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (55, 46, 2, CAST(N'2019-07-10' AS Date), NULL, 3)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (56, 47, 10, CAST(N'2018-10-04' AS Date), NULL, 4)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (57, 48, 15, CAST(N'2019-03-29' AS Date), NULL, 6)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (58, 49, 14, CAST(N'2018-12-08' AS Date), CAST(N'2022-03-10' AS Date), 8)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (59, 50, 8, CAST(N'2015-10-18' AS Date), CAST(N'2019-10-27' AS Date), 7)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (60, 53, 7, CAST(N'2018-09-17' AS Date), NULL, 4)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (61, 52, 8, CAST(N'2019-10-17' AS Date), NULL, 10)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (62, 54, 10, CAST(N'2019-04-19' AS Date), NULL, 11)
INSERT [dbo].[TeamPersons] ([TeamPersonId], [PersonId], [TeamId], [StartDate], [EndDate], [PersonTypeId]) VALUES (63, 51, 13, CAST(N'2016-01-19' AS Date), CAST(N'2019-10-16' AS Date), 2)
SET IDENTITY_INSERT [dbo].[TeamPersons] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (1, N'Real Madrid         ', N'Florentino Perez    ', 1, CAST(N'1947-12-14' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (2, N'Barcelona           ', N'Joan Laporta        ', 2, CAST(N'1957-10-24' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (4, N'Napoli              ', N'Aurelio Laurentiis  ', 12, CAST(N'1983-02-16' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (5, N'AC Milan            ', N'Paolo Scaroni       ', 7, CAST(N'1950-08-17' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (6, N'Inter Milan         ', N'Steven Zhang        ', 7, CAST(N'1950-08-17' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (7, N'Manchester United   ', N'Richard Arnold      ', 3, CAST(N'1943-09-13' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (8, N'Bayern Munich       ', N'Salvador Holcomb)   ', 4, CAST(N'1934-07-19' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (9, N'PSG                 ', N'Henry Mccarthy      ', 5, CAST(N'1988-05-30' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (10, N'Porto               ', N'Flynn Hinton        ', 6, CAST(N'1956-10-06' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (11, N'Juventus            ', N'Aquila Dunn         ', 13, CAST(N'1950-03-14' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (12, N'Ajax                ', N'Alexander Figueroa  ', 14, CAST(N'1960-08-06' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (13, N'Manchester City     ', N'Orlando George      ', 22, CAST(N'1970-07-23' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (14, N'Chelsea             ', N'Hunter Parsons      ', 23, CAST(N'1960-06-25' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (15, N'Dinamo Tbilisi      ', N'Roman Fifia         ', 18, CAST(N'1950-03-09' AS Date))
INSERT [dbo].[Teams] ([TeamId], [TeamName], [ClubOwner], [StadiumId], [EstablishmentDate]) VALUES (16, N'Dinamo Batumi       ', N'Garth Macias        ', 24, CAST(N'1970-09-27' AS Date))
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Referees] FOREIGN KEY([RefereeId])
REFERENCES [dbo].[Referees] ([RefereeId])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Referees]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Stadiums] FOREIGN KEY([StadiumId])
REFERENCES [dbo].[Stadiums] ([StadiumId])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Stadiums]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Teams] FOREIGN KEY([FirstTeamId])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Teams]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Teams1] FOREIGN KEY([SecondTeamId])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Teams1]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Players_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Players_Countries]
GO
ALTER TABLE [dbo].[Referees]  WITH CHECK ADD  CONSTRAINT [FK_Referees_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Referees] CHECK CONSTRAINT [FK_Referees_Countries]
GO
ALTER TABLE [dbo].[Stadiums]  WITH CHECK ADD  CONSTRAINT [FK_Stadiums_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Stadiums] CHECK CONSTRAINT [FK_Stadiums_Countries]
GO
ALTER TABLE [dbo].[TeamPersons]  WITH CHECK ADD  CONSTRAINT [FK_TeamPersons_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([PersonId])
GO
ALTER TABLE [dbo].[TeamPersons] CHECK CONSTRAINT [FK_TeamPersons_Persons]
GO
ALTER TABLE [dbo].[TeamPersons]  WITH CHECK ADD  CONSTRAINT [FK_TeamPersons_PersonTypes] FOREIGN KEY([PersonTypeId])
REFERENCES [dbo].[PersonTypes] ([PersonTypeId])
GO
ALTER TABLE [dbo].[TeamPersons] CHECK CONSTRAINT [FK_TeamPersons_PersonTypes]
GO
ALTER TABLE [dbo].[TeamPersons]  WITH CHECK ADD  CONSTRAINT [FK_TeamPlayers_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[TeamPersons] CHECK CONSTRAINT [FK_TeamPlayers_Teams]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Stadiums] FOREIGN KEY([StadiumId])
REFERENCES [dbo].[Stadiums] ([StadiumId])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Stadiums]
GO
/****** Object:  StoredProcedure [dbo].[Get_Table_by_Team_and_Country]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Get_Table_by_Team_and_Country]
@Country VARCHAR(100),
@Team VARCHAR(100),
@Parameter varchar(1)
as
begin
declare @TeamId int,@StadiumId int,@Counter int;

select @TeamId = t.TeamId,@StadiumId = t.StadiumId from dbo.Teams t where t.TeamName = @Team or 
(LEFT(t.TeamName,4) = LEFT(@Team,4))

if @TeamId is null 
begin
print 'Record not found'
end

select @Counter = COUNT(*) from dbo.Games g          		   
inner join dbo.Teams t1 on t1.TeamId = g.FirstTeamId 
inner join dbo.Teams t2 on t2.TeamId = g.SecondTeamId
inner join dbo.Referees r on r.RefereeId = g.RefereeId
inner join dbo.Stadiums s on s.StadiumId = g.StadiumId
inner join dbo.Countries c on c.CountryId = s.CountryId where
(c.Name LIKE @Country + '%' OR @Country = LEFT(c.Name, 4)) and
((@Parameter = 'H' AND g.FirstTeamId = @TeamId and t1.StadiumId = g.StadiumId) or
(@Parameter = 'G' AND g.SecondTeamId = @TeamId and t2.StadiumId = g.StadiumId) or
(@Parameter = 'A' AND (@TeamId = g.FirstTeamId OR @TeamId = g.SecondTeamId)));

if @Counter = 0
begin
print 'Record not found'
end

else 
select c.Name Country, t1.TeamName HomeTeam,t2.TeamName AwayTeam,r.FirstName Referee,
 s.StadiumName Stadium,g.FirstTeamScore FirstTeamScore,g.SecondTeamScore SecondTeamScore from dbo.Games g          		   
inner join dbo.Teams t1 on t1.TeamId = g.FirstTeamId 
inner join dbo.Teams t2 on t2.TeamId = g.SecondTeamId
inner join dbo.Referees r on r.RefereeId = g.RefereeId
inner join dbo.Stadiums s on s.StadiumId = g.StadiumId
inner join dbo.Countries c on c.CountryId = s.CountryId where
(c.Name LIKE @Country + '%' OR @Country = LEFT(c.Name, 4)) and
((@Parameter = 'H' AND g.FirstTeamId = @TeamId and t1.StadiumId = g.StadiumId) or
(@Parameter = 'G' AND g.SecondTeamId = @TeamId and t2.StadiumId = g.StadiumId) or
(@Parameter = 'A' AND (@TeamId = g.FirstTeamId OR @TeamId = g.SecondTeamId)));

end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Stadium]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Insert_Stadium]
@StadiumName varchar(50),
@Capacity int,
@CountryName varchar(50)
as 
begin
declare @StadiumCount int, @CountryId int;

select @CountryId = c.CountryId from dbo.Countries c where c.Name = @CountryName or 
(c.Name = @CountryName or LEFT(c.Name,4) = LEFT(@CountryName,4))

if @CountryId is null
begin
insert into dbo.Countries values(@CountryName)
select @CountryId = c.CountryId from dbo.Countries c where c.Name = @CountryName or 
(c.Name = @CountryName or LEFT(c.Name,4) = LEFT(@CountryName,4))
end


select @StadiumCount = COUNT(*) from dbo.Stadiums s
inner join dbo.Countries c on c.CountryId = s.CountryId where
s.StadiumName = @StadiumName and (c.Name = @CountryName or LEFT(c.Name,4) = LEFT(@CountryName,4))

if @StadiumCount > 0 
begin
print 'Stadium already exists';
end

if @StadiumCount = 0
begin
insert into dbo.Stadiums (StadiumName,MaxAttendance,CountryId)
values(@StadiumName,@Capacity,@CountryId)
print 'Stadium successfully added';
end
end;
GO
/****** Object:  StoredProcedure [dbo].[Update_Person]    Script Date: 6/25/2023 11:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Person]
@PersonId int,
@Name varchar(50),
@Parameter varchar(1)
as 
begin
if @Parameter = 'F'
begin
update dbo.Persons set FirstName = @Name where PersonId = @PersonId
end
if @Parameter = 'L'
update dbo.Persons set LastName = @Name where PersonId = @PersonId 
end
if @Parameter not in ('L','F')
begin
print 'Wrong Parameter'
end;
GO
USE [master]
GO
ALTER DATABASE [TestFootball] SET  READ_WRITE 
GO
