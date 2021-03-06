USE [master]
GO
/****** Object:  Database [WAREHOUSE]    Script Date: 6/12/2017 11:13:03 AM ******/
CREATE DATABASE [WAREHOUSE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WAREHOUSE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WAREHOUSE.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WAREHOUSE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WAREHOUSE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WAREHOUSE] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WAREHOUSE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WAREHOUSE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WAREHOUSE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WAREHOUSE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WAREHOUSE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WAREHOUSE] SET ARITHABORT OFF 
GO
ALTER DATABASE [WAREHOUSE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WAREHOUSE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WAREHOUSE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WAREHOUSE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WAREHOUSE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WAREHOUSE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WAREHOUSE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WAREHOUSE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WAREHOUSE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WAREHOUSE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WAREHOUSE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WAREHOUSE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WAREHOUSE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WAREHOUSE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WAREHOUSE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WAREHOUSE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WAREHOUSE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WAREHOUSE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WAREHOUSE] SET  MULTI_USER 
GO
ALTER DATABASE [WAREHOUSE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WAREHOUSE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WAREHOUSE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WAREHOUSE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WAREHOUSE] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WAREHOUSE]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MaincategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryMain]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryMain](
	[MainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MaincategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_maincategory] PRIMARY KEY CLUSTERED 
(
	[MainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategorySub]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategorySub](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_subcategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyInformation]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyInformation](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[AddressOptional] [varchar](50) NULL,
	[Mobile] [varchar](50) NOT NULL,
	[MobileOptional] [varchar](50) NULL,
	[Phone] [varchar](50) NOT NULL,
	[PhoneOptional] [varchar](50) NULL,
	[Fax] [varchar](50) NOT NULL,
	[FaxOptional] [varchar](50) NULL,
	[VatNo] [varchar](50) NOT NULL,
	[TradeLicense] [varchar](50) NOT NULL,
	[TinNo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Website] [varchar](50) NULL,
	[VatRate] [float] NULL,
	[Status] [int] NOT NULL,
	[Image] [image] NULL,
	[IsShowRoom] [int] NULL,
 CONSTRAINT [PK_company_info] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[GroupName] [varchar](100) NULL,
	[CompanyName] [varchar](100) NULL,
	[CustomerName] [varchar](100) NULL,
	[Gender] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[VatRegNo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](500) NULL,
	[PreviousDue] [float] NULL,
 CONSTRAINT [PK_buyer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DamageProductReceive]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DamageProductReceive](
	[DamageProductID] [int] IDENTITY(1,1) NOT NULL,
	[DamageProductNo] [varchar](50) NULL,
	[CompanyID] [int] NULL,
	[DamageProductDate] [varchar](50) NULL,
	[SupplierID] [int] NULL,
	[InvoiceNo] [varchar](150) NULL,
	[DamageProductRemarks] [varchar](50) NULL,
	[DamageProductProductID] [int] NULL,
	[DamageProductPrice] [float] NULL,
	[DamageProductQuantity] [float] NULL,
	[DamageProductTotal] [float] NULL,
 CONSTRAINT [PK_DamageProductReceive] PRIMARY KEY CLUSTERED 
(
	[DamageProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationMainID] [int] NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocationMain]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocationMain](
	[LocationMainID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[LocationMainName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_main_location] PRIMARY KEY CLUSTERED 
(
	[LocationMainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocationSub]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocationSub](
	[LocationSubID] [int] IDENTITY(1,1) NOT NULL,
	[LocationMainID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[LocationSubName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sub_location] PRIMARY KEY CLUSTERED 
(
	[LocationSubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MainCateID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[PurchasePrice] [float] NULL,
	[SalePrice] [float] NULL,
	[Description] [varchar](50) NULL,
	[UnitID] [int] NULL,
	[MinimumProductQuantity] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_product_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ProductDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[WarehouseID] [int] NULL,
	[RackID] [int] NULL,
	[CellID] [int] NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseNo] [varchar](50) NULL,
	[CompanyID] [int] NULL,
	[PurchaseDate] [varchar](50) NULL,
	[SupplierID] [int] NULL,
	[PurchaseSupplierInvoiceNo] [varchar](150) NULL,
	[PurchaseRemarks] [varchar](50) NULL,
	[PurchaseProductID] [int] NULL,
	[PurchaseProductPrice] [float] NULL,
	[PurchaseQuantity] [float] NULL,
	[PurchaseTotal] [float] NULL,
	[PurchaseWarehouseID] [int] NULL,
	[PurchaseFloorID] [int] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseReturn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Date] [varchar](50) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Purchase_Return] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[SalesNo] [varchar](50) NULL,
	[SalesDate] [varchar](50) NULL,
	[SalesTime] [varchar](50) NULL,
	[SalesCustomerID] [int] NULL,
	[SalesRemarks] [varchar](500) NULL,
	[Reference] [varchar](150) NULL,
	[SalesProductID] [int] NULL,
	[SalesPurchasePrice] [float] NULL,
	[SalesSalePrice] [float] NULL,
	[SalesQuantity] [float] NULL,
	[SalesProductDiscount] [float] NULL,
	[SalesTotal] [float] NULL,
	[SalesCustomerName] [varchar](50) NULL,
	[SalesSoldBy] [varchar](50) NULL,
	[SalesReceivedAmount] [float] NULL,
	[SalesChangeAmount] [float] NULL,
	[SalesVatRate] [float] NULL,
	[SalesVatTotal] [float] NULL,
	[SalesPuechaseBy] [varchar](50) NULL,
	[SalesPurchaseByContact] [varchar](50) NULL,
	[PaymentType] [int] NULL CONSTRAINT [DF_Sales_IsChequeReceive]  DEFAULT ((0)),
	[WareHouseID] [int] NULL,
	[FloorID] [int] NULL,
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Date] [varchar](50) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Sales_Return] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [varchar](50) NULL,
	[SupplierName] [varchar](50) NULL,
	[SupplierContactPerson] [varchar](50) NULL,
	[SupplierPhone] [varchar](50) NULL,
	[SupplierVatRegNo] [varchar](50) NULL,
	[SupplierEmail] [varchar](50) NULL,
	[SupplierAddress] [varchar](50) NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](50) NOT NULL,
	[UnitValue] [float] NULL,
 CONSTRAINT [PK_unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Date] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccessAreaNew]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccessAreaNew](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[A1] [int] NULL,
	[A2] [int] NULL,
	[A3] [int] NULL,
	[A4] [int] NULL,
	[A5] [int] NULL,
	[A6] [int] NULL,
	[A7] [int] NULL,
	[A8] [int] NULL,
	[A9] [int] NULL,
	[A10] [int] NULL,
	[A11] [int] NULL,
	[A12] [int] NULL,
	[A13] [int] NULL,
	[A14] [int] NULL,
	[A15] [int] NULL,
	[A16] [int] NULL,
	[A17] [int] NULL,
	[A18] [int] NULL,
	[A19] [int] NULL,
	[A20] [int] NULL,
	[A21] [int] NULL,
	[A22] [int] NULL,
	[A23] [int] NULL,
	[A24] [int] NULL,
	[A25] [int] NULL,
	[A26] [int] NULL,
	[A27] [int] NULL,
	[A28] [int] NULL,
	[A29] [int] NULL,
	[A30] [int] NULL,
	[A31] [int] NULL,
	[A32] [int] NULL,
	[A33] [int] NULL,
	[A34] [int] NULL,
	[A35] [int] NULL,
	[A36] [int] NULL,
	[A37] [int] NULL,
	[A38] [int] NULL,
	[A39] [int] NULL,
	[A40] [int] NULL,
	[A41] [int] NULL,
	[A42] [int] NULL,
	[A43] [int] NULL,
 CONSTRAINT [PK_NewUserAccess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[LoginTime] [varchar](50) NOT NULL,
	[LogoutTime] [varchar](50) NULL,
	[ComputerName] [varchar](50) NULL,
	[MacAddress] [varchar](50) NULL,
	[LocalIpAddress] [varchar](50) NOT NULL,
	[RealIpAddress] [varchar](50) NULL CONSTRAINT [DF_UserLog_RealIpAddress]  DEFAULT ('1.2.3.4'),
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [MaincategoryID], [CategoryName]) VALUES (1, 1, N'Mobile')
INSERT [dbo].[Category] ([CategoryID], [MaincategoryID], [CategoryName]) VALUES (2, 2, N'Raimbow')
INSERT [dbo].[Category] ([CategoryID], [MaincategoryID], [CategoryName]) VALUES (3, 2, N'Mmebiang')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CategoryMain] ON 

INSERT [dbo].[CategoryMain] ([MainCategoryID], [MaincategoryName]) VALUES (1, N'Electrnocs')
INSERT [dbo].[CategoryMain] ([MainCategoryID], [MaincategoryName]) VALUES (2, N'China Bazar')
SET IDENTITY_INSERT [dbo].[CategoryMain] OFF
SET IDENTITY_INSERT [dbo].[CategorySub] ON 

INSERT [dbo].[CategorySub] ([SubCategoryID], [MainCategoryID], [CategoryID], [SubCategoryName]) VALUES (1, 1, 1, N'IPhone')
INSERT [dbo].[CategorySub] ([SubCategoryID], [MainCategoryID], [CategoryID], [SubCategoryName]) VALUES (2, 2, 2, N'Cm-D29AS')
SET IDENTITY_INSERT [dbo].[CategorySub] OFF
SET IDENTITY_INSERT [dbo].[CompanyInformation] ON 

INSERT [dbo].[CompanyInformation] ([CompanyID], [Name], [Address], [AddressOptional], [Mobile], [MobileOptional], [Phone], [PhoneOptional], [Fax], [FaxOptional], [VatNo], [TradeLicense], [TinNo], [Email], [Website], [VatRate], [Status], [Image], [IsShowRoom]) VALUES (7, N'Chaina Bazar', N'Chaina bazar, Dhaka', NULL, N'9093454545', N'022323', N'01988878778', N'99993434', N'faz', NULL, N'344', N'334', N'55533', N'chainaBazar@mail.com', N'chainabazar.com', 1223, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CompanyInformation] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CompanyID], [GroupName], [CompanyName], [CustomerName], [Gender], [Phone], [VatRegNo], [Email], [Address], [PreviousDue]) VALUES (1, 1, N'Mango group', N'Default Company', N'Mohon', N'Male', N'012346778', N'0102', N'mn.Mohon@gmail.com', N'dhaka', 0)
INSERT [dbo].[Customer] ([CustomerID], [CompanyID], [GroupName], [CompanyName], [CustomerName], [Gender], [Phone], [VatRegNo], [Email], [Address], [PreviousDue]) VALUES (2, 1, N'fgf', N'Default Company', N'aa', N'Male', N'565', N'565', N'adf', N'fgf', 0)
INSERT [dbo].[Customer] ([CustomerID], [CompanyID], [GroupName], [CompanyName], [CustomerName], [Gender], [Phone], [VatRegNo], [Email], [Address], [PreviousDue]) VALUES (3, 1, N'Mango group', N'Default Company', N'Mohon', N'Male', N'012356776', N'33345', N'mn.mohon@gmail.com', N'dhaka', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (1, 1, N'Khilgaon 12')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (2, 2, N'Gulshan Room 1')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (3, 3, N'dhan 1')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (4, 3, N'dhan 2')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (5, 2, N'Gulshan Room 2')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (6, 2, N'Gulshan Room 3')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (7, 1, N'Khilgaon 11')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (8, 4, N'Room 1')
INSERT [dbo].[Location] ([LocationID], [LocationMainID], [LocationName]) VALUES (9, 4, N'Room 2')
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[LocationMain] ON 

INSERT [dbo].[LocationMain] ([LocationMainID], [CompanyID], [LocationMainName]) VALUES (1, 1, N'Khilgaon')
INSERT [dbo].[LocationMain] ([LocationMainID], [CompanyID], [LocationMainName]) VALUES (2, 1, N'Gulshan')
INSERT [dbo].[LocationMain] ([LocationMainID], [CompanyID], [LocationMainName]) VALUES (3, 1, N'Dhanmondi')
INSERT [dbo].[LocationMain] ([LocationMainID], [CompanyID], [LocationMainName]) VALUES (4, 1, N'Bata')
SET IDENTITY_INSERT [dbo].[LocationMain] OFF
SET IDENTITY_INSERT [dbo].[LocationSub] ON 

INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (1, 2, 2, N'Gul Room 1 Cell 1')
INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (2, 1, 7, N'khil cell 1')
INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (3, 2, 2, N'khil cell 44')
INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (4, 3, 4, N'dhan1 cell 111')
INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (5, 1, 1, N'khilgaon cell 12')
INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (6, 2, 2, N'khil cell 411')
INSERT [dbo].[LocationSub] ([LocationSubID], [LocationMainID], [LocationID], [LocationSubName]) VALUES (7, 4, 8, N'Cell 1')
SET IDENTITY_INSERT [dbo].[LocationSub] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (1, 1, 1, 1, N'IPhone 3', N'P0001', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (2, 1, 1, 1, N'IPhone 4', N'P0002', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (3, 1, 1, 1, N'IPhone 5', N'P0003', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (4, 1, 1, 1, N'IPhone 6', N'P0004', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (5, 1, 1, 1, N'BASE OF CHAIR', N'P0005', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (6, 2, 2, 2, N'GAS LIFT OF CHAIR', N'P0006', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (7, 2, 2, 2, N'BACK METAL OF CHAIR', N'P0007', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (8, 2, 2, 2, N'ARM OF CHAIR', N'P0008', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (9, 2, 2, 2, N'FITTINGS OF CHAIR', N'P0009', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (10, 2, 2, 2, N'CASTOT OF CHAIR', N'P0010', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (11, 2, 2, 2, N'SEAT COVER OF CHAIR', N'P0011', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (12, 2, 2, 2, N'BACK COVER OF CHAIR', N'P0012', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (13, 2, 2, 2, N'DUST COVER OF CHAIR', N'P0013', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (14, 2, 2, 2, N'BACK SUPPORT OF CHAIR', N'P0014', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (15, 2, 2, 2, N'MACHANISM OF CHAIR', N'P0015', 0, 0, N'0', 1, 0, 0)
INSERT [dbo].[Product] ([ID], [MainCateID], [CategoryID], [SubCategoryID], [Name], [Code], [PurchasePrice], [SalePrice], [Description], [UnitID], [MinimumProductQuantity], [Status]) VALUES (17, 2, 2, 2, N'Seat Cover', N'P0017', 0, 0, N'0', 2, 0, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (1, 1, 1, 1, 0, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (2, 1, 2, 2, 0, 50)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (3, 1, 3, 3, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (4, 1, 4, 8, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (5, 4, 1, 1, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (6, 3, 1, 1, 0, 65)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (7, 4, 3, 3, 0, 65)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (8, 3, 3, 3, 0, 32)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (9, 5, 1, 1, 0, 8)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (10, 6, 2, 2, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (11, 7, 2, 2, 0, 19)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (12, 8, 1, 1, 0, 5)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (13, 6, 1, 1, 0, 3)
INSERT [dbo].[ProductDetails] ([ProductDetailID], [ProductID], [WarehouseID], [RackID], [CellID], [Stock]) VALUES (14, 5, 1, 7, 0, 5)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (1, N'PUR01000001', 100, N'2017-05-21', 2, N'fgfdg', N'dfdsf', 1, 0, 184, 0, 1, 7)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (2, N'PUR01000001', 100, N'2017-05-21', 2, N'fgfdg', N'dfdsf', 2, 0, 6, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (3, N'PUR01000002', 100, N'2017-05-22', 2, N'qqw2323', N'', 1, 0, 22, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (4, N'PUR01000002', 100, N'2017-05-22', 2, N'qqw2323', N'', 3, 0, 8, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (5, N'PUR01000003', 100, N'2017-05-22', 3, N'jj', N'', 1, 0, 3, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (6, N'PUR01000004', 100, N'2017-05-22', 2, N'tgyhgj', N'', 1, 0, 7, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (7, N'PUR01000005', 100, N'2017-05-22', 2, N'hj', N'', 3, 0, 7, 0, 4, 8)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (8, N'PUR01000006', 100, N'2017-05-22', 2, N'hj', N'', 3, 0, 7, 0, 4, 8)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (9, N'PUR01000006', 100, N'2017-05-22', 2, N'hj', N'', 1, 0, 60, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (10, N'PUR01000006', 100, N'2017-05-22', 2, N'hj', N'', 1, 0, 60, 0, 2, 6)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (11, N'PUR01000007', 100, N'2017-05-22', 3, N'bvn', N'', 3, 0, 30, 0, 4, 8)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (12, N'PUR01000007', 100, N'2017-05-22', 3, N'bvn', N'', 1, 0, 60, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (13, N'PUR01000008', 100, N'2017-05-22', 3, N'bn', N'', 3, 0, 1, 0, 4, 8)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (14, N'PUR01000008', 100, N'2017-05-22', 3, N'bn', N'', 1, 0, 2, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (15, N'PUR01000009', 100, N'2017-05-22', 2, N'fdg', N'', 1, 0, 1, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (16, N'PUR01000010', 100, N'2017-05-22', 3, N'adf', N'', 2, 0, 2, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (17, N'PUR01000011', 100, N'2017-05-22', 2, N'fg', N'', 3, 0, 34, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (18, N'PUR01000012', 100, N'2017-05-22', 2, N'adf', N'', 2, 0, 3, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (19, N'PUR01000013', 100, N'2017-05-22', 2, N'ghgh', N'', 3, 0, 6, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (20, N'PUR01000013', 100, N'2017-05-22', 2, N'ghgh', N'', 16, 0, 6, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (21, N'PUR01000014', 100, N'2017-05-22', 3, N'fg', N'', 1, 0, 3, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (22, N'PUR01000015', 100, N'2017-05-22', 2, N'yyy', N'', 1, 0, 10, 0, 4, 8)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (23, N'PUR01000015', 100, N'2017-05-22', 2, N'yyy', N'', 16, 0, 10, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (24, N'PUR01000016', 100, N'2017-05-22', 3, N'fdg', N'', 1, 0, 1, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (25, N'PUR01000016', 100, N'2017-05-22', 3, N'fdg', N'', 16, 0, 5, 0, 2, 2)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (26, N'PUR01000016', 100, N'2017-05-22', 3, N'fdg', N'', 3, 0, 1, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (27, N'PUR01000017', 100, N'2017-05-23', 2, N'2433', N'', 1, 0, 60, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (28, N'PUR01000017', 100, N'2017-05-23', 2, N'2433', N'', 1, 0, 60, 0, 2, 2)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (29, N'PUR01000017', 100, N'2017-05-23', 2, N'2433', N'', 1, 0, 60, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (30, N'PUR01000018', 100, N'2017-05-23', 2, N'365', N'', 1, 0, 40, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (31, N'PUR01000018', 100, N'2017-05-23', 2, N'365', N'', 1, 0, 100, 0, 4, 8)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (32, N'PUR01000019', 100, N'2017-05-23', 2, N'565', N'', 4, 0, 15, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (33, N'PUR01000020', 100, N'2017-06-03', 2, N'zz', N'', 3, 0, 65, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (34, N'PUR01000020', 100, N'2017-06-03', 2, N'zz', N'', 4, 0, 65, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (35, N'PUR01000021', 100, N'2017-06-03', 2, N'22', N'', 3, 0, 32, 0, 3, 3)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (36, N'PUR01000022', 100, N'2017-06-04', 2, N'012', N'', 5, 0, 10, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (37, N'PUR01000022', 100, N'2017-06-04', 2, N'012', N'', 6, 0, 20, 0, 2, 2)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (38, N'PUR01000022', 100, N'2017-06-04', 2, N'012', N'', 7, 0, 25, 0, 2, 2)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (39, N'PUR01000022', 100, N'2017-06-04', 2, N'012', N'', 8, 0, 5, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (40, N'PUR01000023', 101, N'2017-06-07', 2, N'fdgd', N'', 5, 0, 8, 0, 1, 7)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (41, N'PUR01000023', 101, N'2017-06-07', 2, N'fdgd', N'', 6, 0, 6, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (42, N'PUR01000024', 100, N'2017-06-07', 2, N'dffdsg', N'', 5, 0, 6, 0, 1, 1)
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseNo], [CompanyID], [PurchaseDate], [SupplierID], [PurchaseSupplierInvoiceNo], [PurchaseRemarks], [PurchaseProductID], [PurchaseProductPrice], [PurchaseQuantity], [PurchaseTotal], [PurchaseWarehouseID], [PurchaseFloorID]) VALUES (43, N'PUR01000024', 100, N'2017-06-07', 2, N'dffdsg', N'', 5, 0, 6, 0, 1, 7)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SalesID], [CompanyID], [SalesNo], [SalesDate], [SalesTime], [SalesCustomerID], [SalesRemarks], [Reference], [SalesProductID], [SalesPurchasePrice], [SalesSalePrice], [SalesQuantity], [SalesProductDiscount], [SalesTotal], [SalesCustomerName], [SalesSoldBy], [SalesReceivedAmount], [SalesChangeAmount], [SalesVatRate], [SalesVatTotal], [SalesPuechaseBy], [SalesPurchaseByContact], [PaymentType], [WareHouseID], [FloorID]) VALUES (1, 100, N'01000001', N'2017-06-07', N'2:42:33 PM', 3, N'nice product', N'2334', 5, 0, 0, 4, 0, 0, N'Mohon', N'admin', 0, 0, 0, 0, N'rana', N'4546546', 0, 1, 1)
INSERT [dbo].[Sales] ([SalesID], [CompanyID], [SalesNo], [SalesDate], [SalesTime], [SalesCustomerID], [SalesRemarks], [Reference], [SalesProductID], [SalesPurchasePrice], [SalesSalePrice], [SalesQuantity], [SalesProductDiscount], [SalesTotal], [SalesCustomerName], [SalesSoldBy], [SalesReceivedAmount], [SalesChangeAmount], [SalesVatRate], [SalesVatTotal], [SalesPuechaseBy], [SalesPurchaseByContact], [PaymentType], [WareHouseID], [FloorID]) VALUES (2, 100, N'01000001', N'2017-06-07', N'2:42:33 PM', 3, N'nice product', N'2334', 5, 0, 0, 1, 0, 0, N'Mohon', N'admin', 0, 0, 0, 0, N'rana', N'4546546', 0, 1, 7)
INSERT [dbo].[Sales] ([SalesID], [CompanyID], [SalesNo], [SalesDate], [SalesTime], [SalesCustomerID], [SalesRemarks], [Reference], [SalesProductID], [SalesPurchasePrice], [SalesSalePrice], [SalesQuantity], [SalesProductDiscount], [SalesTotal], [SalesCustomerName], [SalesSoldBy], [SalesReceivedAmount], [SalesChangeAmount], [SalesVatRate], [SalesVatTotal], [SalesPuechaseBy], [SalesPurchaseByContact], [PaymentType], [WareHouseID], [FloorID]) VALUES (3, 100, N'01000001', N'2017-06-07', N'2:46:30 PM', 2, N'fdg', N'fgfdg', 5, 0, 0, 12, 0, 0, N'aa', N'admin', 0, 0, 0, 0, N'dfg', N'4545', 0, 1, 1)
INSERT [dbo].[Sales] ([SalesID], [CompanyID], [SalesNo], [SalesDate], [SalesTime], [SalesCustomerID], [SalesRemarks], [Reference], [SalesProductID], [SalesPurchasePrice], [SalesSalePrice], [SalesQuantity], [SalesProductDiscount], [SalesTotal], [SalesCustomerName], [SalesSoldBy], [SalesReceivedAmount], [SalesChangeAmount], [SalesVatRate], [SalesVatTotal], [SalesPuechaseBy], [SalesPurchaseByContact], [PaymentType], [WareHouseID], [FloorID]) VALUES (4, 100, N'01000001', N'2017-06-07', N'2:46:30 PM', 2, N'fdg', N'fgfdg', 6, 0, 0, 20, 0, 0, N'aa', N'admin', 0, 0, 0, 0, N'dfg', N'4545', 0, 2, 2)
INSERT [dbo].[Sales] ([SalesID], [CompanyID], [SalesNo], [SalesDate], [SalesTime], [SalesCustomerID], [SalesRemarks], [Reference], [SalesProductID], [SalesPurchasePrice], [SalesSalePrice], [SalesQuantity], [SalesProductDiscount], [SalesTotal], [SalesCustomerName], [SalesSoldBy], [SalesReceivedAmount], [SalesChangeAmount], [SalesVatRate], [SalesVatTotal], [SalesPuechaseBy], [SalesPurchaseByContact], [PaymentType], [WareHouseID], [FloorID]) VALUES (5, 101, N'01000002', N'2017-06-11', N'9:45:54 AM', 3, N'Product transfer', N'445566', 6, 0, 0, 3, 0, 0, N'Mohon', N'admin', 0, 0, 0, 0, N'Raju', N'01897788675 ', 0, 1, 1)
INSERT [dbo].[Sales] ([SalesID], [CompanyID], [SalesNo], [SalesDate], [SalesTime], [SalesCustomerID], [SalesRemarks], [Reference], [SalesProductID], [SalesPurchasePrice], [SalesSalePrice], [SalesQuantity], [SalesProductDiscount], [SalesTotal], [SalesCustomerName], [SalesSoldBy], [SalesReceivedAmount], [SalesChangeAmount], [SalesVatRate], [SalesVatTotal], [SalesPuechaseBy], [SalesPurchaseByContact], [PaymentType], [WareHouseID], [FloorID]) VALUES (6, 101, N'01000002', N'2017-06-11', N'9:45:54 AM', 3, N'Product transfer', N'445566', 7, 0, 0, 6, 0, 0, N'Mohon', N'admin', 0, 0, 0, 0, N'Raju', N'01897788675 ', 0, 2, 2)
SET IDENTITY_INSERT [dbo].[Sales] OFF
SET IDENTITY_INSERT [dbo].[SalesReturn] ON 

INSERT [dbo].[SalesReturn] ([ID], [CompanyID], [Date], [InvoiceNo], [ProductID], [SalePrice], [Quantity], [Discount], [Total]) VALUES (1, 100, N'2017-06-01', N'01000007', 1, 0, 1, 0, 0)
INSERT [dbo].[SalesReturn] ([ID], [CompanyID], [Date], [InvoiceNo], [ProductID], [SalePrice], [Quantity], [Discount], [Total]) VALUES (2, 100, N'2017-06-01', N'01000008', 1, 0, 2, 0, 0)
INSERT [dbo].[SalesReturn] ([ID], [CompanyID], [Date], [InvoiceNo], [ProductID], [SalePrice], [Quantity], [Discount], [Total]) VALUES (3, 100, N'2017-06-01', N'01000008', 1, 0, 2, 0, 0)
INSERT [dbo].[SalesReturn] ([ID], [CompanyID], [Date], [InvoiceNo], [ProductID], [SalePrice], [Quantity], [Discount], [Total]) VALUES (4, 100, N'2017-06-01', N'01000008', 1, 0, 2, 0, 0)
INSERT [dbo].[SalesReturn] ([ID], [CompanyID], [Date], [InvoiceNo], [ProductID], [SalePrice], [Quantity], [Discount], [Total]) VALUES (5, 100, N'2017-06-01', N'01000008', 1, 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[SalesReturn] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [CompanyID], [SupplierName], [SupplierContactPerson], [SupplierPhone], [SupplierVatRegNo], [SupplierEmail], [SupplierAddress]) VALUES (1, N'01', N'Select Supplier', N'Select Supplier', N'Select Supplier', N'Select Supplier', N'Select Supplier', N'Select Supplier')
INSERT [dbo].[Supplier] ([SupplierID], [CompanyID], [SupplierName], [SupplierContactPerson], [SupplierPhone], [SupplierVatRegNo], [SupplierEmail], [SupplierAddress]) VALUES (2, N'01', N'Square', N'Mr. Karim', N'01680073005', N'02586', N'munna@mail.com', N'khulna')
INSERT [dbo].[Supplier] ([SupplierID], [CompanyID], [SupplierName], [SupplierContactPerson], [SupplierPhone], [SupplierVatRegNo], [SupplierEmail], [SupplierAddress]) VALUES (3, N'01', N'Champaion', N'Mr. Sohel', N'0169666', N'8800', N'sohel@yahoo.com', N'Fokirapool')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitID], [UnitName], [UnitValue]) VALUES (1, N'PCS', NULL)
INSERT [dbo].[Unit] ([UnitID], [UnitName], [UnitValue]) VALUES (2, N'KG', NULL)
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [CompanyID], [Date], [Name], [Address], [Mobile], [Email], [Gender], [UserName], [Password], [Role], [Image]) VALUES (1, 100, N'2017-05-17', N'Kamrul', N'Dhanmondi', N'01911713686', N'arifcs22@yahoo.com', N'Male', N'admin', N'1', 4, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserLog] ON 

INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (1, N'admin', 420, N'May 21 2017 12:12PM', N'May 21 2017 12:12PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (2, N'admin', 100, N'May 21 2017 12:14PM', N'May 21 2017 12:14PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (3, N'admin', 100, N'May 21 2017 12:19PM', N'May 21 2017 12:19PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (4, N'admin', 100, N'May 21 2017 12:19PM', N'May 21 2017 12:19PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (5, N'admin', 100, N'May 21 2017 12:20PM', N'May 21 2017 12:20PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (6, N'admin', 100, N'May 21 2017 12:25PM', N'May 21 2017 12:25PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (7, N'admin', 100, N'May 21 2017 12:31PM', N'May 21 2017 12:31PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (8, N'admin', 100, N'May 21 2017 12:33PM', N'May 21 2017 12:33PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (9, N'admin', 100, N'May 21 2017 12:36PM', N'May 21 2017 12:36PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (10, N'admin', 100, N'May 21 2017 12:46PM', N'May 21 2017 12:46PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (11, N'admin', 100, N'May 21 2017 12:50PM', N'May 21 2017 12:50PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (12, N'admin', 100, N'May 21 2017 12:51PM', N'May 21 2017 12:51PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (13, N'admin', 100, N'May 21 2017 12:54PM', N'May 21 2017 12:54PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (14, N'admin', 100, N'May 21 2017 12:55PM', N'May 21 2017 12:55PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (15, N'admin', 100, N'May 21 2017 12:57PM', N'May 21 2017 12:57PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (16, N'admin', 100, N'May 21 2017 12:58PM', N'May 21 2017 12:58PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (17, N'admin', 100, N'May 21 2017  1:39PM', N'May 21 2017  1:39PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (18, N'admin', 100, N'May 21 2017  1:40PM', N'May 21 2017  1:40PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (19, N'admin', 100, N'May 21 2017  1:40PM', N'May 21 2017  1:40PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (20, N'admin', 100, N'May 21 2017  1:41PM', N'May 21 2017  1:41PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (21, N'admin', 100, N'May 21 2017  1:48PM', N'May 21 2017  1:48PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (22, N'admin', 100, N'May 21 2017  2:31PM', N'May 21 2017  2:31PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (23, N'admin', 100, N'May 21 2017  2:39PM', N'May 21 2017  2:39PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (24, N'admin', 100, N'May 21 2017  2:39PM', N'May 21 2017  2:39PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (25, N'admin', 100, N'May 21 2017  2:41PM', N'May 21 2017  2:41PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (26, N'admin', 100, N'May 21 2017  2:44PM', N'May 21 2017  2:44PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (27, N'admin', 100, N'May 21 2017  2:45PM', N'May 21 2017  2:45PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (28, N'admin', 100, N'May 21 2017  3:10PM', N'May 21 2017  3:10PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (29, N'admin', 100, N'May 21 2017  3:21PM', N'May 21 2017  3:21PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (30, N'admin', 100, N'May 21 2017  3:23PM', N'May 21 2017  3:23PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (31, N'admin', 100, N'May 21 2017  3:26PM', N'May 21 2017  3:26PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (32, N'admin', 100, N'May 21 2017  3:28PM', N'May 21 2017  3:28PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (33, N'admin', 100, N'May 21 2017  3:28PM', N'May 21 2017  3:28PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (34, N'admin', 100, N'May 21 2017  3:29PM', N'May 21 2017  3:29PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (35, N'admin', 100, N'May 21 2017  3:30PM', N'May 21 2017  3:30PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (36, N'admin', 100, N'May 21 2017  3:50PM', N'May 21 2017  3:50PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (37, N'admin', 100, N'May 21 2017  3:51PM', N'May 21 2017  3:51PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (38, N'admin', 100, N'May 21 2017  4:38PM', N'May 21 2017  4:38PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (39, N'admin', 100, N'May 23 2017 12:28PM', N'May 23 2017 12:28PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (40, N'admin', 100, N'May 23 2017  4:34PM', N'May 23 2017  4:34PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (41, N'admin', 100, N'May 24 2017  1:32PM', N'May 24 2017  1:32PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (42, N'admin', 101, N'May 24 2017  1:45PM', N'May 24 2017  1:45PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (43, N'admin', 101, N'May 24 2017  1:48PM', N'May 24 2017  1:48PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (44, N'admin', 101, N'May 24 2017  2:52PM', N'May 24 2017  2:52PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (45, N'admin', 101, N'May 24 2017  2:53PM', N'May 24 2017  2:53PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (46, N'admin', 101, N'May 24 2017  3:02PM', N'May 24 2017  3:02PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (47, N'admin', 101, N'May 24 2017  3:03PM', N'May 24 2017  3:03PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (48, N'admin', 101, N'May 24 2017  3:04PM', N'May 24 2017  3:04PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (49, N'admin', 100, N'May 24 2017  3:19PM', N'May 24 2017  3:19PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (50, N'admin', 100, N'May 24 2017  3:37PM', N'May 24 2017  3:37PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (51, N'admin', 100, N'May 24 2017  3:38PM', N'May 24 2017  3:38PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (52, N'admin', 100, N'May 29 2017  2:47PM', N'May 29 2017  2:47PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (53, N'admin', 100, N'May 29 2017  3:01PM', N'May 29 2017  3:01PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (54, N'admin', 100, N'May 29 2017  3:01PM', N'May 29 2017  3:01PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (55, N'admin', 100, N'May 29 2017  3:03PM', N'May 29 2017  3:03PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (56, N'admin', 100, N'May 29 2017  3:13PM', N'May 29 2017  3:13PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (57, N'admin', 100, N'May 31 2017 11:07AM', N'May 31 2017 11:07AM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (58, N'admin', 100, N'May 31 2017 11:19AM', N'May 31 2017 11:19AM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (59, N'admin', 100, N'Jun  1 2017  3:50PM', N'Jun  1 2017  3:50PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (60, N'admin', 100, N'Jun  3 2017  2:08PM', N'Jun  3 2017  2:08PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (61, N'admin', 100, N'Jun  3 2017  2:35PM', N'Jun  3 2017  2:35PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (62, N'admin', 100, N'Jun  4 2017 11:30AM', N'Jun  4 2017 11:30AM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (63, N'admin', 100, N'Jun  5 2017 11:39AM', N'Jun  5 2017 11:39AM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (64, N'admin', 100, N'Jun  6 2017 10:31AM', N'Jun  6 2017 10:31AM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (65, N'admin', 100, N'Jun  6 2017 12:10PM', N'Jun  6 2017 12:10PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (66, N'admin', 100, N'Jun  6 2017 12:15PM', N'Jun  6 2017 12:15PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (67, N'admin', 100, N'Jun  6 2017  3:25PM', N'Jun  6 2017  3:25PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (68, N'admin', 101, N'Jun  7 2017 12:04PM', N'Jun  7 2017 12:04PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (69, N'admin', 101, N'Jun  7 2017 12:13PM', N'Jun  7 2017 12:13PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (70, N'admin', 100, N'Jun  7 2017 12:24PM', N'Jun  7 2017 12:24PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (71, N'admin', 100, N'Jun  7 2017 12:31PM', N'Jun  7 2017 12:31PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (72, N'admin', 100, N'Jun  7 2017 12:31PM', N'Jun  7 2017 12:31PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (73, N'admin', 100, N'Jun  7 2017 12:44PM', N'Jun  7 2017 12:44PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (74, N'admin', 100, N'Jun  7 2017 12:57PM', N'Jun  7 2017 12:57PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (75, N'admin', 100, N'Jun  7 2017  1:01PM', N'Jun  7 2017  1:01PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (76, N'admin', 100, N'Jun  7 2017  1:03PM', N'Jun  7 2017  1:03PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (77, N'admin', 100, N'Jun  7 2017  1:08PM', N'Jun  7 2017  1:08PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (78, N'admin', 100, N'Jun  7 2017  1:35PM', N'Jun  7 2017  1:35PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (79, N'admin', 100, N'Jun  7 2017  2:42PM', N'Jun  7 2017  2:42PM', N'Kamrul-PC', N'408D5C3D4380', N'192.168.1.76', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (80, N'admin', 101, N'Jun 10 2017  9:52AM', N'Jun 10 2017  9:52AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (81, N'admin', 101, N'Jun 10 2017  9:53AM', N'Jun 10 2017  9:53AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (82, N'admin', 101, N'Jun 10 2017  9:56AM', N'Jun 10 2017  9:56AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (83, N'admin', 101, N'Jun 10 2017  9:59AM', N'Jun 10 2017  9:59AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (84, N'admin', 101, N'Jun 10 2017 10:03AM', N'Jun 10 2017 10:03AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (85, N'admin', 101, N'Jun 10 2017 10:07AM', N'Jun 10 2017 10:07AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (86, N'admin', 101, N'Jun 10 2017 10:11AM', N'Jun 10 2017 10:11AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (87, N'admin', 101, N'Jun 10 2017 10:11AM', N'Jun 10 2017 10:11AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (88, N'admin', 101, N'Jun 10 2017 10:14AM', N'Jun 10 2017 10:14AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (89, N'admin', 101, N'Jun 10 2017 10:42AM', N'Jun 10 2017 10:42AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (90, N'admin', 101, N'Jun 10 2017 12:43PM', N'Jun 10 2017 12:43PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (91, N'admin', 101, N'Jun 10 2017  1:03PM', N'Jun 10 2017  1:03PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (92, N'admin', 101, N'Jun 10 2017  1:10PM', N'Jun 10 2017  1:10PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (93, N'admin', 101, N'Jun 10 2017  1:13PM', N'Jun 10 2017  1:13PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (94, N'admin', 101, N'Jun 10 2017  1:17PM', N'Jun 10 2017  1:17PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (95, N'admin', 101, N'Jun 10 2017  1:25PM', N'Jun 10 2017  1:25PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (96, N'admin', 101, N'Jun 10 2017  1:35PM', N'Jun 10 2017  1:35PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (97, N'admin', 101, N'Jun 10 2017  1:41PM', N'Jun 10 2017  1:41PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (98, N'admin', 101, N'Jun 10 2017  1:44PM', N'Jun 10 2017  1:44PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (99, N'admin', 101, N'Jun 10 2017  1:45PM', N'Jun 10 2017  1:45PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
GO
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (100, N'admin', 101, N'Jun 10 2017  1:49PM', N'Jun 10 2017  1:49PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (101, N'admin', 101, N'Jun 10 2017  1:50PM', N'Jun 10 2017  1:50PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (102, N'admin', 101, N'Jun 10 2017  1:53PM', N'Jun 10 2017  1:53PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (103, N'admin', 101, N'Jun 10 2017  2:22PM', N'Jun 10 2017  2:22PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (104, N'admin', 101, N'Jun 10 2017  2:27PM', N'Jun 10 2017  2:27PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (105, N'admin', 101, N'Jun 10 2017  2:28PM', N'Jun 10 2017  2:28PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (106, N'admin', 101, N'Jun 10 2017  3:39PM', N'Jun 10 2017  3:39PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (107, N'admin', 101, N'Jun 10 2017  3:46PM', N'Jun 10 2017  3:46PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (108, N'admin', 101, N'Jun 10 2017  4:08PM', N'Jun 10 2017  4:08PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (109, N'admin', 101, N'Jun 10 2017  4:15PM', N'Jun 10 2017  4:15PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (110, N'admin', 101, N'Jun 11 2017  9:45AM', N'Jun 11 2017  9:45AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (111, N'admin', 101, N'Jun 11 2017  9:52AM', N'Jun 11 2017  9:52AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (112, N'admin', 101, N'Jun 11 2017  9:55AM', N'Jun 11 2017  9:55AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (113, N'admin', 101, N'Jun 11 2017  9:59AM', N'Jun 11 2017  9:59AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (114, N'admin', 101, N'Jun 11 2017 10:11AM', N'Jun 11 2017 10:11AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (115, N'admin', 101, N'Jun 11 2017 11:27AM', N'Jun 11 2017 11:27AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (116, N'admin', 101, N'Jun 11 2017 11:28AM', N'Jun 11 2017 11:28AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (117, N'admin', 101, N'Jun 11 2017 11:31AM', N'Jun 11 2017 11:31AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (118, N'admin', 101, N'Jun 11 2017 11:32AM', N'Jun 11 2017 11:32AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (119, N'admin', 101, N'Jun 11 2017 11:45AM', N'Jun 11 2017 11:45AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (120, N'admin', 101, N'Jun 11 2017 11:46AM', N'Jun 11 2017 11:46AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (121, N'admin', 101, N'Jun 11 2017 11:56AM', N'Jun 11 2017 11:56AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (122, N'admin', 101, N'Jun 11 2017 12:03PM', N'Jun 11 2017 12:03PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (123, N'admin', 101, N'Jun 11 2017 12:05PM', N'Jun 11 2017 12:05PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (124, N'admin', 101, N'Jun 11 2017 12:09PM', N'Jun 11 2017 12:09PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (125, N'admin', 101, N'Jun 11 2017 12:10PM', N'Jun 11 2017 12:10PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (126, N'admin', 101, N'Jun 11 2017 12:10PM', N'Jun 11 2017 12:10PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (127, N'admin', 101, N'Jun 11 2017 12:12PM', N'Jun 11 2017 12:12PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (128, N'admin', 101, N'Jun 11 2017 12:14PM', N'Jun 11 2017 12:14PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (129, N'admin', 101, N'Jun 11 2017 12:21PM', N'Jun 11 2017 12:21PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (130, N'admin', 101, N'Jun 11 2017 12:24PM', N'Jun 11 2017 12:24PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (131, N'admin', 101, N'Jun 11 2017 12:36PM', N'Jun 11 2017 12:36PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (132, N'admin', 101, N'Jun 11 2017 12:37PM', N'Jun 11 2017 12:37PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (133, N'admin', 101, N'Jun 11 2017 12:39PM', N'Jun 11 2017 12:39PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (134, N'admin', 101, N'Jun 11 2017 12:42PM', N'Jun 11 2017 12:42PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (135, N'admin', 101, N'Jun 11 2017 12:43PM', N'Jun 11 2017 12:43PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (136, N'admin', 101, N'Jun 11 2017 12:44PM', N'Jun 11 2017 12:44PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (137, N'admin', 101, N'Jun 11 2017 12:45PM', N'Jun 11 2017 12:45PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (138, N'admin', 101, N'Jun 11 2017 12:49PM', N'Jun 11 2017 12:49PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (139, N'admin', 101, N'Jun 11 2017 12:51PM', N'Jun 11 2017 12:51PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (140, N'admin', 101, N'Jun 11 2017 12:52PM', N'Jun 11 2017 12:52PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (141, N'admin', 101, N'Jun 11 2017  2:09PM', N'Jun 11 2017  2:09PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (142, N'admin', 101, N'Jun 11 2017  2:34PM', N'Jun 11 2017  2:34PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (143, N'admin', 101, N'Jun 11 2017  3:32PM', N'Jun 11 2017  3:32PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (144, N'admin', 101, N'Jun 11 2017  3:33PM', N'Jun 11 2017  3:33PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (145, N'admin', 101, N'Jun 11 2017  3:40PM', N'Jun 11 2017  3:40PM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (146, N'admin', 101, N'Jun 12 2017 10:52AM', N'Jun 12 2017 10:52AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
INSERT [dbo].[UserLog] ([ID], [UserName], [CompanyID], [LoginTime], [LogoutTime], [ComputerName], [MacAddress], [LocalIpAddress], [RealIpAddress], [Status]) VALUES (147, N'admin', 101, N'Jun 12 2017 11:06AM', N'Jun 12 2017 11:06AM', N'MOHON-PC', N'408D5C3D42D4', N'192.168.1.73', N'1.2.3.4', N'1')
SET IDENTITY_INSERT [dbo].[UserLog] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Product_Code]    Script Date: 6/12/2017 11:13:03 AM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UK_Product_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sales_report]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[sales_report] 
@SalesNo varchar(50)
as
begin

select Category.CategoryName,CategorySub.SubCategoryName, Product.Name, 
LocationMain.LocationMainName, Location.LocationName , Sales.SalesQuantity,
Sales.SalesPuechaseBy,Sales.SalesPurchaseByContact,Sales.SalesDate,Sales.SalesTime,
Sales.SalesNo,Customer.CustomerName
 from Product
inner join Category
on Product.CategoryID = Category.CategoryID
inner join CategorySub
on Product.SubCategoryID = CategorySub.SubCategoryID
inner join Sales
on Product.ID = Sales.SalesProductID 
inner join LocationMain
on LocationMain.LocationMainID = Sales.WareHouseID
inner join Location
on Location.LocationID = Sales.FloorID
inner join Customer
on Sales.SalesCustomerID = Customer.CustomerID
where Sales.SalesNo = @SalesNo
end
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseReport]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PurchaseReport]
	@purchase_no varchar(30)
AS
BEGIN
	SELECT PurchaseNo as 'Purchase_No', PurchaseSupplierInvoiceNo as 'Supplier_Invoice_No', PurchaseDate as 'Purchase_Date',  Product.Code as 'Product_Code', Product.Name as 'Product_Name', PurchaseProductPrice as 'Purchase_Price', PurchaseQuantity as 'Product_Quantity',  (SELECT LocationMainName FROM LocationMain WHERE LocationMainID = PurchaseWarehouseID) as 'Warehouse', (SELECT LocationName FROM Location WHERE LocationID = PurchaseFloorID) as 'Floor' FROM Purchase, Product WHERE Purchase.PurchaseNo=@purchase_no AND Product.ID=Purchase.PurchaseProductID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_StockReport]    Script Date: 6/12/2017 11:13:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_StockReport]
AS
BEGIN
SELECT CategoryMain.MaincategoryName, Category.CategoryName, CategorySub.SubCategoryName, Product.Code, Product.Name, Unit.UnitName, ProductDetails.Stock, LocationMain.LocationMainName, Location.LocationName
FROM         Product INNER JOIN
                      Unit ON Product.UnitID = Unit.UnitID INNER JOIN
                      ProductDetails ON Product.ID = ProductDetails.ProductID INNER JOIN
                      LocationMain ON ProductDetails.WarehouseID = LocationMain.LocationMainID INNER JOIN
                      Category ON Product.CategoryID = Category.CategoryID INNER JOIN
                      CategorySub ON Product.SubCategoryID = CategorySub.SubCategoryID INNER JOIN
                      CategoryMain ON Product.MainCateID = CategoryMain.MainCategoryID INNER JOIN
                      Location ON ProductDetails.RackID = Location.LocationID
GROUP BY CategoryMain.MaincategoryName, Category.CategoryName, CategorySub.SubCategoryName, Product.Code, Product.Name, Unit.UnitName, ProductDetails.Stock, LocationMain.LocationMainName, Location.LocationName
END

GO
USE [master]
GO
ALTER DATABASE [WAREHOUSE] SET  READ_WRITE 
GO
