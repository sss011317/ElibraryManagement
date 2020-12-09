USE [master]
GO
/****** Object:  Database [elibraryDB]    Script Date: 2020/12/9 下午 05:47:01 ******/
CREATE DATABASE [elibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elibraryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\elibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'elibraryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\elibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [elibraryDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [elibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [elibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [elibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [elibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [elibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'elibraryDB', N'ON'
GO
ALTER DATABASE [elibraryDB] SET QUERY_STORE = OFF
GO
USE [elibraryDB]
GO
/****** Object:  Table [dbo].[admin_login_tb1]    Script Date: 2020/12/9 下午 05:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_login_tb1](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[full_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin_login_tb1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[author_master_tb1]    Script Date: 2020/12/9 下午 05:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author_master_tb1](
	[author_id] [nvarchar](10) NOT NULL,
	[author_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_author_master_tb1] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_issue_tb1]    Script Date: 2020/12/9 下午 05:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_issue_tb1](
	[member_id] [nvarchar](50) NULL,
	[member_name] [nvarchar](50) NULL,
	[book_id] [nvarchar](50) NULL,
	[book_name] [nvarchar](max) NULL,
	[issue_date] [nvarchar](50) NULL,
	[due_date] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_master_tb1]    Script Date: 2020/12/9 下午 05:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_master_tb1](
	[book_id] [nchar](10) NOT NULL,
	[book_name] [nvarchar](max) NULL,
	[genre] [nvarchar](max) NULL,
	[author_name] [nvarchar](max) NULL,
	[publisher_name] [nvarchar](max) NULL,
	[publish_date] [nvarchar](50) NULL,
	[language] [nvarchar](50) NULL,
	[edition] [nvarchar](max) NULL,
	[book_cost] [nchar](10) NULL,
	[no_of_pages] [nchar](10) NULL,
	[book_description] [nvarchar](max) NULL,
	[actual_stock] [nchar](10) NULL,
	[current_stock] [nchar](10) NULL,
	[book_img_link] [nvarchar](max) NULL,
 CONSTRAINT [PK_book_master_tb1] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_master_tb1]    Script Date: 2020/12/9 下午 05:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_master_tb1](
	[full_name] [nvarchar](50) NULL,
	[dob] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[pincode] [nvarchar](50) NULL,
	[full_address] [nvarchar](max) NULL,
	[member_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[account_status] [nvarchar](50) NULL,
 CONSTRAINT [PK_member_master_tb1] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher_master_tb1]    Script Date: 2020/12/9 下午 05:47:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher_master_tb1](
	[publisher_id] [nchar](10) NOT NULL,
	[publisher_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_publisher_master_tb1] PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[admin_login_tb1] ([username], [password], [full_name]) VALUES (N'aaa', N'bbb', N'darling')
GO
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'1', N'Tammy')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'2', N'Gary')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'3', N'Gimmy')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'4', N'Tom')
INSERT [dbo].[author_master_tb1] ([author_id], [author_name]) VALUES (N'5', N'Mary')
GO
INSERT [dbo].[book_master_tb1] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'a001      ', N'笨蛋這麼多是有理的', N'History,Textbook', N'Tammy', N'kiki', N'2020-12-09', N'Mandarin', N'1st', N'199       ', N'350       ', N'馬英九的歷史定位？這本書封面告訴你.....', N'10        ', N'10        ', N'~/book_inventory/笨蛋這麼多是有理的.jpg')
INSERT [dbo].[book_master_tb1] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (N'a002      ', N'地方稅務資訊作業平台移轉計畫書', N'Action,Adventure,Comic Book', N'Tammy', N'kiki', N'2020-12-09', N'Mandarin', N'1st', N'599       ', N'800       ', N'地方稅務資訊作業平台移轉計畫書封面書影', N'10        ', N'10        ', N'~/book_inventory/地方稅務資訊作業平台移轉計畫書.jpg')
GO
INSERT [dbo].[member_master_tb1] ([full_name], [dob], [contact_no], [email], [city], [district], [pincode], [full_address], [member_id], [password], [account_status]) VALUES (N'asd', N'1999-12-01', N'564654', N'asdas23d1@yahoo.com.tw', N'Taipei', N'Xinyi', N'210', N'asd', N'abc123', N'abc123', N'active')
INSERT [dbo].[member_master_tb1] ([full_name], [dob], [contact_no], [email], [city], [district], [pincode], [full_address], [member_id], [password], [account_status]) VALUES (N'Tommy', N'1998-12-12', N'123456', N'4564@gmail.com', N'Taipei', N'Xinyi', N'201', N'ddddd', N'qweqwe22', N'', N'active')
GO
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'1         ', N'kiki')
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'2         ', N'gigi')
INSERT [dbo].[publisher_master_tb1] ([publisher_id], [publisher_name]) VALUES (N'3         ', N'dada')
GO
USE [master]
GO
ALTER DATABASE [elibraryDB] SET  READ_WRITE 
GO
