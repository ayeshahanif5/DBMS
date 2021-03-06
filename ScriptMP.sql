USE [master]
GO
/****** Object:  Database [ProjectA]    Script Date: 03/05/2019 10:18:29 AM ******/
CREATE DATABASE [ProjectA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjectA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjectA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProjectA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectA] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectA] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectA', N'ON'
GO
ALTER DATABASE [ProjectA] SET QUERY_STORE = OFF
GO
USE [ProjectA]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 03/05/2019 10:18:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[Contact] [varchar](20) NULL,
	[Email] [varchar](30) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAllFirstName]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwAllFirstName] as
select FirstName, LastName from Person where Contact=43
GO
/****** Object:  Table [dbo].[Student]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] NOT NULL,
	[RegistrationNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwStudent]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwStudent] as
select Person.FirstName, Person.LastName, Student.RegistrationNo from Person join Student 
on Person.Id = Student.Id
GO
/****** Object:  View [dbo].[vwAllFirstNamecheck]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwAllFirstNamecheck] as
select FirstName, LastName from Person where Contact=43 with check option
GO
/****** Object:  View [dbo].[vwAllFirstNamecheck1]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwAllFirstNamecheck1] as
select FirstName, LastName from Person where Contact=43 with check option
GO
/****** Object:  View [dbo].[vwAllFirstName1]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwAllFirstName1] as
select FirstName, LastName from Person where Contact=43
GO
/****** Object:  View [dbo].[vwAlltest]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vwAlltest] as
select * from Person where Contact=43 with check option
GO
/****** Object:  Table [dbo].[Advisor]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advisor](
	[Id] [int] NOT NULL,
	[Designation] [int] NOT NULL,
	[Salary] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[TotalWeightage] [int] NOT NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created_On] [date] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupEvaluation]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupEvaluation](
	[GroupId] [int] NOT NULL,
	[EvaluationId] [int] NOT NULL,
	[ObtainedMarks] [int] NOT NULL,
	[EvaluationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupEvaluation] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[EvaluationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupProject]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupProject](
	[ProjectId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupProject] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupStudent]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupStudent](
	[GroupId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupStudent] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](max) NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectAdvisor]    Script Date: 03/05/2019 10:18:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectAdvisor](
	[AdvisorId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[AdvisorRole] [int] NOT NULL,
	[AssignmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProjectAdvisor] PRIMARY KEY CLUSTERED 
(
	[AdvisorId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (6, 6, CAST(54433 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (8, 8, CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (9, 9, CAST(657 AS Decimal(18, 0)))
INSERT [dbo].[Advisor] ([Id], [Designation], [Salary]) VALUES (10, 10, CAST(4333 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Evaluation] ON 

INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (9, N'ee', 4, 24)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (10, N' ed', 5, 7)
INSERT [dbo].[Evaluation] ([Id], [Name], [TotalMarks], [TotalWeightage]) VALUES (11, N'Proposal', 10, 10)
SET IDENTITY_INSERT [dbo].[Evaluation] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (1, CAST(N'2019-03-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (2, CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (3, CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (4, CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (5, CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (6, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (7, CAST(N'2019-03-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (8, CAST(N'2019-03-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (9, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (10, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (11, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (12, CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (13, CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (14, CAST(N'2019-03-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (15, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (16, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (17, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (18, CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (19, CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (20, CAST(N'2019-09-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (21, CAST(N'2019-09-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (22, CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (23, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (24, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (25, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (26, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (27, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (28, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (29, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (30, CAST(N'2019-11-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (31, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (33, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (34, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (35, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (36, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (37, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (38, CAST(N'2019-05-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (39, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (40, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (41, CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (42, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (43, CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (44, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (45, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (46, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (47, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (48, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (49, CAST(N'2019-06-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (50, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (51, CAST(N'2019-07-03' AS Date))
INSERT [dbo].[Group] ([Id], [Created_On]) VALUES (52, CAST(N'2019-06-03' AS Date))
SET IDENTITY_INSERT [dbo].[Group] OFF
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (7, 9, 5, CAST(N'2019-04-03T23:40:38.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (13, 11, 15, CAST(N'2019-02-04T09:47:49.000' AS DateTime))
INSERT [dbo].[GroupEvaluation] ([GroupId], [EvaluationId], [ObtainedMarks], [EvaluationDate]) VALUES (19, 9, 6, CAST(N'2019-05-03T13:01:07.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1016, 19, CAST(N'2019-04-03T13:01:28.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1017, 5, CAST(N'2019-03-03T23:40:59.000' AS DateTime))
INSERT [dbo].[GroupProject] ([ProjectId], [GroupId], [AssignmentDate]) VALUES (1017, 15, CAST(N'2019-09-08T21:09:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (5, 39, 3, CAST(N'2019-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (5, 42, 3, CAST(N'2019-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (5, 43, 3, CAST(N'2019-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (5, 53, 3, CAST(N'2019-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (15, 42, 3, CAST(N'2019-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (20, 44, 3, CAST(N'2019-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 39, 4, CAST(N'2019-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 42, 4, CAST(N'2019-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 43, 3, CAST(N'2019-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 45, 3, CAST(N'2019-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 1043, 4, CAST(N'2019-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 1049, 3, CAST(N'2019-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[GroupStudent] ([GroupId], [StudentId], [Status], [AssignmentDate]) VALUES (34, 1122, 4, CAST(N'2019-04-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Lookup] ON 

INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (1, N'Male', N'GENDER')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (2, N'Female', N'GENDER')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (3, N'Active', N'STATUS')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (4, N'InActive', N'STATUS')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (6, N'Professor', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (7, N'Associate Professor', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (8, N'Assisstant Professor', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (9, N'Lecturer', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (10, N'Industry Professional', N'DESIGNATION')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (11, N'Main Advisor', N'ADVISOR_ROLE')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (12, N'Co-Advisror', N'ADVISOR_ROLE')
INSERT [dbo].[Lookup] ([Id], [Value], [Category]) VALUES (14, N'Industry Advisor', N'ADVISOR_ROLE')
SET IDENTITY_INSERT [dbo].[Lookup] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (2, N'ayesha', N'ch', N'776', N'hg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (4, N'ghh', N'ffff', N'45', N'fff', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (5, N'gh', N'ddd', N'4', N'ff', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (6, N'ff', N'sh', N'22', N'222', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (7, N'ytt', N'gg', N'56', N'gg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (8, N'gg', N'h', N'6', N'gg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (9, N'gf', N'gg', N'665', N'tgg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (10, N'ee', N'd', N'4', N'fd', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (11, N'gf', N'd', N'43', N'fg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (12, N'gf', N'd', N'43', N'fg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (13, N'gf', N'd', N'43', N'fg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (14, N'gf', N'd', N'43', N'fg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (15, N'gf', N'd', N'43', N'fg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (16, N'gf', N'd', N'43', N'fg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (17, N'aa', N'ch', N'123', N'hgf', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (18, N'ayesha', N'hanif', N'123', N'df', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (19, N'ayesha', N'ch', N'43', N'ff', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (20, N'hg', N't', N'4', N'g', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (21, N'ff', N'f', N'4', N'ff', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (22, N'ff', N'f', N'3', N'f', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (23, N'ff', N'e', N'3', N'f', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (24, N'fd', N'd', N'33', N'fff', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (25, N'ff', N'r', N'3', N'f', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (26, N'hg', N'hh', N'7', N'v', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (27, N'jh', N'v', N'8', N'f', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (28, N'h', N'g', N'6', N'f', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (29, N'hg', N'j', N'6', N'hg', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (30, N'h', N'b', N'8', N'h', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (31, N'h', N'h', N'8', N'g', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (32, N'yt', N'h', N'6', N'f', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (33, N'hg', N'h', N'7', N'g', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (34, N'h', N'f', N'7', N'v', CAST(N'2019-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (35, N'gf', N'hg', N'3', N'f', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (39, N'ayesha', N'ch', N'123', N'df', CAST(N'2019-03-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (42, N'ahmad', N'b', N'8', N'g', CAST(N'2019-03-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (43, N'hg', N'hg', N'1', N'd', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (44, N'gf', N'df', N'23', N'g', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (45, N'gg', N'd', N'3', N'g', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (46, N'dd', N'd', N'4', N'ff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (47, N'f', N'f', N'3', N'g', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (48, N'ddd', N'df', N'12', N'gg', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (49, N'gfg', N'hg', N'65', N'gff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (50, N'hhh', N'cc', N'43', N'ff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (51, N'g', N'ff', N'6', N'ff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (52, N'vvv', N'vvv', N'65', N'fff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (53, N'ggg', N'fff', N'65', N'fff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (54, N'fff', N'fff', N'6', N'ff', CAST(N'2019-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (55, N'fff', N'fff', N'77', N'ff', CAST(N'2019-10-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (56, N'fff', N'', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (57, N'', N'', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (58, N'', N'', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (59, N'@@', N'', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (60, N'', N'', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (61, N'', N'', N'23', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (62, N'6655', N'ggg', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (63, N'gffd', N'', N'67655', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (64, N'ghfgght dd', N'', N'', N'', CAST(N'2019-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (65, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (66, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (67, N'ggg', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (68, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (69, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (70, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (71, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (72, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (73, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (74, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (75, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (76, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (77, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (78, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (79, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (80, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (81, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (82, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (83, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (84, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (85, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (86, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (87, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (88, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (89, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (90, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (91, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (92, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (93, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (94, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (95, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (96, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (97, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (98, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (99, N'', N'', N'', N'', CAST(N'2019-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1043, N'hh', N'gg', N'65', N'ggf', CAST(N'2019-07-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1049, N'jh', N'jh', N'76', N'ggg', CAST(N'2019-03-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1050, N'hg', N'jh', N'76', N'jh', CAST(N'2019-03-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1051, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1052, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1053, N'', N'', N'', N'', CAST(N'2019-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1054, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1055, N'', N'', N'', N'', CAST(N'2019-03-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1056, N'', N'', N'', N'', CAST(N'2019-03-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1057, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1058, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1059, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1060, N'', N'', N'', N'', CAST(N'2019-02-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1061, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1062, N'', N'', N'', N'', CAST(N'2019-03-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1063, N'', N'', N'', N'', CAST(N'2019-03-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1064, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1065, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1066, N'', N'', N'', N'', CAST(N'2019-03-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1067, N'', N'', N'', N'', CAST(N'2019-03-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1068, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1069, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1070, N'', N'', N'', N'', CAST(N'2019-03-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1071, N'', N'', N'', N'', CAST(N'2019-03-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1072, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1073, N'', N'', N'', N'', CAST(N'2019-03-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1074, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1075, N'', N'', N'', N'', CAST(N'2019-03-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1076, N'', N'', N'', N'', CAST(N'2019-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1077, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1078, N'', N'', N'', N'', CAST(N'2019-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1079, N'', N'', N'', N'aaa@gmail.com', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1080, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1081, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1082, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1083, N'', N'', N'', N'', CAST(N'2019-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1084, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1085, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1086, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1087, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1088, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1089, N'', N'', N'', N'', CAST(N'2019-02-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1090, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1091, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1092, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1093, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1094, N'', N'', N'', N'', CAST(N'2019-03-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1095, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1096, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1097, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1098, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1099, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1100, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1101, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1102, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1103, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1104, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1105, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1106, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1107, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1108, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1109, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1110, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1111, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1112, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1113, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1114, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1115, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1116, N'', N'', N'', N'', CAST(N'2019-03-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1117, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1118, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1119, N'', N'', N'', N'', CAST(N'2019-03-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1120, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1121, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1122, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1123, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1124, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1125, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1126, N'', N'', N'', N'', CAST(N'2019-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1127, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1128, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1129, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1130, N'', N'', N'', N'', CAST(N'2019-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1131, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1132, N'', N'', N'', N'', CAST(N'2019-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1133, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1134, N'', N'', N'', N'', CAST(N'2019-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1135, N'', N'', N'', N'', CAST(N'2019-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1139, N'ayesha', N'hh', N'43', N'hgf', CAST(N'1905-06-29T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1140, N'', N'', N'', N'', CAST(N'2019-04-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1141, N'', N'', N'', N'', CAST(N'2019-04-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Contact], [Email], [DateOfBirth], [Gender]) VALUES (1142, N'', N'', N'', N'', CAST(N'2019-04-02T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1016, N'xxxx', N'fy')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1017, N'vvv', N'phonebook')
INSERT [dbo].[Project] ([Id], [Description], [Title]) VALUES (1019, N'www', N'SMS')
SET IDENTITY_INSERT [dbo].[Project] OFF
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (6, 1019, 6, CAST(N'2019-03-04T09:24:56.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (8, 1016, 8, CAST(N'2019-04-03T13:00:31.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (8, 1019, 8, CAST(N'2019-08-04T09:24:56.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (9, 1017, 9, CAST(N'2019-10-03T23:48:38.000' AS DateTime))
INSERT [dbo].[ProjectAdvisor] ([AdvisorId], [ProjectId], [AdvisorRole], [AssignmentDate]) VALUES (10, 1017, 10, CAST(N'2019-07-03T23:50:06.000' AS DateTime))
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (39, N'456')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (42, N'7')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (43, N'32')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (44, N'2')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (45, N'43')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (46, N'43')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (47, N'32')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (48, N'345')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (49, N'65')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (50, N'dd')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (51, N'6')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (52, N'65')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (53, N'66')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (54, N'66')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (55, N'66')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (56, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (57, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (58, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (59, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (60, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (61, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (62, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (63, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (64, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (65, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (66, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (67, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (68, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (69, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (70, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (71, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (72, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (73, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (74, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (75, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (76, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (77, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (78, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (79, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (80, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (81, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (82, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (83, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (84, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (85, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (86, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (87, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (88, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (89, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (90, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (91, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (92, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (93, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (94, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (95, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (96, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (97, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (98, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (99, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1043, N'765')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1049, N'87')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1050, N'54')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1051, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1052, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1053, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1054, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1055, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1056, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1057, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1058, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1059, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1060, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1061, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1062, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1063, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1064, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1065, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1066, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1067, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1068, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1069, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1070, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1071, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1072, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1073, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1074, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1075, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1076, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1077, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1078, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1079, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1080, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1081, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1082, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1083, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1084, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1085, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1086, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1087, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1088, N'')
GO
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1089, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1090, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1091, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1092, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1093, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1094, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1095, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1096, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1097, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1098, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1099, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1100, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1101, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1102, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1103, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1104, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1105, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1106, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1107, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1108, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1109, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1110, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1111, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1112, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1113, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1114, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1115, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1116, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1117, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1118, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1119, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1120, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1121, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1122, N'678')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1123, N'54')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1124, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1125, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1126, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1127, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1128, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1129, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1130, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1131, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1132, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1133, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1134, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1135, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1140, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1141, N'')
INSERT [dbo].[Student] ([Id], [RegistrationNo]) VALUES (1142, N'')
ALTER TABLE [dbo].[Advisor]  WITH CHECK ADD  CONSTRAINT [FK_Advisor_Lookup] FOREIGN KEY([Designation])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Advisor] CHECK CONSTRAINT [FK_Advisor_Lookup]
GO
ALTER TABLE [dbo].[GroupEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_GroupEvaluation_Evaluation] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[GroupEvaluation] CHECK CONSTRAINT [FK_GroupEvaluation_Evaluation]
GO
ALTER TABLE [dbo].[GroupEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_GroupEvaluation_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[GroupEvaluation] CHECK CONSTRAINT [FK_GroupEvaluation_Group]
GO
ALTER TABLE [dbo].[GroupProject]  WITH CHECK ADD  CONSTRAINT [FK_GroupProject_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[GroupProject] CHECK CONSTRAINT [FK_GroupProject_Group]
GO
ALTER TABLE [dbo].[GroupProject]  WITH CHECK ADD  CONSTRAINT [FK_GroupProject_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[GroupProject] CHECK CONSTRAINT [FK_GroupProject_Project]
GO
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_GroupStudents_Lookup] FOREIGN KEY([Status])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_GroupStudents_Lookup]
GO
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_ProjectStudents_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_ProjectStudents_Group]
GO
ALTER TABLE [dbo].[GroupStudent]  WITH CHECK ADD  CONSTRAINT [FK_ProjectStudents_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[GroupStudent] CHECK CONSTRAINT [FK_ProjectStudents_Student]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Lookup] FOREIGN KEY([Gender])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Lookup]
GO
ALTER TABLE [dbo].[ProjectAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAdvisor_Lookup] FOREIGN KEY([AdvisorRole])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[ProjectAdvisor] CHECK CONSTRAINT [FK_ProjectAdvisor_Lookup]
GO
ALTER TABLE [dbo].[ProjectAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAdvisor_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectAdvisor] CHECK CONSTRAINT [FK_ProjectAdvisor_Project]
GO
ALTER TABLE [dbo].[ProjectAdvisor]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTeachers_Teacher] FOREIGN KEY([AdvisorId])
REFERENCES [dbo].[Advisor] ([Id])
GO
ALTER TABLE [dbo].[ProjectAdvisor] CHECK CONSTRAINT [FK_ProjectTeachers_Teacher]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Person]
GO
/****** Object:  StoredProcedure [dbo].[new]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[new]
@RegistrationNo varchar(100)
AS
BEGIN
select IDENT_CURRENT('Person') as IdentCurrent;
insert into Student(Id,RegistrationNo)
values(@@IDENTITY,@RegistrationNo)
END
GO
/****** Object:  StoredProcedure [dbo].[new11]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[new11]
@RegistrationNo varchar(100)
AS
BEGIN
select IDENT_CURRENT('Person') as IdentCurrent;
insert into Student(Id,RegistrationNo)
values(@@IDENTITY,@RegistrationNo)
END
GO
/****** Object:  StoredProcedure [dbo].[prte]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[prte] as
begin
select FirstName, LastName from Person where Contact=43
end
GO
/****** Object:  StoredProcedure [dbo].[prtest]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prtest] as
select FirstName, LastName from Person where Contact=43
GO
/****** Object:  StoredProcedure [dbo].[spselect]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spselect] as
begin
select * from Student where RegistrationNo=7
end
GO
/****** Object:  StoredProcedure [dbo].[spselectp]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spselectp] @Contact varchar  as
begin
select * from Person where Contact= @Contact
end
GO
/****** Object:  StoredProcedure [dbo].[spselectpara]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spselectpara] @Contact varchar as
begin
select * from Person where Contact= @Contact
end
GO
/****** Object:  StoredProcedure [dbo].[spselectparameter]    Script Date: 03/05/2019 10:18:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spselectparameter] as
declare @Contact varchar
begin
select * from Person where Contact= @Contact
end
GO
USE [master]
GO
ALTER DATABASE [ProjectA] SET  READ_WRITE 
GO
