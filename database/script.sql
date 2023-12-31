USE [master]
GO
/****** Object:  Database [Library1]    Script Date: 19.06.2022 01:31:28 ******/
CREATE DATABASE [Library1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Library1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Library1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library1] SET  MULTI_USER 
GO
ALTER DATABASE [Library1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library1] SET QUERY_STORE = OFF
GO
USE [Library1]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ISBN] [char](10) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Author Name] [varchar](50) NOT NULL,
	[Edition year] [int] NOT NULL,
	[User id] [char](10) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[getBooks]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Select * from Books where ISBN = '1' or Category = 'Novel' */
/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'*/
/*Select * from Books order by ISBN*/
/*SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;*/
/*Select * From Staffs Where Position is not null;*/

/*select
 max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary
from [Staff Salary]*/
/*SELECT  Count(*) as [ Total Members] from [Staff Salary];
Select sum(Salary) as [Total Salary] from [Staff Salary]*/
/*select Price from Books group by Price having Price >10;*/

/*Select * From Books Where Title like '%a%'*/



/*UPDATE [Staff Salary] SET Salary=Salary+400 

select * from [Staff Salary]*/

/*we Updated the staff's salaries*/

/*select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN/*

select [First name] from Readers r  left outer join Staffs s on r.[First name] = s.Name*/
select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r   inner join Staffs s on r.[First name] = s.[First name];

select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];
*/















/*alter table Publisher 
add ISBN char(10) not null default(space(0))*/ 

/*alter table [Staff Salary]
add Position varchar(50) not null default(space(0))
*/

/*CREATE PROCEDURE getReaders
as 
Begin Select * from Readers
End
*/
CREATE VIEW [dbo].[getBooks]
as 
 Select * from Books
 
GO
/****** Object:  View [dbo].[gettingBooks]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'
Select * from Books order by ISBN
SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;
Select * From Staffs Where Position is not null;

select max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary from [Staff Salary]
SELECT  Count(*) as [ Total Members] from Staffs;
Select sum(Salary) as [Total Salary] from [Staff Salary]

select Price from Books group by Price having Price >10;

Select * From Books Where Title like '%a%'



UPDATE [Staff Salary] SET Salary=Salary+400 select * from [Staff Salary]



select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN
select * from Readers r   inner join Staffs s on r.[First name] = s.[First name];
select * from [Staff Salary] r   inner join Staffs s on r.Position = s.Position;


select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];


select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];



*/











/*alter table Publisher 
add ISBN char(10) not null default(space(0))*/ 

/*alter table [Staff Salary]
add Position varchar(50) not null default(space(0))
*/

/*CREATE PROCEDURE getReaders
as 
Begin Select * from Readers
End
*/

CREATE VIEW [dbo].[gettingBooks]
as 
 Select * from Books
 


GO
/****** Object:  Table [dbo].[Readers]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readers](
	[First name] [varchar](50) NOT NULL,
	[Last name] [varchar](50) NOT NULL,
	[User id] [char](10) NOT NULL,
	[E-mail] [varchar](50) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Readers] PRIMARY KEY CLUSTERED 
(
	[User id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[gettingReaders]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'
Select * from Books order by ISBN
SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;
Select * From Staffs Where Position is not null;

select max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary from [Staff Salary]
SELECT  Count(*) as [ Total Members] from Staffs;
Select sum(Salary) as [Total Salary] from [Staff Salary]

select Price from Books group by Price having Price >10;

Select * From Books Where Title like '%a%'



UPDATE [Staff Salary] SET Salary=Salary+400 select * from [Staff Salary]



select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN
select * from Readers r   inner join Staffs s on r.[First name] = s.[First name];
select * from [Staff Salary] r   inner join Staffs s on r.Position = s.Position;


select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];


select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];



*/











/*alter table Publisher 
add ISBN char(10) not null default(space(0))*/ 

/*alter table [Staff Salary]
add Position varchar(50) not null default(space(0))
*/

/*CREATE PROCEDURE getReaders
as 
Begin Select * from Readers
End
*/

CREATE VIEW [dbo].[gettingReaders]
as 
 Select * from Readers
 


GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Publisher id] [char](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[ISBN] [char](10) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[Publisher id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReserveReturn]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReserveReturn](
	[Reserve date] [date] NOT NULL,
	[Return date] [date] NOT NULL,
	[Due date] [date] NOT NULL,
 CONSTRAINT [PK_ReserveReturn] PRIMARY KEY CLUSTERED 
(
	[Reserve date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff Salary]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff Salary](
	[Salary] [float] NOT NULL,
	[salary id] [char](10) NOT NULL,
	[Position] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[Staff id] [char](10) NOT NULL,
	[First name] [varchar](50) NOT NULL,
	[Position] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[Staff id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'1         ', N'Küçük Prens', N'Novel', 12, N'Antoine de saint', 1943, N'1         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'10        ', N'Şaka', N'Novel', 26, N'Milan Kundera', 1967, N'10        ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'2         ', N'Şeker Portakalı', N'Novel', 12, N'Jose mauro de vasconcelos', 1896, N'3         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'3         ', N'Pinokyo', N'Novel', 15, N'Carlo Collodi', 1883, N'4         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'4         ', N'Yabancı', N'Novel', 20, N'Albert Camus', 1896, N'5         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'5         ', N'Kayıp zaman izinde', N'Novel', 30, N'Marcel Proust', 1456, N'6         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'6         ', N'Dava', N'Novel', 13, N'Franz Kafka', 1896, N'7         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'7         ', N'Gazap Üzümleri', N'Novel', 15, N'John Steinbeck', 1939, N'8         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'8         ', N'Yolda', N'Novel', 30, N'Jack Kerouac', 1957, N'9         ')
INSERT [dbo].[Books] ([ISBN], [Title], [Category], [Price], [Author Name], [Edition year], [User id]) VALUES (N'9         ', N'Kendine Ait bir oda', N'Novel', 25, N'Virginia woolf', 1929, N'2         ')
GO
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'1         ', N'Can', N'zzzzzzzzzzz', N'1         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'10        ', N'Karıyer', N'hhhhhhhhhh', N'2         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'2         ', N'Yapı Kredi', N'yyyyyyyyyyy', N'3         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'3         ', N'İş bankası', N'aaaaaaaaaa', N'4         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'4         ', N'Doğan', N'bbbbbbbbb', N'5         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'5         ', N'Say', N'xxxxxxxxxxx', N'6         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'6         ', N'Metis', N'ppppppppp', N'7         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'7         ', N'Ayrıntı', N'kkkkkkkkkkk', N'8         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'8         ', N'İthaki', N'ccccccccccc', N'9         ')
INSERT [dbo].[Publisher] ([Publisher id], [Name], [Address], [ISBN]) VALUES (N'9         ', N'Kırmızı Kedi', N'sssssssssssss', N'10        ')
GO
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Kübra', N'Uçar', N'1         ', N'kubraucr2002@gmail.com', N'feritpaşa mahallesi çiçek sokak no : 21 Konya/Selçuklu', N'+945698745', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Rana', N'Batu', N'10        ', N'rana@gmail.com', N'İpek mahallesi Haydar Paşa sokak Antalya/Muratpaşa', N'+458796314', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Kevser ', N'Öztürk', N'2         ', N'kevser2000@gmail.com', N'Zafer mahallesi kiraz sokak no :21 Aydın/efeler', N'+987468952', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Rabia ', N'Yıldırım', N'3         ', N'rabiay@gmail.com', N'ataşehir mahallesi beykoz sokak Çiçek apartmanı Manisa/ Salihli ', N'+987456985', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Esmanur', N'Deli', N'4         ', N'esma@hotmail.com', N'Kundura mahallesi Papatya sokak İstanbul/Beykoz', N'+125478963', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Ebrar', N'Demir', N'5         ', N'ebrar@outlook.com', N'turkuaz mahallesi Batıkent sokak İzmir/buca', N'+456977569', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Emine', N'Tekcan', N'6         ', N'emine@gmail.com', N'çicek mahallesi karanfil sokak Aksaray/Merkez', N'+456975625', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Görkem', N'Avcı', N'7         ', N'gorkem@gmail.com', N'Mudanya mahallesi sipsi sokak Bursa/Görükle', N'+456978487', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Berfin', N'Akıl', N'8         ', N'berfin@gmail.com', N'Tuna mahallesi Pembe sokak Urfa/Merkez', N'+456987566', NULL)
INSERT [dbo].[Readers] ([First name], [Last name], [User id], [E-mail], [Address], [Phone], [Date]) VALUES (N'Gizem', N'Tekal', N'9         ', N'gizem@gmail.com', N'Papatya mahallesi Mor sokak Manisa/Turgutlu', N'+478954659', NULL)
GO
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-01-01' AS Date), CAST(N'2022-01-20' AS Date), CAST(N'2022-01-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-02-01' AS Date), CAST(N'2022-02-20' AS Date), CAST(N'2022-03-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-03-01' AS Date), CAST(N'2022-03-20' AS Date), CAST(N'2022-03-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-04-01' AS Date), CAST(N'2022-04-20' AS Date), CAST(N'2022-04-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-05-01' AS Date), CAST(N'2022-05-20' AS Date), CAST(N'2022-05-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-06-01' AS Date), CAST(N'2022-06-20' AS Date), CAST(N'2022-06-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-07-01' AS Date), CAST(N'2022-07-20' AS Date), CAST(N'2022-07-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-08-01' AS Date), CAST(N'2022-08-20' AS Date), CAST(N'2022-08-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-09-01' AS Date), CAST(N'2022-09-20' AS Date), CAST(N'2022-09-30' AS Date))
INSERT [dbo].[ReserveReturn] ([Reserve date], [Return date], [Due date]) VALUES (CAST(N'2022-10-01' AS Date), CAST(N'2022-10-20' AS Date), CAST(N'2022-10-30' AS Date))
GO
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (14200, N'1         ', N'Manager')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (11600, N'2         ', N'Servant             ')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (10600, N'3         ', N'Student')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (2400, N'4         ', N'Officer')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (9600, N'5         ', N'Officer')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (8600, N'6         ', N'Servant')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (11100, N'7         ', N'Manager')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (2600, N'8         ', N'Student')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (6100, N'9         ', N'Servant')
INSERT [dbo].[Staff Salary] ([Salary], [salary id], [Position]) VALUES (9100, N'10        ', N'Manager')
GO
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'1         ', N'Hasan Çicek', N'Manager             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'10        ', N'Hilal kar', N'Student             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'2         ', N'Aslı Örnek', N'Manager             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'3         ', N'Tuğçe Kaya', N'Student             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'4         ', N'Emre Yıldız', N'Servant             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'5         ', N'Kerim Aslan', N'Officer             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'6         ', N'Talat Orman', N'Officer             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'7         ', N'Merve Öz', N'Student             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'8         ', N'Tahsin erbaş', N'Manager             ')
INSERT [dbo].[Staffs] ([Staff id], [First name], [Position]) VALUES (N'9         ', N'Ayşe Uyar', N'Servant             ')
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (space((0))) FOR [User id]
GO
ALTER TABLE [dbo].[Publisher] ADD  DEFAULT (space((0))) FOR [ISBN]
GO
ALTER TABLE [dbo].[Staff Salary] ADD  DEFAULT (space((0))) FOR [Position]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publisher] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Publisher] ([Publisher id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publisher]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Readers] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Readers] ([User id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Readers]
GO
ALTER TABLE [dbo].[Readers]  WITH CHECK ADD  CONSTRAINT [FK_Readers_ReserveReturn] FOREIGN KEY([Date])
REFERENCES [dbo].[ReserveReturn] ([Reserve date])
GO
ALTER TABLE [dbo].[Readers] CHECK CONSTRAINT [FK_Readers_ReserveReturn]
GO
ALTER TABLE [dbo].[Staff Salary]  WITH CHECK ADD  CONSTRAINT [FK_Staff Salary_Staffs1] FOREIGN KEY([salary id])
REFERENCES [dbo].[Staffs] ([Staff id])
GO
ALTER TABLE [dbo].[Staff Salary] CHECK CONSTRAINT [FK_Staff Salary_Staffs1]
GO
/****** Object:  StoredProcedure [dbo].[BookTest]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'
Select * from Books order by ISBN
SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;
Select * From Staffs Where Position is not null;

select max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary from [Staff Salary]
SELECT  Count(*) as [ Total Members] from Staffs;
Select sum(Salary) as [Total Salary] from [Staff Salary]

select Price from Books group by Price having Price >10;

Select * From Books Where Title like '%a%'



UPDATE [Staff Salary] SET Salary=Salary+400 select * from [Staff Salary]



select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN
select * from Readers r   inner join Staffs s on r.[First name] = s.[First name];
select * from [Staff Salary] r   inner join Staffs s on r.Position = s.Position;


select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];


select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];



*/











/*alter table Publisher 
add ISBN char(10) not null default(space(0))*/ 

/*alter table [Staff Salary]
add Position varchar(50) not null default(space(0))
*/
/*CREATE VIEW gettingReaders
as 
 Select * from Readers*/



 /*
CREATE PROCEDURE ReaderTest
as
Begin Select * from Readers
End*/



CREATE PROCEDURE [dbo].[BookTest]
as
Begin Select * from Readers
End



 


GO
/****** Object:  StoredProcedure [dbo].[getReaders]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Select * from Books where ISBN = '1' or Category = 'Novel' */
/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'*/
/*Select * from Books order by ISBN*/
/*SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;*/
/*Select * From Staffs Where Position is not null;*/

/*select
 max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary
from [Staff Salary]*/
/*SELECT  Count(*) as [ Total Members] from [Staff Salary];
Select sum(Salary) as [Total Salary] from [Staff Salary]*/
/*select Price from Books group by Price having Price >10;*/

/*Select * From Books Where Title like '%a%'*/



/*UPDATE [Staff Salary] SET Salary=Salary+400 

select * from [Staff Salary]*/

/*we Updated the staff's salaries*/

/*select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN/*

select [First name] from Readers r  left outer join Staffs s on r.[First name] = s.Name*/
select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r   inner join Staffs s on r.[First name] = s.[First name];

select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];
*/















/*alter table Publisher 
add ISBN char(10) not null default(space(0))*/ 

/*alter table [Staff Salary]
add Position varchar(50) not null default(space(0))
*/

CREATE PROCEDURE [dbo].[getReaders]
as 
Begin Select * from Readers
End
GO
/****** Object:  StoredProcedure [dbo].[ReaderTest]    Script Date: 19.06.2022 01:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'
Select * from Books order by ISBN
SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;
Select * From Staffs Where Position is not null;

select max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary from [Staff Salary]
SELECT  Count(*) as [ Total Members] from Staffs;
Select sum(Salary) as [Total Salary] from [Staff Salary]

select Price from Books group by Price having Price >10;

Select * From Books Where Title like '%a%'



UPDATE [Staff Salary] SET Salary=Salary+400 select * from [Staff Salary]



select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN
select * from Readers r   inner join Staffs s on r.[First name] = s.[First name];
select * from [Staff Salary] r   inner join Staffs s on r.Position = s.Position;


select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];


select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];



*/











/*alter table Publisher 
add ISBN char(10) not null default(space(0))*/ 

/*alter table [Staff Salary]
add Position varchar(50) not null default(space(0))
*/
/*CREATE VIEW gettingReaders
as 
 Select * from Readers*/




CREATE PROCEDURE [dbo].[ReaderTest]
as
Begin Select * from Readers
End



 


GO
USE [master]
GO
ALTER DATABASE [Library1] SET  READ_WRITE 
GO
