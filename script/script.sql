USE [master]
GO
/****** Object:  Database [DataAnalaysis]    Script Date: 12/17/2024 11:54:36 AM ******/
CREATE DATABASE [DataAnalaysis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataAnalaysis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DataAnalaysis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataAnalaysis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DataAnalaysis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DataAnalaysis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataAnalaysis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DataAnalaysis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DataAnalaysis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DataAnalaysis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DataAnalaysis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DataAnalaysis] SET ARITHABORT OFF 
GO
ALTER DATABASE [DataAnalaysis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DataAnalaysis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DataAnalaysis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DataAnalaysis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DataAnalaysis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DataAnalaysis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DataAnalaysis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DataAnalaysis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DataAnalaysis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DataAnalaysis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DataAnalaysis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DataAnalaysis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DataAnalaysis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DataAnalaysis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DataAnalaysis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DataAnalaysis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DataAnalaysis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DataAnalaysis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DataAnalaysis] SET  MULTI_USER 
GO
ALTER DATABASE [DataAnalaysis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DataAnalaysis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DataAnalaysis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DataAnalaysis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DataAnalaysis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DataAnalaysis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DataAnalaysis] SET QUERY_STORE = OFF
GO
USE [DataAnalaysis]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/17/2024 11:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Oid] [int] NULL,
	[Pid] [int] NULL,
	[Price] [varchar](50) NULL,
	[Qty] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/17/2024 11:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Pname] [varchar](50) NULL,
	[Cat] [varchar](50) NULL,
	[Subcat] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[Sellername] [varchar](50) NULL,
	[Photo1] [varchar](50) NULL,
	[Photo2] [varchar](50) NULL,
	[Photo3] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/17/2024 11:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Order]    Script Date: 12/17/2024 11:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Order](
	[Oid] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NULL,
	[TotalItems] [varchar](50) NULL,
	[TotalPrice] [varchar](50) NULL,
	[DateTime] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Search]    Script Date: 12/17/2024 11:54:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Search](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NULL,
	[Pid] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[OrderItems] ([Oid], [Pid], [Price], [Qty]) VALUES (1, 31, N'800', N'1')
INSERT [dbo].[OrderItems] ([Oid], [Pid], [Price], [Qty]) VALUES (2, 32, N'1,000', N'1')
INSERT [dbo].[OrderItems] ([Oid], [Pid], [Price], [Qty]) VALUES (3, 25, N'2,000', N'1')
INSERT [dbo].[OrderItems] ([Oid], [Pid], [Price], [Qty]) VALUES (5, 42, N'200', N'1')
INSERT [dbo].[OrderItems] ([Oid], [Pid], [Price], [Qty]) VALUES (5, 45, N'1,500', N'1')
INSERT [dbo].[OrderItems] ([Oid], [Pid], [Price], [Qty]) VALUES (6, 42, N'200', N'1')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (1, N'Samsung Galaxy M13', N'Electronics', N'SmartPhones', N'Sumsung', N'11,000', N'Samsung Store', N'samsung1.jpg', N'samsung2.jpg', N'samsung3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (2, N'iPhone14', N'Electronics', N'SmartPhones', N'Apple', N'79,999', N'Apple Store', N'iphone1.png', N'iphone2.jpg', N'iphone3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (3, N'Realme', N'Electronics', N'SmartPhones', N'Realme', N'20,000', N'Reliance Digital', N'phone1.jpg', N'phone2.jpg', N'phone3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (4, N'Redmi', N'Electronics', N'SmartPhones', N'Xiaomi', N'15.000', N'Reliance Digital', N'phone1.jpg', N'phone2.jpg', N'phone3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (5, N'Dell Inspiron 15', N'Electronics', N'Laptop', N'Dell', N'53,000', N'Amazon', N'laptopdell.jpg', N'laptop2.jpg', N'laptop3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (6, N'Lenovo i4', N'Electronics', N'Laptop', N'Lenova', N'80,000', N'Reliance Digital', N'laptoplenovo.jpg', N'laptop2.jpg', N'laptop3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (7, N'Asus Vivobook', N'Electronics', N'Laptop', N'Asus', N'60,000', N'Flipkart', N'laptopasus.jpg', N'laptop2.jpg', N'laptop3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (8, N'MacBook', N'Electronics', N'Laptop', N'Apple', N'2,20,000', N'Apple Store', N'laptopmac.jpg', N'laptop2.jpg', N'laptop3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (9, N'Samsung Galaxy Tab S8', N'Electronics', N'Tablets', N'Samsung', N'64,990', N'Samsung Store', N'tab1.jpg', N'tab2.jpg', N'tab3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (10, N'Ipad', N'Electronics', N'Tablets', N'Apple', N'80,000', N'Apple Store', N'tab4.jpg', N'tab2.jpg', N'tab3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (11, N'ThinkPad', N'Electronics', N'Tablets', N'Lenovo', N'60,000', N'Reliance Digital', N'tab5.jpg', N'tab2.jpg', N'tab3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (12, N'Apple Watch Series 7', N'Electronics', N'Smartwatches', N'Apple', N'35,000', N'Apple Store', N'sw1.jpg', N'sw4.jpg', N'sw2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (13, N'Noise Caliber Buzz', N'Electronics', N'Smartwatches', N'Noise', N'5,000', N'Amazon', N'sw2.jpg', N'sw5.jpg', N'sw3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (14, N'Galaxy Watch', N'Electronics', N'Smartwatches', N'Samsung', N'10,000', N'Samsung Store', N'sw3.jpg', N'sw1.jpg', N'sw4.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (15, N'Fitbit Versa', N'Electronics', N'Smartwatches', N'Fitbit ', N'3,000', N'Reliance Digital', N'buds1.jpg', N'buds2.jpg', N'buds3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (16, N'AirPods', N'Electronics', N'Bluetooth Earbuds', N'Apple', N'30,000', N'Apple Store', N'buds2.jpg', N'buds1.jpg', N'buds3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (17, N'Galaxy Buds', N'Electronics', N'Bluetooth Earbuds', N'Samsung', N'10,000', N'Samsung Store', N'buds3.jpg', N'buds2.jpg', N'buds1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (18, N'Pixel Buds', N'Electronics', N'Bluetooth Earbuds', N'Google ', N'11,000', N'Reliance Digital', N'buds2.jpg', N'buds1.jpg', N'buds3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (19, N'Buds', N'Electronics', N'Bluetooth Earbuds', N'Redmi', N'2,000', N'Xiaomi Store', N'buds3.jpg', N'buds2.jpg', N'buds1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (20, N'Buds', N'Electronics', N'Bluetooth Earbuds', N'OnePlus', N'4,000', N'Reliance Digital', N'buds1.jpg', N'buds3.jpg', N'buds2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (21, N'Mi Earbuds', N'Electronics', N'Bluetooth Earbuds', N'Xiaomi', N'3,500', N'Xiaomi Store', N'buds2.jpg', N'buds1.jpg', N'buds3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (22, N'Levi''s Jeans', N'Fashion', N'Men''s Clothing', N'Levi''s', N'2,499', N'Myntra', N'jeans1.jpg', N'jeans2.jpg', N'jeans3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (23, N'Spykar Jeans', N'Fashion', N'Men''s Clothing', N'Spykar', N'900', N'Amazon', N'jeans2.jpg', N'jeans3.jpg', N'jeans4.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (24, N'strip Jeans', N'Fashion', N'Men''s Clothing', N'Jack & Jones', N'1,500', N'FlipKart', N'jeans3.jpg', N'jeans4.jpg', N'jeans2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (25, N'Formal Jeans', N'Fashion', N'Men''s Clothing', N'Raymond', N'2,000', N'Raymond Store', N'jeans4.jpg', N'jeans1.jpg', N'jeans3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (26, N'Casual Jeans', N'Fashion', N'Men''s Clothing', N'Calvin Klein', N'800', N'Zudio', N'jeans3.jpg', N'jeans2.jpg', N'jeans1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (27, N'Zara Dress', N'Fashion', N'Women''s Clothing', N'Zara', N'3,999', N'Zara store', N'dress1.jpg', N'dress2.jpg', N'dress4.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (28, N'Party Dress', N'Fashion', N'Women''s Clothing', N'Zara', N'4,999', N'Zara store', N'dress2.jpg', N'dress1.jpg', N'dress3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (29, N'Umbrella Dress', N'Fashion', N'Women''s Clothing', N'Zudio', N'4,000', N'Zudio', N'dress3.jpg', N'dress2.jpg', N'dress1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (30, N'Yellow Dress', N'Fashion', N'Women''s Clothing', N'Zudio', N'1,000', N'Zudio', N'dress4.jpg', N'dress3.jpg', N'dress2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (31, N'Nike Casual Shoes', N'Fashion', N'Footware', N'Nike', N'800', N'Nike Store', N'shoe2.jpg', N'shoe3.jpg', N'shoe1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (32, N'Bata Formal Shoe', N'Fashion', N'Footware', N'Bata', N'1,000', N'Bata Store', N'shoe1.jpg', N'shoe3.jpg', N'shoe2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (33, N'Puma Sport Shoe', N'Fashion', N'Footware', N'Puma', N'900', N'Puma Store', N'shoe3.jpg', N'shoe4.jpg', N'shoe2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (34, N'Skechers Track Shoe', N'Fashion', N'Footware', N'Skechers', N'1,000', N'Skechers Store', N'shoe4.jpg', N'shoe3.jpg', N'shoe2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (35, N'Sneaker', N'Fashion', N'Footware', N'Puma', N'2,500', N'Puma Store', N'shoe1.jpg', N'shoe4.jpg', N'shoe2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (36, N'Chairs', N'Furniture', N'Chairs', N'BrandA', N'500', N'Amazon', N'chair1.jpg', N'chair3.jpg', N'chair4.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (37, N'Beds', N'Furniture', N'Beds', N'BrandA', N'1,000', N'Amazon', N'bed1.jpg', N'sofa2.jpg', N'sofa3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (38, N'Sofas', N'Furniture', N'Sofas', N'BrandA', N'900', N'Amazon', N'sofa1.jpg', N'sofa2.jpg', N'sofa3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (39, N'Tables', N'Furniture', N'Tables', N'BrandA', N'700', N'Amazon', N'table1.jpg', N'table2.jpg', N'table3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (40, N'Gaming Chair', N'Furniture', N'Chairs', N'BrandA', N'1,500', N'FlipKart', N'chair4.jpg', N'chair2.jpg', N'chair1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (41, N'Black Chair', N'Furniture', N'Chairs', N'BrandA', N'900', N'FlipKart', N'chair2.jpg', N'chair4.jpg', N'chair1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (42, N'Wooden Chair', N'Furniture', N'Chairs', N'BrandA', N'200', N'FlipKart', N'chair3.jpg', N'chair1.jpg', N'chair2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (43, N'L sofa', N'Furniture', N'Sofas', N'BrandA', N'1,000', N'Amazon', N'sofa2.jpg', N'sofa3.jpg', N'sofa1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (44, N'small sofa', N'Furniture', N'Sofas', N'BrandA', N'900', N'ikia', N'sofa3.jpg', N'sofa1.jpg', N'sofa2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (45, N'Wooden Table', N'Furniture', N'Tables', N'BrandA', N'1,500', N'ikia', N'table2.jpg', N'table1.jpg', N'table3.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (46, N'large Table', N'Furniture', N'Tables', N'BrandA', N'1,000', N'ikia', N'table3.jpg', N'table2.jpg', N'table1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (47, N'small cupboard', N'Furniture', N'cupboard', N'BrandA', N'900', N'Amazon', N'cb1.png', N'cb3.jpg', N'cb2.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (48, N'medium cupboard', N'Furniture', N'cupboard', N'BrandA', N'1,000', N'FlipKart', N'cb2.jpg', N'cb1.png', NULL)
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (49, N'transparent cupboard', N'Furniture', N'cupboard', N'BrandA', N'1,500', N'ikia', N'cb3.jpg', N'cb2.jpg', N'cb1.png')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (50, N'casual jeans', N'Fashion', N'Men''s Clothing', N'Raymond', N'1,500', N'Amazon', N'jeans3.jpg', N'jeans2.jpg', N'jeans1.jpg')
INSERT [dbo].[Product] ([Pid], [Pname], [Cat], [Subcat], [Brand], [Price], [Sellername], [Photo1], [Photo2], [Photo3]) VALUES (51, N'loose jeans', N'Fashion', N'Men''s Clothing', N'Raymond', N'1,000', N'FlipKart', N'jeans2.jpg', N'jeans3.jpg', N'jeans1.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Uid], [Name], [Contact], [Email], [Password]) VALUES (1, N'abc', N'9988772323', N'abc@gmail.com', N'123')
INSERT [dbo].[User] ([Uid], [Name], [Contact], [Email], [Password]) VALUES (2, N'xyz', N'986754231', N'xyz@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Order] ON 

INSERT [dbo].[User_Order] ([Oid], [Uid], [TotalItems], [TotalPrice], [DateTime], [Status]) VALUES (1, 1, N'1', N'800', N'1-12-24', N'success')
INSERT [dbo].[User_Order] ([Oid], [Uid], [TotalItems], [TotalPrice], [DateTime], [Status]) VALUES (2, 1, N'1', N'1,000', N'2-12-24', N'success')
INSERT [dbo].[User_Order] ([Oid], [Uid], [TotalItems], [TotalPrice], [DateTime], [Status]) VALUES (3, 1, N'1', N'2,000', N'3-12-24', N'success')
INSERT [dbo].[User_Order] ([Oid], [Uid], [TotalItems], [TotalPrice], [DateTime], [Status]) VALUES (5, 1, N'2', N'1,700', N'3-12-24', N'success')
INSERT [dbo].[User_Order] ([Oid], [Uid], [TotalItems], [TotalPrice], [DateTime], [Status]) VALUES (6, 2, N'1', N'200', N'3-12-24', N'success')
SET IDENTITY_INSERT [dbo].[User_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Search] ON 

INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (1, 1, 1)
INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (2, 1, 11)
INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (3, 1, 7)
INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (4, 1, 20)
INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (5, 2, 21)
INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (6, 2, 3)
INSERT [dbo].[User_Search] ([Id], [Uid], [Pid]) VALUES (7, 1, 19)
SET IDENTITY_INSERT [dbo].[User_Search] OFF
GO
USE [master]
GO
ALTER DATABASE [DataAnalaysis] SET  READ_WRITE 
GO
